<?php
	require __DIR__ . '/../vendor/autoload.php';

	use Slim\Psr7\Factory\ServerRequestFactory;
	use Slim\Psr7\Factory\StreamFactory;
	use Slim\Psr7\Factory\UploadedFileFactory;

	/**
	 * =====================================================================
	 * Phase 1: The Single Data Source (Simulating Raw Network Traffic)
	 * =====================================================================
	 * This is the "exact same data" you requested. We simulate a single, raw HTTP request just arriving from the browser.
	 */
	$rawMethod = 'POST';
	$rawUrl    = 'http://localhost:8080/php-slim/menus?type=Drink&sort=desc';
	$rawHeaders = [
		'Content-Type' => 'application/json',
		'Authorization' => 'Bearer token-12345'
	];
	// The raw JSON string. (A single block of plain text.)
	$rawBodyString = '{"name": "Ice Boba Tea", "price": 5.50}';

	// (Exception: To demonstrate getUploadedFiles, we must create a real temp file because raw JSON text cannot contain actual binary file data.)
	$tmpFilePath = tempnam(sys_get_temp_dir(), 'demo');
	file_put_contents($tmpFilePath, 'fake image binary data');

	/**
	 * =====================================================================
	 * Phase 2: Server Under-the-Hood Assembly (Do Not Focus on This)
	 * =====================================================================
	 * This simulates what Apache and Slim Framework do behind the scenes: packaging the raw text above into a standard $request object. 
	 * Once packaged, no more data is added. We only extract from here on.
	 */
	$factory = new ServerRequestFactory();
	$request = $factory->createServerRequest($rawMethod, $rawUrl);
	foreach ($rawHeaders as $k => $v) { $request = $request->withHeader($k, $v); }
	$streamFactory = new StreamFactory();
	$request = $request->withBody($streamFactory->createStream($rawBodyString));
	$request = $request->withParsedBody(json_decode($rawBodyString, true)); // Simulating BodyParsingMiddleware.
	$fileFactory = new UploadedFileFactory();
	$mockFile = $fileFactory->createUploadedFile($streamFactory->createStreamFromFile($tmpFilePath), filesize($tmpFilePath), UPLOAD_ERR_OK, 'boba.png', 'image/png');
	$request = $request->withUploadedFiles(['menu_image' => $mockFile]);

	/**
	 * =====================================================================
	 * Phase 3: Hardcore Anatomy / Extraction Comparison
	 * =====================================================================
	 * Testing how 12 different methods extract data from the EXACT SAME $request.
	 */

	// 1. getMethod()
	// Purely extracts the HTTP action verb.
	echo "[1] getMethod() \n";
	echo "Result: " . $request->getMethod() . "\n\n";
	// Output: POST

	// 2. getUri()
	// Returns a URI object. When printed as a string, it gives the full URL.
	echo "[2] getUri() \n";
	echo "Result: " . (string)$request->getUri() . "\n\n";
	// Output: http://localhost:8080/php-slim/menus?type=Drink&sort=desc

	// 3. getUri()->getPath()
	// Strips away the domain and query parameters, leaving only the routing path.
	echo "[3] getUri()->getPath() \n";
	echo "Result: " . $request->getUri()->getPath() . "\n\n";
	// Output: /php-slim/menus

	// 4. getQueryParams()
	// Specifically targets the variables after the '?' in the URL and parses them into a PHP array.
	echo "[4] getQueryParams() \n";
	echo "Result: \n";
	print_r($request->getQueryParams());
	echo "\n";
	// Output: 
	// Array
	// (
	//     [type] => Drink
	//     [sort] => desc
	// )

	// 5. getBody()->getContents()
	// The raw mirror. It outputs the exact, untouched plain text/JSON string sent by the client.
	echo "[5] getBody()->getContents() \n";
	echo "Result: " . $request->getBody()->getContents() . "\n\n";
	// Output: {"name": "Ice Boba Tea", "price": 5.50}

	// 6. getParsedBody()
	// The scalpel. It automatically decodes the raw JSON string above into a usable PHP associative array.
	echo "[6] getParsedBody() \n";
	echo "Result: \n";
	print_r($request->getParsedBody());
	echo "\n";
	// Output: 
	// Array
	// (
	//     [name] => Ice Boba Tea
	//     [price] => 5.5
	// )

	// 7. hasHeader()
	// A quick boolean check to see if a specific header exists (useful for auth checks).
	echo "[7] hasHeader('Authorization') \n";
	echo "Result: " . ($request->hasHeader('Authorization') ? 'TRUE' : 'FALSE') . "\n\n";
	// Output: TRUE

	// 8. getHeader()
	// Always returns an array, even for a single value, because HTTP allows multiple headers with the same name.
	echo "[8] getHeader('Content-Type') \n";
	echo "Result: \n";
	print_r($request->getHeader('Content-Type'));
	echo "\n";
	// Output: 
	// Array
	// (
	//     [0] => application/json
	// )

	// 9. getHeaderLine()
	// Returns the header values as a single comma-separated string. The most commonly used method for headers.
	echo "[9] getHeaderLine('Content-Type') \n";
	echo "Result: " . $request->getHeaderLine('Content-Type') . "\n\n";
	// Output: application/json

	// 10. getUploadedFiles()
	// Separates binary file data from the request and converts it into easy-to-use UploadedFile objects.
	echo "[10] getUploadedFiles() \n";
	$files = $request->getUploadedFiles();
	echo "Result: File name: " . $files['menu_image']->getClientFilename() . ", Size: " . $files['menu_image']->getSize() . " bytes.\n\n";
	// Output: File name: boba.png, Size: 22 bytes.

	// 11. withAttribute()
	// Internal mutation setting the attribute. Attributes are not sent by the client; they are internal tags attached by your backend code.
	echo "[11] \$request->withAttribute('user_id', 99) is executing...\n";
	$request = $request->withAttribute('user_id', 99); 
	echo "\n";
	// Output: (No output)

	// 12. getAttribute()
	// Retrieves the internal tag that was previously attached to the request by middleware or routing.
	echo "[12] getAttribute('user_id') \n";
	echo "Result: " . $request->getAttribute('user_id') . "\n\n";
	// Output: 99
?>