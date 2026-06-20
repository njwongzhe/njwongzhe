<?php
    // Include vendor files for JWT library.
    require_once __DIR__ . '/vendor/autoload.php';

    // Use classes from vendor that are used in this project.
    use Firebase\JWT\JWT; // Import the JWT class.
    use Firebase\JWT\Key; // Import the Key class.

    // Define the secret key and algorithm for JWT signing and verification.
    const JWT_KEY = "myVeryLongSecretKeyForCPAD25262JWTAuthentication2026";
    const ALGORITHM = 'HS256';

    // Helper function to create and set a JWT cookie.
    function createJWTCookie(string $username, string $role, int $expirySeconds) : void {
        // Create payload array containing user data and expiration time.
        $payload = [
            "username" => $username,
            "role" => $role,
            "exp" => time() + $expirySeconds
        ];

        // Encode the JWT payload using the secret key and algorithm.
        $jwt = JWT::encode($payload, JWT_KEY, ALGORITHM);
        
        // Set cookie named "jwt" accessible across the site.
        setcookie("jwt", $jwt, time() + $expirySeconds);
    }

    // Helper function to delete the JWT cookie.
    function removeJWTCookie() : void {
        setcookie("jwt", "", time() - 3600);
    }

    // Helper function to decode and return the JWT payload object if valid.
    function decodeJWTCookie() : ?object {
        // Check if the JWT cookie is set.
        if (!isset($_COOKIE['jwt'])) 
            return null;
        
        try {
            // Decode the JWT payload using the secret key and algorithm.
            $jwt = $_COOKIE['jwt'];
            return JWT::decode($jwt, new Key(JWT_KEY, ALGORITHM));
        } catch (Exception $e) {
            // Token is invalid, expired or tampered with.
            return null;
        }
    }

    // Helper function to handle login credentials and JWT cookie creation.
    function handleLogin() : ?string {
        if ($_SERVER['REQUEST_METHOD'] === 'POST' && isset($_POST['action']) && $_POST['action'] === 'login') {
            $username = trim($_POST['username'] ?? '');
            $password = $_POST['password'] ?? '';

            if ($username === 'admin' && $password === 'adminPass') {
                createJWTCookie($username, "Administrator", 180); // 3 Minutes
                header("Location: login.php");
                exit;
            } elseif ($username === 'cash01' && $password === 'cashPass') {
                createJWTCookie($username, "Cashier", 300); // 5 Minutes
                header("Location: login.php");
                exit;
            } else {
                return "Invalid username or password!";
            }
        }
        return null;
    }

    // Helper function to handle logout action.
    function handleLogout() : void {
        if ($_SERVER['REQUEST_METHOD'] === 'POST' && isset($_POST['action']) && $_POST['action'] === 'logout') {
            removeJWTCookie();
            header("Location: login.php");
            exit;
        }
    }
?>
