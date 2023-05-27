// ignore_for_file: unnecessary_this, unnecessary_new, prefer_collection_literals

class ResponseBody {
  String? accessToken;
  User? user;

  ResponseBody({this.accessToken, this.user});

  ResponseBody.fromJson(Map<String, dynamic> json) {
    accessToken = json['access_token'];
    user = json['user'] != null ? new User.fromJson(json['user']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['access_token'] = this.accessToken;
    if (this.user != null) {
      data['user'] = this.user!.toJson();
    }
    return data;
  }
}

class User {
  int? id;
  String? name;
  String? surname;
  String? secondName;
  String? pensionNumber;
  String? phone;
  String? email;
  String? entity;
  int? isEmployer;
  int? employerSetting;
  int? employerVerified;
  Null? employee;

  User(
      {this.id,
      this.name,
      this.surname,
      this.secondName,
      this.pensionNumber,
      this.phone,
      this.email,
      this.entity,
      this.isEmployer,
      this.employerSetting,
      this.employerVerified,
      this.employee});

  User.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    surname = json['surname'];
    secondName = json['second_name'];
    pensionNumber = json['pension_number'];
    phone = json['phone'];
    email = json['email'];
    entity = json['entity'];
    isEmployer = json['is_employer'];
    employerSetting = json['employer_setting'];
    employerVerified = json['employer_verified'];
    employee = json['employee'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['surname'] = this.surname;
    data['second_name'] = this.secondName;
    data['pension_number'] = this.pensionNumber;
    data['phone'] = this.phone;
    data['email'] = this.email;
    data['entity'] = this.entity;
    data['is_employer'] = this.isEmployer;
    data['employer_setting'] = this.employerSetting;
    data['employer_verified'] = this.employerVerified;
    data['employee'] = this.employee;
    return data;
  }
}