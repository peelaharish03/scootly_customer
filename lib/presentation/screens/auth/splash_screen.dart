import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:scootly_customer/core/constants/colors.dart';
import 'package:scootly_customer/presentation/cubits/AuthCubits/splash_cubit.dart/splash_cubit.dart';
import 'package:scootly_customer/presentation/cubits/AuthCubits/splash_cubit.dart/splash_state.dart';
import 'package:scootly_customer/presentation/screens/auth/SignIn_page.dart';
import 'package:scootly_customer/presentation/screens/dashboard/dashboard.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  String token = '';

  @override
  void initState() {
    super.initState();
    context.read<SplashCubit>().GetCurrentCustomer();
    context.read<SplashCubit>().startTimer();
    _checkSesson(context);
  }

  _checkSesson(BuildContext context) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String token = prefs.getString('TOKEN') ?? '';
    print('token::: $token');

    if (token.isNotEmpty) {
      final SplashCubit cubit = context.read<SplashCubit>();
      final SplashState state = await cubit.GetCurrentCustomer();
      if (state is SplashLoaded &&
          state.currentCustomerEntity.status == 'SUCCESS') {
        print('current cust status${state.currentCustomerEntity.status}');
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => DashBoardScreen()),
        );
      } else {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => SigninPage()),
        );
      }
    } else {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => SigninPage()),
      );
    }
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SplashCubit(),
      child: BlocListener<SplashCubit, SplashState>(
        listener: (context, state) {
          if (state is SplashLoaded) {
            final data = state.currentCustomerEntity;
            if (data.status == 'SUCCESS') {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => DashBoardScreen()),
              );
            } else {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) => SigninPage(),
                ),
              );
            }
          } else {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (context) => SigninPage(),
              ),
            );
          }
        },
        child: Scaffold(
          backgroundColor: AppColor.green,
          appBar: AppBar(
            backgroundColor: AppColor.green,
          ),
          body: Center(
            child: Text(
              'Scootly',
              style: TextStyle(
                fontSize: 48,
                fontWeight: FontWeight.bold,
                fontFamily: 'Poppins',
                color: AppColor.white,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
