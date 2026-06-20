# PHP-JWT

<br />

## 1.0 - What is PHP-JWT

- JSON Web Token (JWT) is an open standard (RFC 7519) that defines a compact and self-contained way for securely transmitting information between parties as a JSON object.
- In PHP web applications, JWT is primarily used for **stateless authentication**, allowing the server to verify user identity without storing session state in memory or a database.
- It is a highly scalable alternative to traditional cookie-based sessions, especially for APIs and microservices.

<br />

## 2.0 - Installation & Setup (Xampp Apache)

- Download and install [Composer](https://getcomposer.org/download/) first.
- Run the following command in your project root directory to install the firebase/php-jwt library:
  ```html
  composer require firebase/php-jwt
  ```
- Make sure to require the autoloader at the beginning of your PHP files to use the library:
  ```php
  require_once __DIR__ . '/vendor/autoload.php';
  ```

<br />

## 3.0 - Commands

```html
composer install
  | Install all dependencies listed in composer.json of a project.
  | Run it when you first download/clone a new project or if you deleted the vendor folder.
  | Your current directory must be the folder containing the composer.json file.
```

<br />

## 4.0 - Traditional Session vs JWT

| Feature | Session-based Authentication (Stateful) | JSON Web Token (JWT) Authentication (Stateless) |
| :--- | :--- | :--- |
| **Storage** | Stored on the server (memory, file, database, or Redis cache). | Stored on the client side (LocalStorage, SessionStorage, or Cookies). |
| **State** | **Stateful**: The server tracks session states. | **Stateless**: The server does not store session records. The token contains all claims. |
| **Scalability** | **Difficult to Scale**: Load balancers require sticky sessions or centralized stores (e.g., Redis) to share sessions across servers. | **Easily Scalable**: Any server instance can verify the token using the shared secret key without querying a database. |
| **Security Risks** | Vulnerable to **CSRF** (Cross-Site Request Forgery) because session cookies are sent automatically by browsers. | Vulnerable to **XSS** (Cross-Site Scripting) if stored in LocalStorage, or **CSRF** if stored in standard cookies. |
| **Domain Support** | Cookies are restricted to specific domains, making cross-origin requests complex. | Tokens can be sent via custom headers (e.g., `Authorization`), simplifying cross-domain APIs. |

<br />

### 4.1 - The Traditional Session Flow

1. Client logs in with credentials.
2. Server verifies credentials, creates a session in memory/DB, and returns a unique `Session ID` via a cookie.
3. Client automatically sends this `Session ID` cookie with every subsequent request.
4. Server queries the database or memory store using the `Session ID` to fetch the user session.

<br />

### 4.2 - The JWT Flow

1. Client logs in with credentials.
2. Server verifies credentials, signs a self-contained JSON token (JWT) using a **Secret Key**, and sends it back to the client.
3. Client stores the JWT (e.g., in a Cookie or LocalStorage) and manually sends it in the `Authorization: Bearer <token>` header of subsequent requests.
4. Server parses the token and verifies the signature using the **Secret Key**. Since the token is self-contained, no database lookup is required to authenticate.

<br />

## 5.0 - Security Trade-offs

<br />

### 5.1 - XSS vs CSRF Vulnerabilities

* **Cross-Site Scripting (XSS)**: An attacker injects malicious JavaScript into a website. If JWT is stored in **LocalStorage**, the JavaScript can easily read the token and hijack the user's session.
* **Cross-Site Request Forgery (CSRF)**: An attacker tricks a victim's browser into executing an unwanted action on a site where they are authenticated. If JWT is stored in **Cookies**, the browser automatically attaches the cookie to cross-site requests.

<br />

### 5.2 - The Recommended Secure Architecture

To mitigate both XSS and CSRF, store JWTs inside a secure Cookie with the following flags configured:
1. **`HttpOnly`**: Prevents client-side scripts (JavaScript) from accessing the cookie, fully neutralizing XSS token theft.
2. **`Secure`**: Directs the browser to only transmit the cookie over encrypted `HTTPS` connections.
3. **`SameSite=Strict`** or **`SameSite=Lax`**: Limits cross-site request cookie access, effectively blocking CSRF attacks.

<br />

## 6.0 - JWT Structure Analysis

A JWT is a string made of three parts separated by dots (`.`): `HEADER.PAYLOAD.SIGNATURE`.

<p align="center" width="100%">
  <code>[Base64Url Header]</code> . <code>[Base64Url Payload]</code> . <code>[Base64Url Signature]</code>
</p>

<br />

### 6.1 - Header

The header contains metadata about the token type and the algorithm used for signing (e.g., HMAC SHA256 or RSA).
```json
{
  "alg": "HS256",
  "typ": "JWT"
}
```

<br />

### 6.2 - Payload

The payload contains the **claims** (the statements about the user and additional metadata).
* **Standard Registered Claims**:
  * `iss` (Issuer): The party that issued the token.
  * `sub` (Subject): The subject of the token (usually the User ID).
  * `aud` (Audience): The recipient of the token.
  * `exp` (Expiration Time): Time after which the token is invalid.
* **Custom Claims**: Arbitrary payload data like `username` or `role`.
```json
{
  "username": "admin",
  "role": "Administrator",
  "exp": 1782012000
}
```

<br />

### 6.3 - Signature

The signature is generated by hashing the Base64Url-encoded Header, Payload, and a **Secret Key** using the algorithm defined in the Header:
```javascript
HMACSHA256(
  base64UrlEncode(header) + "." + base64UrlEncode(payload),
  secret_key
)
```
The signature is used to verify that the sender is who they claim to be and that the message has not been altered or tampered with along the way.

<br />

## 7.0 - Encode and Decode JWT (Syntax)

To perform JWT operations in PHP, we utilize the methods provided by the `firebase/php-jwt` package:

<br />

### 7.1 - Encoding (Generating a JWT)

To generate a signed token, use the static `JWT::encode()` method. It serializes the payload array and signs it with your secret key.
```php
use Firebase\JWT\JWT;

$secretKey = "myVeryLongSecretKeyForCPAD25262JWTAuthentication2026";

$payload = [
    "username" => $username,
    "role"     => $role,
    "exp"      => time() + $expirySeconds
];

// Syntax: JWT::encode(array $payload, string $key, string $alg)
$jwt = JWT::encode($payload, $secretKey, 'HS256');
```

<br />

### 7.2 - Decoding (Verifying and Parsing a JWT)

To decode and verify a token, use the static `JWT::decode()` method. In package version 6.0 and above, you must pass a `Key` instance specifying the secret key and the algorithm to prevent algorithm confusion vulnerability.
```php
use Firebase\JWT\JWT;
use Firebase\JWT\Key;

$secretKey = "myVeryLongSecretKeyForCPAD25262JWTAuthentication2026";

try {
    // Syntax: JWT::decode(string $jwt, Key $key)
    $decoded = JWT::decode($jwt, new Key($secretKey, 'HS256'));
    
    // Access payload claims using object syntax.
    $username = $decoded->username;
    $role = $decoded->role;
} catch (Exception $e) {
    // Throws exception if token is expired, signature is invalid, or tampered with.
    echo "Verification failed: " . $e->getMessage();
}
```