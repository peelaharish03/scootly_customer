import 'package:scootly_customer/domain/entities/AuthEntities/signin_entitiy.dart';

abstract class SignInRepository {
  Future<SignInEntity> logIn(String mobileNumber, String otp);
}
