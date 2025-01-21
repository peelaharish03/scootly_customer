class SignInEntity {
  final String? message;
  final String? status;
  final SignInDataEntity? data;

  SignInEntity({this.message, this.status, this.data});
}


class SignInDataEntity {
  final String? token;
  final String? refreshToken;
  final String? type;
  final int? id;
  final String? email;
  final List<String>? roles;
  final String? primaryContact;

  SignInDataEntity({
    this.token,
    this.refreshToken,
    this.type,
    this.id,
    this.email,
    this.roles,
    this.primaryContact,
  });
}
