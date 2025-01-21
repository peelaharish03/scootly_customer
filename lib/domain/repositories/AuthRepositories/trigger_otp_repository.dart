import 'package:scootly_customer/data/models/AuthModels/trigger_otp_model.dart';

abstract class TriggerOtpRepository {
  Future<TriggerOtpModel> getOtp(String mobileNumber);
}
