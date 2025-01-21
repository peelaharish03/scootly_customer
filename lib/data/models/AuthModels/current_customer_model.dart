class CurrentCustomerModel {
  String? message;
  String? status;
  Data? data;

  CurrentCustomerModel({this.message, this.status, this.data});

  CurrentCustomerModel.fromJson(Map<String, dynamic> json) {
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
  int? id;
  Null email;
  Null password;
  Null fullName;
  List<String>? roles;
  Null profileToCustomerId;
  Null customerProfileUrl;
  String? primaryContact;
  Null dob;
  Null gender;
  Null gothra;
  Null whatsAppEnabled;
  Null postalCode;
  bool? newUser;
  Null profilePicture;
  Null userProfile;
  Null fcmToken;
  Null code;
  String? status;
  Null reportCount;
  Null sameTokenAvailable;
  bool? private;

  Data(
      {this.id,
      this.email,
      this.password,
      this.fullName,
      this.roles,
      this.profileToCustomerId,
      this.customerProfileUrl,
      this.primaryContact,
      this.dob,
      this.gender,
      this.gothra,
      this.whatsAppEnabled,
      this.postalCode,
      this.newUser,
      this.profilePicture,
      this.userProfile,
      this.fcmToken,
      this.code,
      this.status,
      this.reportCount,
      this.sameTokenAvailable,
      this.private});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    email = json['email'];
    password = json['password'];
    fullName = json['fullName'];
    roles = json['roles'].cast<String>();
    profileToCustomerId = json['profileToCustomerId'];
    customerProfileUrl = json['customerProfileUrl'];
    primaryContact = json['primaryContact'];
    dob = json['dob'];
    gender = json['gender'];
    gothra = json['gothra'];
    whatsAppEnabled = json['whatsAppEnabled'];
    postalCode = json['postalCode'];
    newUser = json['newUser'];
    profilePicture = json['profilePicture'];
    userProfile = json['userProfile'];
    fcmToken = json['fcmToken'];
    code = json['code'];
    status = json['status'];
    reportCount = json['reportCount'];
    sameTokenAvailable = json['sameTokenAvailable'];
    private = json['private'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['email'] = email;
    data['password'] = password;
    data['fullName'] = fullName;
    data['roles'] = roles;
    data['profileToCustomerId'] = profileToCustomerId;
    data['customerProfileUrl'] = customerProfileUrl;
    data['primaryContact'] = primaryContact;
    data['dob'] = dob;
    data['gender'] = gender;
    data['gothra'] = gothra;
    data['whatsAppEnabled'] = whatsAppEnabled;
    data['postalCode'] = postalCode;
    data['newUser'] = newUser;
    data['profilePicture'] = profilePicture;
    data['userProfile'] = userProfile;
    data['fcmToken'] = fcmToken;
    data['code'] = code;
    data['status'] = status;
    data['reportCount'] = reportCount;
    data['sameTokenAvailable'] = sameTokenAvailable;
    data['private'] = private;
    return data;
  }
}
