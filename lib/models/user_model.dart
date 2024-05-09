class UserModel {
  String? name;
  String? email;
  String? phone;
  String? uID;

  UserModel({
    this.email,
    this.name,
    this.phone,
    this.uID,
  });

  UserModel.fromJson(Map<String, dynamic> json) {
    email = json['email'];
    name = json['name'];
    phone = json['phone'];
    uID = json['uID'];
  }

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'email': email,
      'phone': phone,
      'uID': uID,
    };
  }
}
