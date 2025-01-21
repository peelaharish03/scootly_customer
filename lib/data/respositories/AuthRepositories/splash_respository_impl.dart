import 'package:scootly_customer/data/datasource/AuthDataSource/splash_remote_data_source.dart';
import 'package:scootly_customer/domain/entities/AuthEntities/current_customer_entitiy.dart';
import 'package:scootly_customer/domain/repositories/AuthRepositories/splash_repository.dart';

class SplashRespositoryImpl implements SplashRepository {
  final SplashRemoteDataSource remoteDataSource;

  SplashRespositoryImpl({required this.remoteDataSource});

  @override
  Future<CurrentCustomerEntity> getCurrentCustomer() async {
    final model = await remoteDataSource.currentCustomer();
    return CurrentCustomerEntity(
        message: model.message,
        status: model.status,
        data: model.data != null
            ? CurrentCustomerDataEntity(
                id: model.data!.id,
                fullName: model.data!.fullName,
                primaryContact: model.data?.primaryContact ?? '',
                status: model.data?.status ?? '',
                roles: [],
                newUser: model.data?.newUser ?? false,
                private: model.data?.private ?? false,
              )
            : null);
  }
}
