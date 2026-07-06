<?php

use Psr\Http\Message\ResponseInterface as Response;
use Psr\Http\Message\ServerRequestInterface as Request;
use Slim\Factory\AppFactory;
use Firebase\JWT\JWT;
use Firebase\JWT\Key;

require __DIR__ . "/../vendor/autoload.php";

$app = AppFactory::create();

// $app->setBasePath("/cpad-slim");
$app->addRoutingMiddleware();
$app->addErrorMiddleware(true, true, true);

$key = "LongKeyForSlimJWTAuthentication32Bytes!";

$app->get("/", function (Request $request, Response $response, $args) {
    $response->getBody()->write("Welcome to Login System");
    return $response;
});

// --- User login ---
$app->post("/api/login", function (Request $request, Response $response, $args) {
    $payload = ["success" => true, "error" => null, "data" => null];
    $key = "LongKeyForSlimJWTAuthentication32Bytes!";

    try {
        require __DIR__ . "/libs/dbConnect.php";

        $data = json_decode($request->getBody()->getContents(), true);

        $stmlUsers = $pdo->prepare("SELECT * FROM users WHERE username=:name AND password=:pass");
        $stmlUsers->execute([
            ":name" => $data["name"],
            ":pass" => $data["pass"]
        ]);
        $user = $stmlUsers->fetch();

        if ($user) {
            $payload["data"] = $user;

            $loginData = [
                "userId" => $user["userId"],
                "username" => $user["username"],
                "exp" => time() + 3600
            ];

            $jwt = JWT::encode($loginData, $key, "HS256");

            setcookie("jwt", $jwt, time() + 3600);
        } else {
            throw new Exception("User not exists.");
        }
    } catch (Exception $err) {
        $payload["success"] = false;
        $payload["error"] = $err;
    }

    $response->getBody()->write(json_encode($payload));
    return $response->withHeader("Content-Type", "application/json");
});

// --- Get login status ---
$app->get("/api/login-status", function (Request $request, Response $response, $args) {
    $payload = ["success" => true, "error" => null, "data" => null];
    $key = "LongKeyForSlimJWTAuthentication32Bytes!";

    try {
        $jwt = $_COOKIE["jwt"] ?? null;
        if ($jwt) {
            $decoded = JWT::decode($jwt, new Key($key, "HS256"));
            $payload["data"] = [
                "userId" => $decoded->userId,
                "username" => $decoded->username
            ];
        } else {
            $payload["success"] = false;
            $payload["error"] = "Not logged in.";
        }
    } catch (Exception $err) {
        $payload["success"] = false;
        $payload["error"] = $err->getMessage();
    }

    $response->getBody()->write(json_encode($payload));
    return $response->withHeader("Content-Type", "application/json");
});

// --- Logout user ---
$app->post("/api/logout", function (Request $request, Response $response, $args) {
    $payload = ["success" => true, "error" => null, "data" => null];

    try {
        setcookie("jwt", "", time() - 3600);
    } catch (Exception $err) {
        $payload["success"] = false;
        $payload["error"] = $err->getMessage();
    }

    $response->getBody()->write(json_encode($payload));
    return $response->withHeader("Content-Type", "application/json");
});

// --- Read all users ---
$app->get("/api/users", function (Request $request, Response $response, $args) {
    $payload = ["success" => true, "error" => null, "data" => null];

    try {
        require __DIR__ . "/libs/dbConnect.php";

        $stmlUsers = $pdo->prepare("SELECT * FROM users");
        $stmlUsers->execute();

        $payload["data"] = $stmlUsers->fetchAll();
    } catch (Exception $err) {
        $payload["success"] = false;
        $payload["error"] = $err;
    }

    $response->getBody()->write(json_encode($payload));
    return $response->withHeader("Content-Type", "application/json");
});

// --- Register new user ---
$app->post("/api/users", function (Request $request, Response $response, $args) {
    $payload = ["success" => true, "error" => null, "data" => null];

    try {
        require __DIR__ . "/libs/dbConnect.php";

        $data = json_decode($request->getBody()->getContents(), true);

        $name = $data["name"];
        $pass = $data["pass"];

        $stmlRegister = $pdo->prepare("INSERT INTO users (username, password) VALUES (:name, :pass)");
        $stmlRegister->execute([
            ":name" => $name,
            ":pass" => $pass
        ]);

        $newId = $pdo->lastInsertId();
        $stmlUsers = $pdo->prepare("SELECT * FROM users WHERE userId=:id");
        $stmlUsers->execute([":id" => $newId]);
        $payload["data"] = $stmlUsers->fetch();
    } catch (Exception $err) {
        $payload["success"] = false;
        $payload["error"] = $err;
    }

    $response->getBody()->write(json_encode($payload));
    return $response->withHeader("Content-Type", "application/json");
});

// --- Update certain user ---
$app->put("/api/users", function (Request $request, Response $response, $args) {
    $payload = ["success" => true, "error" => null, "data" => null];

    try {
        require __DIR__ . "/libs/dbConnect.php";

        $data = json_decode($request->getBody()->getContents(), true);

        $id = $data["userId"];
        $newName = $data["name"];
        $newPass = $data["pass"];

        $stmlUpdate = $pdo->prepare("UPDATE users SET username=:name, password=:pass WHERE userId=:id");
        $stmlUpdate->execute([
            ":name" => $newName,
            ":pass" => $newPass,
            ":id" => $id
        ]);

        $stmlUsers = $pdo->prepare("SELECT * FROM users WHERE userId=:id");
        $stmlUsers->execute([":id" => $id]);
        $payload["data"] = $stmlUsers->fetch();
    } catch (Exception $err) {
        $payload["success"] = false;
        $payload["error"] = $err;
    }

    $response->getBody()->write(json_encode($payload));
    return $response->withHeader("Content-Type", "application/json");
});

// --- Delete exist user ---
$app->delete("/api/users", function (Request $request, Response $response, $args) {
    $payload = ["success" => true, "error" => null, "data" => null];

    try {
        require __DIR__ . "/libs/dbConnect.php";

        $data = json_decode($request->getBody()->getContents(), true);

        $id = $data["userId"];

        $stmlUsers = $pdo->prepare("SELECT * FROM users WHERE userId=:id");
        $stmlUsers->execute([":id" => $id]);
        $payload["data"] = $stmlUsers->fetch();

        $stmlUpdate = $pdo->prepare("DELETE FROM users WHERE userId=:id");
        $stmlUpdate->execute([":id" => $id]);
    } catch (Exception $err) {
        $payload["success"] = false;
        $payload["error"] = $err;
    }

    $response->getBody()->write(json_encode($payload));
    return $response->withHeader("Content-Type", "application/json");
});

$app->run();
