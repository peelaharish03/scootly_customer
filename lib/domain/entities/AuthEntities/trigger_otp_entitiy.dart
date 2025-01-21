class TriggerOtpEntity {
  final String? message;
  final String? status;
  final DataEntity? data;

  TriggerOtpEntity({this.message, this.status, this.data});
}

class DataEntity {
  final int? id;
  final String? otpType;
  final String? creationTime;
  final String? otp;

  DataEntity({this.id, this.otpType, this.creationTime, this.otp});
}
