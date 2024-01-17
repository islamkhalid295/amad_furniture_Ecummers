class CreateAccountModel {
  String email;
  String name;
  String number;
  String password;

  CreateAccountModel({required this.email, required this.name, required this.number, required this.password});

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['email'] = this.email;
    data['name'] = this.name;
    data['number'] = this.number;
    data['password'] = this.password;
    return data;
  }
}
