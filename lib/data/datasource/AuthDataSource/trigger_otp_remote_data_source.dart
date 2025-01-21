import 'dart:convert';
import 'package:dio/dio.dart'; // Ensure you're importing the correct dio package
import 'package:scootly_customer/core/constants/api_constants.dart';
import '../../models/AuthModels/trigger_otp_model.dart';

abstract class TriggerOtpRemoteDataSource {
  Future<TriggerOtpModel> fetchOtp(String mobileNumber);
}

class TriggerOtpRemoteDataSourceImpl implements TriggerOtpRemoteDataSource {
  final Dio client;

  TriggerOtpRemoteDataSourceImpl({required this.client});

  @override
  Future<TriggerOtpModel> fetchOtp(String mobileNumber) async {
    final payload = {
      "otpType": "SIGNIN",
      "primaryContact": mobileNumber,
    };

    try {
      final response = await client.post(
        triggerOtp,
        data: json.encode(payload),
      );

      if (response.statusCode == 200) {
        return TriggerOtpModel.fromJson(response.data);
      } else {
        throw Exception('Failed to load OTP data: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Failed to load OTP data: ${e.toString()}');
    }
  }
}
