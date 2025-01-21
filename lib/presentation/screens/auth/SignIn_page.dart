import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:scootly_customer/core/constants/colors.dart';
import 'package:scootly_customer/core/constants/const_button.dart';
import 'package:scootly_customer/core/injection.dart';
import 'package:scootly_customer/presentation/cubits/AuthCubits/trigger_otp/trigger_otp_cubit.dart';

class SigninPage extends StatelessWidget {
  SigninPage({super.key});

  final TextEditingController mobileNumberController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => sl<TriggerOtpCubit>(),
      child: Scaffold(
        backgroundColor: AppColor.green,
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Spacer(),
            Text(
              'Scootly',
              style: TextStyle(
                color: AppColor.fullwhite,
                fontSize: 32,
                fontWeight: FontWeight.w800,
              ),
            ),
            const Spacer(),
            Center(
              child: SizedBox(
                height: 393,
                child: Container(
                  padding: const EdgeInsets.all(24),
                  decoration: BoxDecoration(
                    color: AppColor.fullwhite,
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(30),
                      topRight: Radius.circular(30),
                    ),
                    boxShadow: const [
                      BoxShadow(
                        color: Color(0x3F000000),
                        blurRadius: 30,
                        offset: Offset(0, 0),
                        spreadRadius: 1,
                      ),
                    ],
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Login',
                        style: TextStyle(
                          fontSize: 28,
                          fontWeight: FontWeight.bold,
                          color: AppColor.black,
                        ),
                      ),
                      const SizedBox(height: 38),
                      SizedBox(
                        width: double.infinity,
                        child: TextFormField(
                          controller: mobileNumberController,
                          keyboardType: TextInputType.phone,
                          inputFormatters: [
                            FilteringTextInputFormatter.digitsOnly,
                            LengthLimitingTextInputFormatter(10),
                          ],
                          decoration: InputDecoration(
                            labelText: 'Mobile Number',
                            hintText: 'Enter your Mobile Number',
                            labelStyle: TextStyle(color: AppColor.green),
                            hintStyle: const TextStyle(color: Colors.grey),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(6),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(6),
                              borderSide: const BorderSide(color: Colors.grey),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(6),
                              borderSide: BorderSide(
                                color: Theme.of(context).primaryColor,
                              ),
                            ),
                            contentPadding: const EdgeInsets.symmetric(
                              horizontal: 20,
                              vertical: 18,
                            ),
                          ),
                          style: const TextStyle(fontSize: 16),
                        ),
                      ),
                      const SizedBox(height: 79),
                      SizedBox(
                        width: double.infinity,
                        child: CustomButton(
                          buttonText: 'Get OTP',
                          buttonColor: AppColor.green,
                          textColor: AppColor.fullwhite,
                          onPressed: () {
                            final triggerOtpCubit =
                                context.read<TriggerOtpCubit>();
                            triggerOtpCubit.fetchOtp(
                              context,
                              mobileNumberController.text,
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
