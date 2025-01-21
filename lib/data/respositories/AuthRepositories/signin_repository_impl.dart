import 'package:scootly_customer/data/datasource/AuthDataSource/signIn_remote_data_source.dart';
import 'package:scootly_customer/domain/entities/AuthEntities/signin_entitiy.dart';
import 'package:scootly_customer/domain/repositories/AuthRepositories/signin_repository.dart';

class SignInRepositoryImpl implements SignInRepository {
  final SignInRemoteDataSource remoteDataSource;

  SignInRepositoryImpl({required this.remoteDataSource});

  @override
  Future<SignInEntity> logIn(String mobileNumber, String otp) async {
    final model = await remoteDataSource.signIn(mobileNumber, otp);
    return SignInEntity(
      message: model.message,
      status: model.status,
      data: model.data != null
          ? SignInDataEntity(
              token: model.data!.token,
              refreshToken: model.data!.refreshToken,
              type: model.data!.type,
              id: model.data!.id,
              roles: model.data!.roles,
              primaryContact: model.data!.primaryContact)
          : null,
    );
  }
}
