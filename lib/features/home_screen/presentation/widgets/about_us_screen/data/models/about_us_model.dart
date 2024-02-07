class AboutUsModel {
  String? aboutProducts;
  String? aboutUs;
  String? image;

  AboutUsModel({this.aboutProducts, this.aboutUs,this.image});

  AboutUsModel.fromJson(Map<String, dynamic> json) {
    aboutProducts = json['aboutProducts'];
    aboutUs = json['aboutUs'];
    image = json['image'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['aboutProducts'] = this.aboutProducts;
    data['aboutUs'] = this.aboutUs;
    data['image'] = this.image;
    return data;
  }
}
