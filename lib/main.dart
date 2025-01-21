import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:scootly_customer/core/constants/colors.dart';
import 'package:scootly_customer/presentation/cubits/AuthCubits/signin/signin_cubit.dart';
import 'package:scootly_customer/presentation/cubits/AuthCubits/splash_cubit.dart/splash_cubit.dart';
import 'package:scootly_customer/presentation/cubits/AuthCubits/trigger_otp/trigger_otp_cubit.dart';
import 'package:scootly_customer/presentation/screens/auth/splash_screen.dart';

import 'core/injection.dart' as di;

void main() {
  di.init();
  runApp(const MyApp());
}

final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => di.sl<TriggerOtpCubit>()),
        BlocProvider(create: (_) => di.sl<SignInCubit>()),
        BlocProvider(create: (_) => di.sl<SplashCubit>()),
      ],
      child: MaterialApp(
        title: 'Scootly',
        debugShowCheckedModeBanner: false,
        navigatorKey: navigatorKey,
        theme: ThemeData(
          primarySwatch: Colors.green,
          scaffoldBackgroundColor: AppColor.white,
          colorScheme: ColorScheme.fromSeed(seedColor: AppColor.green),
          useMaterial3: true,
          appBarTheme: AppBarTheme(
            color: AppColor.green,
            elevation: 0,
            iconTheme: IconThemeData(color: AppColor.fullwhite),
            titleTextStyle: TextStyle(
              color: AppColor.fullwhite,
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        home: const SplashScreen(),
      ),
    );
  }
}
