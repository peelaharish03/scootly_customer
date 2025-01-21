import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:scootly_customer/core/network/dio_client.dart';
import 'package:scootly_customer/core/utils/enums/enums.dart';

class BaseCubit extends Cubit<ApiStatus> {
  late DioClient dioClient;

  BaseCubit() : super(ApiStatus.SUCCESS) {
    initializeDioClient();
  }

  Future<void> initializeDioClient() async {
    const secureStorage = FlutterSecureStorage();
    dioClient = DioClient(Dio(), secureStorage: secureStorage);
  }
}
