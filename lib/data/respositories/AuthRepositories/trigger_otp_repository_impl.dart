import 'package:scootly_customer/data/datasource/AuthDataSource/trigger_otp_remote_data_source.dart';
import 'package:scootly_customer/data/models/AuthModels/trigger_otp_model.dart';
import '../../../domain/repositories/AuthRepositories/trigger_otp_repository.dart';

class TriggerOtpRepositoryImpl implements TriggerOtpRepository {
  final TriggerOtpRemoteDataSource remoteDataSource;

  TriggerOtpRepositoryImpl({required this.remoteDataSource});

  @override
  Future<TriggerOtpModel> getOtp(String mobileNumber) async {
    final model = await remoteDataSource.fetchOtp(mobileNumber);
    return TriggerOtpModel(
        message: model.message, status: model.status, data: model.data);
  }
}
