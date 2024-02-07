class PromoCodeResponseModel {
  String? type;
  int? value;

  PromoCodeResponseModel({this.type, this.value});

  PromoCodeResponseModel.fromJson(Map<String, dynamic> json) {
    type = json['type'];
    value = json['value'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['type'] = this.type;
    data['value'] = this.value;
    return data;
  }
}
