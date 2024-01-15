class AboutUsModel {
  String? aboutProducts;

  AboutUsModel({this.aboutProducts});

  AboutUsModel.fromJson(Map<String, dynamic> json) {
    aboutProducts = json['aboutProducts'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['aboutProducts'] = this.aboutProducts;
    return data;
  }
}
