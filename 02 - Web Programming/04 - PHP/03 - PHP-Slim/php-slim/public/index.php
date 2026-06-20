<?php
	// Step 1: Import PSR-7 HTTP message interfaces and Slim's AppFactory. (Mandatory)
	// Request and Response interfaces standardize HTTP request and response handling
	// However, you are still allowed to "use" many other interfaces as needed. These three is just the minimum required.
	use Psr\Http\Message\ResponseInterface as Response;
	use Psr\Http\Message\ServerRequestInterface as Request;
	use Slim\Factory\AppFactory;

	// Step 2: Load the Composer autoloader to automatically load Slim framework and its dependencies. (Mandatory)
	require __DIR__ . '/../vendor/autoload.php';

	// Instantiate the Slim Application object. (Mandatory)
	$app = AppFactory::create();

	// Step 3: Explicitly set the base path to match your Apache Alias or subdirectory exactly. (Optional)
	// This ensures Slim automatically strips '/php-slim' from the request URL before matching routes.
	// If you are not using Apache Alias or subdirectory, you can remove this line. (e.g. Running with "php -S localhost:8000")
	$app->setBasePath('/php-slim'); 

	// Step 4: Middleware Registration (Optional)
	
	// Middleware is a piece of software that sits between the web server and the application code.
	// It can be used to handle common tasks such as logging, authentication, and error handling.
	// Middleware can be added at any point in the application's lifecycle, and it can be used to modify or enhance the request or response.

	// Add the routing middleware, which matches incoming HTTP requests to registered routes. (Optional but Recommended)
	// The routing middleware is the core of the application, responsible for matching incoming HTTP requests to registered routes.
	// Without it, the application will not be able to route requests to the appropriate route handlers by using Route Functions. (e.g. $app->get('/'))
	$app->addRoutingMiddleware();

	// Add error handling middleware (usually added last in the middleware stack). (Optional)
	// Syntax: $app->addErrorMiddleware(displayErrorDetails, logErrors, logErrorDetails)
	// displayErrorDetails - true = display error details in response body (for development), false = hide error details (for production).
	// logErrors           - true = log errors, false = do not log errors.
	// logErrorDetails     - true = log error details, false = do not log error details.
	$app->addErrorMiddleware(true, true, true); 

	// There is still have a lot of middleware can be implemented based on your needed such as:
	// Official Built-in Middleware:
	// 1. $app->addBodyParsingMiddleware();           // Enable JSON, XML, and URL-encoded form data body parsing automatically into array.
	// 2. $app->addRoutingMiddleware();               // Perform route matching on the incoming HTTP request to locate the target handler.
	// 3. $app->addErrorMiddleware(true, true, true); // Catch exceptions and display detailed error trace, log errors, and log details.

	// Other Built-in Middleware (Used by adding "new" Keyword):
	// 4. $app->add(new Slim\Middleware\OutputBufferingMiddleware($responseFactory, $mode)); // Buffer output data stream to prevent premature chunked response headers sending.
	// 5. $app->add(new Slim\Middleware\ContentNegotiationMiddleware([...]));                // Built-in negotiation tool to handle client-preferred media type variations.
	// 6. $app->add(new Slim\Middleware\MethodOverrideMiddleware());                         // Allow traditional HTML forms to override HTTP methods using a custom _method input header.

	// Third-Party Library Middleware (Install Through Composer):
	// 7. $app->add(new Tuupola\Middleware\CorsMiddleware([...]));    // Handle Cross-Origin Resource Sharing by adding CORS headers to responses. (Requires: tuupola/cors-middleware)
	// 8. $app->add(new Tuupola\Middleware\JwtAuthentication([...])); // Authenticate incoming requests by validating JSON Web Tokens in HTTP headers. (Requires: tuupola/slim-jwt-auth)
	// 9. $app->add(new Slim\Csrf\Guard($responseFactory));           // Protect the application against Cross-Site Request Forgery attacks via token validation. (Requires: slim/csrf)
	// 10. $app->add(new Slim\Middleware\Session([...]));             // Provide secure and encrypted session management cookies across multiple route requests. (Requires: brenno-duarte/slim-session)
	// 11. $app->add(new Middlewares\Gzip());                         // Compress the final outgoing response body using GZIP to reduce network bandwidth usage. (Requires: middlewares/gzip)
	// 12. $app->add(new Middlewares\TrailingSlash(false));           // Normalize request URLs by automatically removing or adding trailing slashes smoothly. (Requires: middlewares/trailing-slash)
	// 13. $app->add(new Middlewares\Https([...]));                   // Enforce secure connections by automatically redirecting all HTTP traffic over to HTTPS. (Requires: middlewares/https)
	// 14. $app->add(new Middlewares\ResponseTime());                 // Calculate and add an X-Response-Time header showing the precise server execution duration. (Requires: middlewares/response-time)
	// 15. $app->add(new Monolog\Handler\PsrHandler($logger));        // Capture comprehensive HTTP request and response metadata into system log files. (Requires: monolog/monolog)
	// etc.

	// Step 5: Define a GET route for the root URL '/'. (Optional but Usually Be Used)
	// When visited, write "PHP-Slim App" to the response body and return the response object.
	// You will understand it at "01_HTTP_Methods.php".
	$app->get('/', function (Request $request, Response $response, $args) {
		$response->getBody()->write("PHP-Slim App");
		return $response;
	});

	// Step 6: Include the HTTP Methods explanation routes. (Optional but Usually Be Used)
	// Sometimes we are not prefer to write every route inside "index.php" since "index.php" is the main entry point of the application and it will make "index.php" file too long and messy.
	// So we can create separate files for each route and include them in "index.php". 
	require __DIR__ . '/01_HTTP_Response_From_Server.php';

	// Step 7: Run the Slim application to process the request and send the response to the browser. (Mandatory)
	$app->run();
?>