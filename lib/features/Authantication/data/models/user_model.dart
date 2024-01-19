class UserModel {
  String? email;
  String? name;
  String? token;
  String? number;

  UserModel({required this.email, required this.name,required this.token, required this.number});

  UserModel.fromJson(Map<String, dynamic> json) {
    token = json['token'];
    name = json['name'];
    email = json['email'];
    number = json['number'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['email'] = this.email;
    data['name'] = this.name;
    data['token'] = this.token;
    data['number'] = this.number;
    return data;
  }
}
