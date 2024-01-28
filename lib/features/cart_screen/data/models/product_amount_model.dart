class ProductAmountModel {
  String? id;
  int? amount;

  ProductAmountModel({this.id, this.amount});

  ProductAmountModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    amount = json['amount'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['amount'] = this.amount;
    return data;
  }
}
