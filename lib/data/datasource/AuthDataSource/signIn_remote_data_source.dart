import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:scootly_customer/core/constants/api_constants.dart';
import 'package:scootly_customer/data/models/AuthModels/sign_in_model.dart';

abstract class SignInRemoteDataSource {
  Future<SignInModel> signIn(String mobileNumber, String otp);
}

class SignInRemoteDataSourceImpl implements SignInRemoteDataSource {
  final Dio client;

  SignInRemoteDataSourceImpl({required this.client});

  @override
  Future<SignInModel> signIn(String mobileNumber, String otp) async {
    final payload = {"otp": otp, "primaryContact": mobileNumber};
    try {
      final response = await client.post(
        signinUrl,
        data: json.encode(payload),
      );
      print('Response status code: ${response.statusCode}');
      if (response.statusCode == 200) {
        print('Response data: ${response.data}');

        return SignInModel.fromJson(response.data);
      } else {
        throw Exception('Failed to load OTP data: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Failed to load OTP data: ${e.toString()}');
    }
  }
}
