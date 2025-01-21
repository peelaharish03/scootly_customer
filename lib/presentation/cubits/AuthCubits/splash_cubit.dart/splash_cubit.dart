// splash_cubit.dart
import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:scootly_customer/domain/usecases/AuthUsecases/current_customer_usecase.dart';
import 'package:scootly_customer/presentation/cubits/AuthCubits/splash_cubit.dart/splash_state.dart';

class SplashCubit extends Cubit<SplashState> {
  final CurrentCustomerValidationUseCase? currentCustomerValidationUseCase;

  SplashCubit({this.currentCustomerValidationUseCase}) : super(SplashInitial());

  void startTimer() {
    Future.delayed(const Duration(seconds: 3), () {
      emit(SplashInitial());
    });
  }

  Future<SplashState> GetCurrentCustomer() async {
    try {
      emit(SplashLoading());
      final currentCustomerEntity = await currentCustomerValidationUseCase!();
      final state = SplashLoaded(currentCustomerEntity);
      emit(state);
      return state;
    } catch (e) {
      final errorState =
          SplashError('Failed to fetch customer data: ${e.toString()}');
      emit(errorState);
      return errorState;
    }
  }
}
