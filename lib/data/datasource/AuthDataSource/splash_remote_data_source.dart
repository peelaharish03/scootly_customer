import 'package:dio/dio.dart';
import 'package:scootly_customer/core/constants/api_constants.dart';
import 'package:scootly_customer/data/models/AuthModels/current_customer_model.dart';

abstract class SplashRemoteDataSource {
  Future<CurrentCustomerModel> currentCustomer();
}

class SplashRemoteDataSourceImpl implements SplashRemoteDataSource {
  final Dio client;

  SplashRemoteDataSourceImpl({required this.client});

  @override
  Future<CurrentCustomerModel> currentCustomer() async {
    try {
      final response =
          await client.get('$CURRENTCUSTOMER?accessTokenCheck=true');
      if (response.statusCode == 200) {
        print('responce of current customer:: $response');
        return CurrentCustomerModel.fromJson(response.data);
      } else {
        throw Exception(
            'Failed to load current customer data: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Failed to load current customer data: ${e.toString()}');
    }
  }
}
