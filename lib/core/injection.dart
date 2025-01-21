import 'package:dio/dio.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get_it/get_it.dart';
import 'package:scootly_customer/core/network/dio_client.dart';
import 'package:scootly_customer/data/datasource/AuthDataSource/signIn_remote_data_source.dart';
import 'package:scootly_customer/data/datasource/AuthDataSource/splash_remote_data_source.dart';
import 'package:scootly_customer/data/datasource/AuthDataSource/trigger_otp_remote_data_source.dart';
import 'package:scootly_customer/data/respositories/AuthRepositories/signin_repository_impl.dart';
import 'package:scootly_customer/data/respositories/AuthRepositories/splash_respository_impl.dart';
import 'package:scootly_customer/data/respositories/AuthRepositories/trigger_otp_repository_impl.dart';
import 'package:scootly_customer/domain/repositories/AuthRepositories/signin_repository.dart';
import 'package:scootly_customer/domain/repositories/AuthRepositories/splash_repository.dart';
import 'package:scootly_customer/domain/repositories/AuthRepositories/trigger_otp_repository.dart';
import 'package:scootly_customer/domain/usecases/AuthUsecases/current_customer_usecase.dart';
import 'package:scootly_customer/domain/usecases/AuthUsecases/signin_validation_usecase.dart';
import 'package:scootly_customer/domain/usecases/AuthUsecases/trigger_otp_validation_usecase.dart';
import 'package:scootly_customer/presentation/cubits/AuthCubits/signin/signin_cubit.dart';
import 'package:scootly_customer/presentation/cubits/AuthCubits/splash_cubit.dart/splash_cubit.dart';
import 'package:scootly_customer/presentation/cubits/AuthCubits/trigger_otp/trigger_otp_cubit.dart';

// Screens

final GetIt sl = GetIt.instance;

void init() {
  // Register Dio instance
  sl.registerLazySingleton<Dio>(() => Dio());

  // Register Flutter Secure Storage instance
  sl.registerLazySingleton(() => const FlutterSecureStorage());

  // Register Dio Client (handles Dio requests and secure storage)
  sl.registerLazySingleton<DioClient>(
    () => DioClient(sl<Dio>(), secureStorage: sl<FlutterSecureStorage>()),
  );

  // Register Trigger OTP Remote Data Source
  sl.registerLazySingleton<TriggerOtpRemoteDataSource>(
    () => TriggerOtpRemoteDataSourceImpl(client: sl<DioClient>().dio),
  );

  // Register Trigger OTP Repository
  sl.registerLazySingleton<TriggerOtpRepository>(
    () => TriggerOtpRepositoryImpl(
        remoteDataSource: sl<TriggerOtpRemoteDataSource>()),
  );

  // Register Trigger OTP Validation Use Case
  sl.registerLazySingleton(
    () => TriggerOtpValidationUseCase(sl<TriggerOtpRepository>()),
  );

  // Register Trigger OTP Cubit
  sl.registerFactory(() => TriggerOtpCubit(sl<TriggerOtpValidationUseCase>()));

  // Register SignIn Remote Data Source
  sl.registerLazySingleton<SignInRemoteDataSource>(
    () => SignInRemoteDataSourceImpl(client: sl<DioClient>().dio),
  );

  // Register SignIn Repository
  sl.registerLazySingleton<SignInRepository>(
    () => SignInRepositoryImpl(remoteDataSource: sl<SignInRemoteDataSource>()),
  );

  // Register SignIn Validation Use Case
  sl.registerLazySingleton(
    () => SignInValidationUseCase(sl<SignInRepository>()),
  );

  // Register SignIn Cubit
  sl.registerFactory(() => SignInCubit(sl<SignInValidationUseCase>()));

  // Register Splash Remote Data Source
  sl.registerLazySingleton<SplashRemoteDataSource>(
    () => SplashRemoteDataSourceImpl(client: sl<DioClient>().dio),
  );

  // Register Splash Repository
  sl.registerLazySingleton<SplashRepository>(
    () => SplashRespositoryImpl(remoteDataSource: sl<SplashRemoteDataSource>()),
  );

  // Register Current Customer Validation Use Case
  sl.registerLazySingleton(
    () => CurrentCustomerValidationUseCase(sl<SplashRepository>()),
  );

  // Register Splash Cubit
  sl.registerFactory(() => SplashCubit(
      currentCustomerValidationUseCase:
          sl<CurrentCustomerValidationUseCase>()));

  // Register Get Quotations Data Source
}
