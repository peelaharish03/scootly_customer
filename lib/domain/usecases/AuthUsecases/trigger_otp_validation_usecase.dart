import 'package:scootly_customer/data/models/AuthModels/trigger_otp_model.dart';
import 'package:scootly_customer/domain/repositories/AuthRepositories/trigger_otp_repository.dart';

class TriggerOtpValidationUseCase {
  final TriggerOtpRepository repository;

  TriggerOtpValidationUseCase(this.repository);

  Future<TriggerOtpModel> call(String mobileNumber) async {
    return await repository.getOtp(mobileNumber);
  }
}
