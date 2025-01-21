import 'package:scootly_customer/domain/entities/AuthEntities/current_customer_entitiy.dart';

abstract class SplashState {}

class SplashInitial extends SplashState {}

class SplashLoading extends SplashState {}

class SplashLoaded extends SplashState {
  final CurrentCustomerEntity currentCustomerEntity;
  SplashLoaded(this.currentCustomerEntity);
}

class SplashError extends SplashState {
  final String message;
  SplashError(this.message);
}
