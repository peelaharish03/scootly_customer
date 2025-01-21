import 'package:scootly_customer/data/models/AuthModels/trigger_otp_model.dart';

abstract class TriggerOtpState {}

class TriggerOtpInitial extends TriggerOtpState {}

class TriggerOtpLoading extends TriggerOtpState {}

class TriggerOtpLoaded extends TriggerOtpState {
  final TriggerOtpModel triggerOtpEntity;
  TriggerOtpLoaded(this.triggerOtpEntity);
}

class TriggerOtpError extends TriggerOtpState {
  final String message;
  TriggerOtpError(this.message);
}
