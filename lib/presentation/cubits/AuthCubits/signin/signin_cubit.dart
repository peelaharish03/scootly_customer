import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:scootly_customer/domain/usecases/AuthUsecases/signin_validation_usecase.dart';
import 'package:scootly_customer/presentation/screens/dashboard/dashboard.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'signin_state.dart';

class SignInCubit extends Cubit<SignInState> {
  final SignInValidationUseCase signInUseCase;

  SignInCubit(this.signInUseCase) : super(SignInInitial());

  Future<void> SignIn(BuildContext context, mobileNumber, String otp) async {
    print(
        'trigger otp 1 mobileNumber$mobileNumber--$otp---------${otp.length}');
    if (otp.isEmpty) {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text('Error'),
            content: const Text('Please enter otp'),
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
      return;
    } else if (otp.length < 6) {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text('Error'),
            content: const Text('Please enter valid otp'),
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
      return;
    } else {
      try {
        emit(SignInLoading());
        final signEntity = await signInUseCase(mobileNumber, otp);
        if (signEntity.status == 'SUCCESS') {
          SharedPreferences prefs;
          prefs = await SharedPreferences.getInstance();
          prefs.setString('TOKEN', signEntity.data?.token ?? '');
          Navigator.of(context).pushAndRemoveUntil(
            MaterialPageRoute(
              builder: (context) => DashBoardScreen(),
            ),
            (Route<dynamic> route) => false,
          );
        } else {
          showDialog(
            context: context,
            builder: (BuildContext context) {
              return AlertDialog(
                title: const Text('Error'),
                content: const Text('Invalid OTP'),
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
        emit(SignInLoaded(signEntity));
      } catch (e) {
        emit(SignInError('Failed to load OTP data: ${e.toString()}'));
      }
    }
  }
}
