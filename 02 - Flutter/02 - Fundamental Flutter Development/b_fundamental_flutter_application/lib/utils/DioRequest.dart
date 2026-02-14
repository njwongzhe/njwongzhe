import 'package:b_fundamental_flutter_application/constants/index.dart';
import 'package:dio/dio.dart';

class DioRequest {
  final _dio = Dio();

  DioRequest() {
    _dio.options.baseUrl = GlobalConstants.BASE_URL;
    _dio.options.connectTimeout = Duration(seconds: GlobalConstants.TIME_OUT); 
    _dio.options.receiveTimeout = Duration(seconds: GlobalConstants.TIME_OUT); 
    _dio.options.sendTimeout = Duration(seconds: GlobalConstants.TIME_OUT); 

    _dio.interceptors.add(InterceptorsWrapper(
      onRequest: (options, handler) { 
        return handler.next(options);
      },
      onResponse: (response, handler) {
        if(response.statusCode! >= 200 && response.statusCode! < 300) {
          return handler.next(response);
        }
        return handler.reject(DioException(requestOptions: response.requestOptions)); // Error & Reject
      },
      onError: (DioException e, handler) {
        return handler.reject(e);
      },
    ));
  }

  // GET Request Method
  Future<Response> get(String path, {Map<String, dynamic>? params}) {
    return _dio.get(path, queryParameters: params); 
  }
}