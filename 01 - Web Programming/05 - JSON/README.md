# JSON (JavaScript Object Notation)

<br />

## 1.0 - What is JSON

- JSON is a lightweight, text-based, language-independent data-interchange format. It is a strict subset of JavaScript object literals containing only values and properties (no active logic, functions, or methods).

- **JSON vs XML Comparison**:
  Both are human-readable, plain text hierarchical formats. JSON provides critical performance benefits:
  - **Parsing Speed**: Direct native browser parsing via `JSON.parse()` is faster than parsing complex XML DOM trees.
  - **Payload Weight**: Devoid of XML tag syntax verbose bloat (e.g., `{"age":30}` vs `<age>30</age>`), saving substantial bandwidth.
  - **Data Types**: JSON is natively typed (String, Number, Booleans, Array, Object, Null) whereas XML is completely untyped strings at runtime.
  - **JS Integration**: Instantly maps into JavaScript objects without manual DOM node traversal.
- **JSON Disadvantages**: Lack of namespace support, lack of native schema validation engines (like XML-DTD), and lack of native styling transformations (like XML-XSLT).

<br />

## 2.0 - Basic Structure

- **Blueprints**:
  - **Object (`{}`)**: Unordered key/value pairs.
  - **Array (`[]`)**: Ordered list of values.

- **The 7 Strict Syntax Laws**:
  1. **Strict Double Quotes**: Keys and string values must use double quotes (e.g., `"key": "value"`). Single quotes are invalid.
  2. **Lowercase Literals**: Boolean values (`true`, `false`) and `null` must be entirely lowercase.
  3. **No Trailing Commas**: Comas are separators only; trailing commas at the end of lists are syntax errors.
  4. **No Logic/Expressions**: Methods, variables, calculations or functions are strictly forbidden.
  5. **No Comments**: Standard comments (e.g., `//` or `/* */`) are banned.
  6. **No Undefined Values**: `undefined` is not supported. Use `null` instead.
  7. **Escaping Characters**: Backslashes and control characters must be escaped (e.g., `\\`, `\/`, `\n`).

- Example:
  ```json
  [
    {
      "firstname": "John",
      "lastname": "Doe",
      "age": 22,
      "skills": ["Programming", "Teaching"],
      "address": {
        "street": "123 Main St",
        "city": "New York"
      }
    }
  ]
  ```

## 3.0 - JSON Operation

- JavaScript:
```js
// 1. Deserialization: Parse a JSON string into a JavaScript value or object.
// Syntax: JSON.parse(string, reviver)
// string  - A valid JSON string.
// reviver - An optional function that transforms the resulting value before it is returned.
var obj = JSON.parse('{"name":"Brendan","age":25}');
var withDate = JSON.parse('{"date":"1995-12-04"}', function(key, value) {
    return key === 'date' ? new Date(value) : value; 
});

// 2. Serialization: Convert a JavaScript value or object into a JSON string.
// Syntax: JSON.stringify(value, replacer, space)
// value    - The value/object to convert to a JSON string.
// replacer - An optional function or array that controls which properties are included and how their values are transformed.
// space    - An optional parameter for formatting (pretty-printing). Can be a number (indentation spaces) or a string (custom indent).
var jsonStr = JSON.stringify(obj);
var prettyJson = JSON.stringify(obj, null, 4); 
var filteredJson = JSON.stringify(obj, ['name']); 
```

- PHP:
```php
// 1. Deserialization: Parse a JSON string into a PHP object or associative array.
// Syntax: json_decode($json_string, $associative, $depth, $flags)
// $json_string - The JSON string to be decoded.
// $associative - When true, returned objects will be converted into associative arrays. Defaults to false (returns stdClass objects).
// $depth       - User specified recursion depth (default: 512). (If depth of the JSON Object is greater than this value, it will return null)
// $flags       - Bitmask of JSON decode options.
//              - JSON_THROW_ON_ERROR   - Throw an exception if the JSON is invalid.
//              - JSON_BIGINT_AS_STRING - Convert large integers to strings.
//              - JSON_OBJECT_AS_ARRAY  - Convert JSON objects into associative arrays.
$obj = json_decode('{"name":"Brendan","age":25}');
$arr = json_decode('{"name":"Brendan","age":25}', true);

// 2. Serialization: Convert a PHP variable or array into a JSON string.
// Syntax: json_encode($value, $flags, $depth)
// $value - The value being encoded. Can be any type except a resource.
// $flags - Bitmask of JSON encode options.
// $depth - Set the maximum depth. Must be greater than zero.
$jsonStr = json_encode($arr);
$prettyJson = json_encode($arr, JSON_PRETTY_PRINT); 
```