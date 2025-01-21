class SignInModel {
  String? message;
  String? status;
  Data? data;

  SignInModel({this.message, this.status, this.data});

  SignInModel.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    status = json['status'];
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['message'] = message;
    data['status'] = status;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class Data {
  String? token;
  String? refreshToken;
  String? type;
  int? id;
  String? email;
  List<String>? roles;
  String? primaryContact;

  Data(
      {this.token,
      this.refreshToken,
      this.type,
      this.id,
      this.email,
      this.roles,
      this.primaryContact});

  Data.fromJson(Map<String, dynamic> json) {
    token = json['token'];
    refreshToken = json['refreshToken'];
    type = json['type'];
    id = json['id'];
    email = json['email'];
    roles = json['roles'].cast<String>();
    primaryContact = json['primaryContact'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['token'] = token;
    data['refreshToken'] = refreshToken;
    data['type'] = type;
    data['id'] = id;
    data['email'] = email;
    data['roles'] = roles;
    data['primaryContact'] = primaryContact;
    return data;
  }
}
