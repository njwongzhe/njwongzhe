<?php
    require_once 'auth.php';

    // Trigger logout check.
    handleLogout();

    // Trigger login check and get potential errors.
    $error = handleLogin();

    // Fetch decoded token if valid.
    $userPayload = decodeJWTCookie();
    $isLoggedIn = ($userPayload !== null);
    $rawJWT = $_COOKIE['jwt'] ?? '';

    // Split JWT for visual demonstration. (header.payload.signature)
    $jwtParts = explode('.', $rawJWT);
    $headerPart = $jwtParts[0] ?? '';
    $payloadPart = $jwtParts[1] ?? '';
    $signaturePart = $jwtParts[2] ?? '';
?>

<html>
<head>
    <title>JWT Authentication & Session Demo</title>
</head>
<body>
    <center>
        <h2>JWT Authentication Demo</h2>

        <?php if (!$isLoggedIn): ?>
            <!-- LOGIN FORM -->
            <p>This is the login page, accessible to everyone.</p>
            
            <?php if ($error): ?>
                <p style="color: red;"><b>Error:</b> <?php echo htmlspecialchars($error); ?></p>
            <?php endif; ?>
            
            <form action="login.php" method="POST">
                <input type="hidden" name="action" value="login">
                Username: <input type="text" name="username" required autocomplete="off"><br><br>
                Password: <input type="password" name="password" required><br><br>
                <button type="submit">Login</button>
            </form>
            
            <p>Demo credentials:<br>
            • Admin: <code>admin</code> / <code>adminPass</code><br>
            • Cashier: <code>cash01</code> / <code>cashPass</code></p>

        <?php else: ?>
            <!-- LOGGED IN VIEW -->
            <p>Welcome, <b><?php echo htmlspecialchars($userPayload->username); ?></b> (Role: <b><?php echo htmlspecialchars($userPayload->role); ?></b>)</p>
            <p>Expires in: <?php echo max(0, $userPayload->exp - time()); ?> seconds</p>
            
            <hr width="80%">
            
            <h3>Raw JSON Web Token (from Cookie)</h3>
            <p style="font-family: monospace; word-break: break-all; background-color: #f0f0f0; padding: 15px; display: inline-block; max-width: 600px; text-align: left; border: 1px solid #ccc; border-radius: 4px;">
                <span style="color: #d9534f; font-weight: bold;"><?php echo htmlspecialchars($headerPart); ?></span>.<span style="color: #337ab7; font-weight: bold;"><?php echo htmlspecialchars($payloadPart); ?></span>.<span style="color: #5cb85c; font-weight: bold;"><?php echo htmlspecialchars($signaturePart); ?></span>
            </p>
            <p>
                <span style="color: #d9534f;">■</span> Header (Metadata) &nbsp;&nbsp;&nbsp;
                <span style="color: #337ab7;">■</span> Payload (Claims) &nbsp;&nbsp;&nbsp;
                <span style="color: #5cb85c;">■</span> Signature (Verification)
            </p>

            <hr width="80%">

            <h3>Decoded Payload Claims</h3>
            <pre style="text-align: left; background-color: #f0f0f0; padding: 15px; display: inline-block; width: 300px; border: 1px solid #ccc; border-radius: 4px;"><?php 
                echo htmlspecialchars(json_encode($userPayload, JSON_PRETTY_PRINT | JSON_UNESCAPED_SLASHES)); 
            ?></pre>

            <br><br>
            
            <form action="login.php" method="POST">
                <input type="hidden" name="action" value="logout">
                <button type="submit" style="padding: 5px 15px; font-weight: bold;">Logout</button>
            </form>
        <?php endif; ?>
    </center>
</body>
</html>
