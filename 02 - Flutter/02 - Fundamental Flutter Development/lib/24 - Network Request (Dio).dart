// Run "flutter pub add dio" in terminal to add "Dio" package before using this code.

import 'package:flutter/material.dart';
import 'package:dio/dio.dart';

void main() {
  runApp(const MyApp());
}

// Self-defined "Dio" utility class (helper class) for network request.
class DioUtil {
  final Dio _dio = Dio(); // Create Dio instance.

  DioUtil() {
    
  }
}