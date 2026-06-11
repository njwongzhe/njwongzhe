<?php
    // Set response header for browser or command-line output
    header("Content-Type: text/plain; charset=UTF-8");

    /* Deserialization: json_decode() */
    echo "------------------>>> Deserialization: json_decode()\n";
    // Syntax: json_decode($json_string, $associative, $depth, $flags)
    // $json_string - The JSON string to be decoded.
    // $associative - When true, returned objects will be converted into associative arrays. Defaults to false (returns stdClass objects).
    // $depth       - User specified recursion depth (default: 512). (If depth of the JSON Object is greater than this value, it will return null)
    // $flags       - Bitmask of JSON decode options.
    //              - JSON_THROW_ON_ERROR   - Throw an exception if the JSON is invalid.
    //              - JSON_BIGINT_AS_STRING - Convert large integers to strings.
    //              - JSON_OBJECT_AS_ARRAY  - Convert JSON objects into associative arrays.

    // 1. json_decode to Object (stdClass)
    $jsonString = '{"name":"Brendan Eich","matric_no":"AC123","isActive":true}';
    $userObj = json_decode($jsonString);
    echo "Basic Parsed Object type: " . get_class($userObj) . "\n"; // Output: stdClass
    echo "Accessing Property (name): " . $userObj->name . "\n";     // Output: Brendan Eich

    // 2. json_decode to Associative Array
    $userArr = json_decode($jsonString, true);
    echo "Basic Parsed Array type: " . gettype($userArr) . "\n";       // Output: array
    echo "Accessing Array Element (name): " . $userArr['name'] . "\n"; // Output: Brendan Eich

    // 3. Error Handling (Traditional)
    $invalidJson = '{"name": "Rasmus Lerdof",}'; // Invalid JSON due to trailing comma.
    $result = json_decode($invalidJson);
    if ($result === null && json_last_error() !== JSON_ERROR_NONE) 
        echo "Traditional JSON Decode Error: " . json_last_error_msg() . "\n"; // Output: Syntax error

    // 4. Error Handling (Modern PHP 7.3+ with Exception)
    try {
        $result = json_decode($invalidJson, false, 512, JSON_THROW_ON_ERROR);
    } catch (JsonException $e) {
        echo "Modern JSON Exception Caught: " . $e->getMessage() . "\n";
    }

    echo "\n";



    /* Serialization: json_encode() */
    echo "------------------>>> Serialization: json_encode()\n";
    // Syntax: json_encode($value, $flags, $depth)
    // $value - The value being encoded. Can be any type except a resource.
    // $flags - Bitmask of JSON encode options.
    // $depth - Set the maximum depth. Must be greater than zero.

    $developer = [
        "name" => "Rasmus Lerdof",
        "language" => "PHP",
        "experienceYears" => 30,
        "isAdmin" => false,
        "secretCode" => null, // null is preserved in JSON.
    ];

    // 1. Basic Encoding
    $basicJsonStr = json_encode($developer);
    echo "Basic Encoded JSON:\n" . $basicJsonStr . "\n"; // Output: {"name":"Rasmus Lerdof","language":"PHP","experienceYears":30,"isAdmin":false,"secretCode":null}

    // 2. Pretty Print Option (equivalent of space argument in JS stringify)
    $prettyJsonStr = json_encode($developer, JSON_PRETTY_PRINT);
    echo "Pretty Printed JSON:\n" . $prettyJsonStr . "\n";

    // 3. Forced Object Option
    $numericArray = [10, 20, 30];
    echo "Normal Array Encoded: " . json_encode($numericArray) . "\n"; // Output: [10,20,30]
    echo "Forced Object Encoded: " . json_encode($numericArray, JSON_FORCE_OBJECT) . "\n"; // Output: {"0":10,"1":20,"2":30}
?>
