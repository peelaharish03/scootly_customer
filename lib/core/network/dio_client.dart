import 'dart:developer';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:scootly_customer/core/constants/api_constants.dart';
import 'package:scootly_customer/main.dart';
import 'package:scootly_customer/presentation/screens/auth/SignIn_page.dart';
import 'package:shared_preferences/shared_preferences.dart';

class DioClient {
  final Dio dio;
  final FlutterSecureStorage secureStorage;

  DioClient(this.dio, {required this.secureStorage}) {
    print('baseUrl::$baseUrl');
    dio
      ..options.baseUrl = baseUrl
      ..options.connectTimeout = const Duration(seconds: 30)
      ..options.receiveTimeout = const Duration(seconds: 30)
      ..options.headers = {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
      };

    dio.interceptors.add(InterceptorsWrapper(
      onRequest: (options, handler) async {
        SharedPreferences prefs = await SharedPreferences.getInstance();
        String? token = prefs.getString('TOKEN');

        if (token != null) {
          options.headers["Authorization"] = "Bearer $token";
        }

        log('REQUEST[${options.method}] => PATH: ${options.path} '
            '=> Request Values: ${options.queryParameters}, => HEADERS: ${options.headers}');
        return handler.next(options);
      },
      onResponse: (response, handler) {
        log('RESPONSE[${response.statusCode}] => DATA: ${response.data}');
        return handler.next(response);
      },
      onError: (DioException error, handler) async {
        final statusCode = error.response?.statusCode;
        final errorMessage =
            error.response?.data['message'] ?? 'Unknown error occurred';

        log('ERROR[$statusCode] => MESSAGE: $errorMessage');

        if (statusCode == 401) {
          log("Error: Unauthorized access - token may have expired");

          await secureStorage.delete(key: 'TOKEN');
          SharedPreferences prefs;
          prefs = await SharedPreferences.getInstance();
          prefs.setString('TOKEN', '');
          print('prefs:::$prefs');
          navigatorKey.currentState?.pushAndRemoveUntil(
            MaterialPageRoute(builder: (_) => SigninPage()),
            (route) => false,
          );
        } else if (statusCode == 404) {
          log("Error: Resource not found");
        } else if (statusCode == 500) {
          log("Error: Server error");
        }

        return handler.next(error);
      },
    ));
  }

  void init() {}
}
