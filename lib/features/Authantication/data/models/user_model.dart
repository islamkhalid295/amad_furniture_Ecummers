class UserModel {
  String? email;
  String? name;
  String? firstName;
  String? secondName;
  String? token;
  String? number;

  // UserModel({required this.email, required this.name,required this.token, required this.number});
  UserModel({
    required this.email,
    required this.name,
    required this.token,
    required this.number,
  }) {
    // Split the name and assign parts to firstName and secondName
    List<String> parts = name!.split(' ');
    if (parts.length >= 2) {
      firstName = parts[0];
      secondName = parts[1];
    } else {
      // If there are not enough parts, assign the entire name to firstName
      firstName = name;
      secondName = '';
    }
  }
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
