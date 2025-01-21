class CurrentCustomerEntity {
  final String? message;
  final String? status;
  final CurrentCustomerDataEntity? data;

  CurrentCustomerEntity({this.message, this.status, this.data});
}

class CurrentCustomerDataEntity {
  final int? id;
  final String? email;
  final String? password;
  final String? fullName;
  final List<String> roles;
  final int? profileToCustomerId;
  final String? customerProfileUrl;
  final String primaryContact;
  final String? dob;
  final String? gender;
  final String? gothra;
  final bool? whatsAppEnabled;
  final String? postalCode;
  final bool newUser;
  final String? profilePicture;
  final String? userProfile;
  final String? fcmToken;
  final String? code;
  final String status;
  final int? reportCount;
  final bool? sameTokenAvailable;
  final bool private;

  const CurrentCustomerDataEntity({
    this.id,
    this.email,
    this.password,
    this.fullName,
    required this.roles,
    this.profileToCustomerId,
    this.customerProfileUrl,
    required this.primaryContact,
    this.dob,
    this.gender,
    this.gothra,
    this.whatsAppEnabled,
    this.postalCode,
    required this.newUser,
    this.profilePicture,
    this.userProfile,
    this.fcmToken,
    this.code,
    required this.status,
    this.reportCount,
    this.sameTokenAvailable,
    required this.private,
  });
}
