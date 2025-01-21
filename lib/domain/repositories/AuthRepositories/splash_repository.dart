import 'package:scootly_customer/domain/entities/AuthEntities/current_customer_entitiy.dart';

abstract class SplashRepository {
  Future<CurrentCustomerEntity> getCurrentCustomer();
}
