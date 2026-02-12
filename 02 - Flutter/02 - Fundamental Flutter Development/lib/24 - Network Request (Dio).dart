// Run "flutter pub add dio" in terminal to add "Dio" package before using this code.
// "Dio" is a powerful HTTP client for Dart/Flutter which supports Interceptors, Global configuration, FormData, File downloading, Timeout, etc.

import 'package:flutter/material.dart';
import 'package:dio/dio.dart';

void main() {
  runApp(const MyApp());
}

// Self-defined "Dio" utility class (helper class) for network request.
class DioUtil {
  final Dio _dio = Dio(); // Create Dio instance.

  DioUtil() {
    /* Basic Option */
    _dio.options.baseUrl = "https://698dc106b79d1c928ed666d7.mockapi.io/api/"; // Set base URL.
    _dio.options.connectTimeout = const Duration(seconds: 10); 
    _dio.options.receiveTimeout = const Duration(seconds: 10); 
    _dio.options.sendTimeout = const Duration(seconds: 10); 

    /* Interceptors */
    _dio.interceptors.add(InterceptorsWrapper(
      // Parameter "handler" is used to continue or reject the request/response/error.
      // If there is multiple interceptors, "handler.next" will pass the request/response/error to the next interceptor.
      // If it is the last interceptor, "handler.next" will pass the request/response/error to "Dio" for actual processing.

      // Do something before request is sent from client to server.
      // "options" contains request information like method, path, headers, etc.
      onRequest: (options, handler) { 
        print("Request: ${options.method} ${options.path}");             // Print request method and path.
        return handler.next(options);                                    // Continue with the request.
        // return handler.reject(DioException(requestOptions: options)); // Reject the request with error.
      },

      // Do something when response is received from server to client.
      // "response" contains response information like status code, data, headers, etc.
      onResponse: (response, handler) {
        print("Response: ${response.statusCode} ${response.data}");     // Print response status code and data.

        if(response.statusCode! >= 200 && response.statusCode! < 300) { // Successful response.
          print("Request successful!");
          return handler.next(response);
        } 
        else {                                                          // Failed response.
          print("Request failed with status code: ${response.statusCode}");
          return handler.reject(DioException(requestOptions: response.requestOptions, response: response));
        }
      },

      // Do something when there is an error during request/response.
      // "e" is the DioException object containing error information.
      onError: (DioException e, handler) {
        print("Error: ${e.message}");
        // return handler.next(e); // Continue with the error.
        return handler.reject(e);  // Reject with the error.
      }
    ));
  }

  /* GET Request Method */
  // "path" is the endpoint path since we have set the base URL in the constructor.
  // "params" is the query parameters in Map format.
  Future<Response> get(String path, {Map<String, dynamic>? params}) {
    return _dio.get(path, queryParameters: params); 
    // "_dio.get" is a function in Dio package to send GET request.
    // It returns a Future<Response> object.
  }
}


// Main app widget which performs GET request and displays data in a grid view.
class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

// Main app widget which performs GET request and displays data in a grid view.
class _MyAppState extends State<MyApp> {
  List<Map<String, String>> _dataGet = []; // Store data from GET request.

  void performGetRequest() async {
    try {
      DioUtil dioUtil = DioUtil(); // Create "DioUtil" instance to use methods inside it.

      Response response = await dioUtil.get("itemList"); // Send GET request to "https://698dc106b79d1c928ed666d7.mockapi.io/api/itemList" and wait for response.

      // Handle response data and convert it to List<Map<String, String>> format for easier use in UI.
      List<dynamic> rawData = response.data;
      List<Map<String, String>> parsedData = rawData.map((item) {
        Map<String, dynamic> itemAsMap = item as Map<String, dynamic>;
        return itemAsMap.map((key, value) => MapEntry(key, value.toString()));
      }).toList();

      setState(() => _dataGet = parsedData); // Update state with new data to trigger UI rebuild and display the data in grid view.
    } catch (e) {
      print("An error occurred while fetching or parsing data: $e");
    }
  }

  @override
  void initState() {
    super.initState();
    performGetRequest(); // Perform GET request when app starts.
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Stack(
          children: [
            GridView.builder(
              scrollDirection: Axis.vertical,
              padding: EdgeInsets.all(20), 

              gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent( 
                maxCrossAxisExtent: 150,
                mainAxisSpacing: 5,
                crossAxisSpacing: 5
              ),

              itemCount: _dataGet.length,                        
              itemBuilder: (context, index) => Container(
                alignment: Alignment.center,
                margin: EdgeInsets.all(5),
                decoration: BoxDecoration(
                  color: Colors.blue[100],
                  border: Border.all(color: Colors.blue),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Text("Name: ${_dataGet[index]["Name"]}\nInfo: ${_dataGet[index]["Info"]}") // Display "Name" and "Info" fields from the data.
              )
            ),

            Positioned(
              bottom: 30,
              left: 30,
              child: ElevatedButton(onPressed: performGetRequest, child: Text("GET Request")) // Button to trigger GET request.
            )
          ]
        )
      )
    );
  }
}