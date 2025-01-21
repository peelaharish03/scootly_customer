import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pinput/pinput.dart';
import 'package:scootly_customer/core/constants/colors.dart';
import 'package:scootly_customer/core/constants/const_button.dart';
import 'package:scootly_customer/presentation/cubits/AuthCubits/signin/signin_cubit.dart';
import 'package:scootly_customer/presentation/cubits/AuthCubits/trigger_otp/trigger_otp_cubit.dart';

class OtpScreen extends StatelessWidget {
  final String otp;
  final String mobileNumber;

  OtpScreen({super.key, required this.mobileNumber, required this.otp});

  final TextEditingController otpFieldController = TextEditingController();
  var otpValue = '';
  var focusNode = FocusNode();

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    double padding = screenWidth * 0.06;
    double fontSize = screenWidth > 600 ? 18.0 : 14.0;

    return Scaffold(
      backgroundColor: AppColor.green,
      body: Column(
        children: [
          Expanded(
            child: Center(
              child: Text(
                'Scootly',
                style: TextStyle(
                  color: AppColor.fullwhite,
                  fontSize: screenWidth * 0.08,
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          Container(
            width: double.infinity,
            height: screenHeight * 0.45,
            padding: EdgeInsets.all(screenWidth * 0.06),
            decoration: BoxDecoration(
              color: AppColor.fullwhite,
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(30),
                topRight: Radius.circular(30),
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Login',
                  style: TextStyle(
                    fontSize: screenWidth * 0.07,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Poppins',
                    color: AppColor.black,
                  ),
                ),
                const SizedBox(height: 8),
                RichText(
                  text: TextSpan(
                    text: 'Otp Has Sent To ',
                    style: TextStyle(
                      color: AppColor.black,
                      fontFamily: 'Poppins',
                      fontSize: screenWidth * 0.04,
                    ),
                    children: [
                      TextSpan(
                        text: '+91 $mobileNumber',
                        style: TextStyle(
                          color: AppColor.green,
                          fontFamily: 'Poppins',
                          fontSize: screenWidth * 0.04,
                        ),
                      ),
                    ],
                  ),
                ),
                otp == 'true'
                    ? const SizedBox()
                    : Center(
                        child: Text(
                          'OTP: $otp',
                          style: const TextStyle(
                              color: Colors.grey,
                              fontSize: 16,
                              fontStyle: FontStyle.normal),
                        ),
                      ),
                // Column(
                //   children: [
                //     const SizedBox(height: 16),
                //     Center(
                //       child: Text(
                //         otp,
                //         style: TextStyle(
                //           fontFamily: 'Poppins',
                //           fontSize: screenWidth * 0.04,
                //           color: AppColor.black,
                //         ),
                //       ),
                //     ),
                //   ],
                // ),
                const SizedBox(height: 16),
                _otpInput(context),
                const SizedBox(height: 16),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Didn't get? ",
                      style: TextStyle(
                        color: AppColor.black,
                        fontFamily: 'Poppins',
                        fontSize: screenWidth * 0.04,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        final triggerOtpCubit = context.read<TriggerOtpCubit>();
                        triggerOtpCubit.fetchOtp(context, mobileNumber);
                      },
                      child: Text(
                        'Resend',
                        style: TextStyle(
                          color: AppColor.green,
                          fontSize: screenWidth * 0.04,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'Poppins',
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 24),
                SizedBox(
                  width: double.infinity,
                  child: CustomButton(
                    buttonText: 'Login',
                    buttonColor: AppColor.green,
                    textColor: AppColor.fullwhite,
                    onPressed: () {
                      final signInCubit = context.read<SignInCubit>();
                      signInCubit.SignIn(
                        context,
                        mobileNumber,
                        otpFieldController.text,
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _otpInput(BuildContext context) {
    return Pinput(
      controller: otpFieldController,
      length: 6,
      focusNode: FocusNode(),
      defaultPinTheme: PinTheme(
        width: 50,
        height: 60,
        textStyle: TextStyle(
          fontSize: 18,
          color: AppColor.black,
          fontWeight: FontWeight.bold,
        ),
        decoration: BoxDecoration(
          color: AppColor.fullwhite,
          border: Border.all(color: AppColor.grey),
          borderRadius: BorderRadius.circular(8),
        ),
      ),
      preFilledWidget: const Center(
        child: Text(
          '0',
          style: TextStyle(
            fontSize: 18,
            color: Colors.grey,
          ),
        ),
      ),
      onCompleted: (value) {
        final signInCubit = context.read<SignInCubit>();
        signInCubit.SignIn(context, mobileNumber, value);
      },
    );
  }
}
