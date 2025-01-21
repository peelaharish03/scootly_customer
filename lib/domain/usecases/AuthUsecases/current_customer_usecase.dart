import 'package:scootly_customer/domain/entities/AuthEntities/current_customer_entitiy.dart';
import 'package:scootly_customer/domain/repositories/AuthRepositories/splash_repository.dart';

class CurrentCustomerValidationUseCase {
  final SplashRepository repository;

  CurrentCustomerValidationUseCase(this.repository);

  Future<CurrentCustomerEntity> call() async {
    return await repository.getCurrentCustomer();
  }
}
