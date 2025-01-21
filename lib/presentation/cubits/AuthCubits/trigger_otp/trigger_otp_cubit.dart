import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:scootly_customer/domain/usecases/AuthUsecases/trigger_otp_validation_usecase.dart';
import 'package:scootly_customer/presentation/screens/auth/otp_screen.dart';
import 'trigger_otp_state.dart';

class TriggerOtpCubit extends Cubit<TriggerOtpState> {
  final TriggerOtpValidationUseCase otpUseCase;

  TriggerOtpCubit(this.otpUseCase) : super(TriggerOtpInitial());

  Future<void> fetchOtp(BuildContext context, String mobileNumber) async {
    if (mobileNumber.isEmpty) {
      _showErrorDialog(context, 'Please enter a mobile number');
      return;
    } else if (mobileNumber.length < 10) {
      _showErrorDialog(context, 'Please enter a valid mobile number');
      return;
    }
    try {
      emit(TriggerOtpLoading());
      final otpEntity = await otpUseCase(mobileNumber);
      emit(TriggerOtpLoaded(otpEntity));

      String otpValue;
      if (otpEntity.data?.otp?.isNotEmpty == true) {
        otpValue = otpEntity.data!.otp!;
      } else {
        otpValue = 'true';
      }
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => OtpScreen(
            mobileNumber: mobileNumber,
            otp: otpValue,
          ),
        ),
      );
      print('OTP response received and stored in state');
    } catch (e) {
      print('Failed to load OTP data: $e');
      emit(TriggerOtpError('Failed to load OTP data: ${e.toString()}'));
      _showErrorDialog(context, 'An error occurred while fetching OTP.');
    }
  }

  void _showErrorDialog(BuildContext context, String message) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Error'),
          content: Text(message),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('OK'),
            ),
          ],
        );
      },
    );
  }
}
