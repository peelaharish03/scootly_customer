import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';  // Import for context

enum AuthenticationStatus { authenticated, unauthenticated }

class AuthenticationCubit extends Cubit<AuthenticationStatus> {
  AuthenticationCubit() : super(AuthenticationStatus.unauthenticated);

  void login() {
    emit(AuthenticationStatus.authenticated);
  }

  void logout(BuildContext context) {
    // Clear any saved user session data here (e.g., tokens, preferences)
    emit(AuthenticationStatus.unauthenticated);

    // Navigate to the SigninPage after logout
    Navigator.pushReplacementNamed(context, '/login');  // Navigate to SigninPage
  }
}
