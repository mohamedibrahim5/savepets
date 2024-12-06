class UserModel {
  String? email;
  String? uId;

  UserModel({
    this.email,
    this.uId,
  });
  UserModel.fromJason(Map<String, dynamic> json) {
    email = json['email'];
    uId = json['uId'];
  }

  Map<String, dynamic> toMap() {
    return {
      'email': email,
      'uId': uId,
    };
  }
}
