class OrderTheCartModel {
  String? destination;
  String? city;
  String? paymentMethod;
  String? lastName;
  String? secondNumber;

  OrderTheCartModel(
      {this.destination,
        this.city,
        this.paymentMethod,
        this.lastName,
        this.secondNumber});

  OrderTheCartModel.fromJson(Map<String, dynamic> json) {
    destination = json['destination'];
    city = json['city'];
    paymentMethod = json['payment_method'];
    lastName = json['last_name'];
    secondNumber = json['second_number'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['destination'] = this.destination;
    data['city'] = this.city;
    data['payment_method'] = this.paymentMethod;
    data['last_name'] = this.lastName;
    data['second_number'] = this.secondNumber;
    return data;
  }
}
