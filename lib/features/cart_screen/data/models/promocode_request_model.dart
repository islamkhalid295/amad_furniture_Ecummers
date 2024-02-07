class PromoCodeRequestModel {
  String? promocode;
  String? type;

  PromoCodeRequestModel({this.promocode, this.type});

  PromoCodeRequestModel.fromJson(Map<String, dynamic> json) {
    promocode = json['promocode'];
    type = json['type'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['promocode'] = this.promocode;
    data['type'] = this.type;
    return data;
  }
}
