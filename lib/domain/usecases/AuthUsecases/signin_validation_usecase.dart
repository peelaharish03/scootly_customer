import 'package:scootly_customer/domain/entities/AuthEntities/signin_entitiy.dart';
import 'package:scootly_customer/domain/repositories/AuthRepositories/signin_repository.dart';

class SignInValidationUseCase {
  final SignInRepository repository;

  SignInValidationUseCase(this.repository);

  Future<SignInEntity> call(String mobileNumber, String otp) async {
    return await repository.logIn(mobileNumber, otp);
  }
}
