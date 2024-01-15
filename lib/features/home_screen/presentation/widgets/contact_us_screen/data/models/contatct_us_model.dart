class ContactUsModel {
  String email;
  String name;
  String number;
  String message;

  ContactUsModel({required this.email, required this.name, required this.number, required this.message});

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['email'] = this.email;
    data['name'] = this.name;
    data['number'] = this.number;
    data['message'] = this.message;
    return data;
  }
}
