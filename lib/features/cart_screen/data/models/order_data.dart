class OrderData {
  DeliveryDestination? deliveryDestination;
  String? paymentMethod;

  OrderData({this.deliveryDestination, this.paymentMethod});

  OrderData.fromJson(Map<String, dynamic> json) {
    deliveryDestination = json['delivery_destination'] != null
        ? new DeliveryDestination.fromJson(json['delivery_destination'])
        : null;
    paymentMethod = json['payment_method'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.deliveryDestination != null) {
      data['delivery_destination'] = this.deliveryDestination!.toJson();
    }
    data['payment_method'] = this.paymentMethod;
    return data;
  }
}

class DeliveryDestination {
  String? city;
  String? district;
  String? buildingNumber;
  String? floor;
  String? apartment;
  String? additionalInfo;

  DeliveryDestination(
      {this.city,
        this.district,
        this.buildingNumber,
        this.floor,
        this.apartment,
        this.additionalInfo});

  DeliveryDestination.fromJson(Map<String, dynamic> json) {
    city = json['city'];
    district = json['district'];
    buildingNumber = json['building_number'];
    floor = json['floor'];
    apartment = json['apartment'];
    additionalInfo = json['additional_info'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['city'] = this.city;
    data['district'] = this.district;
    data['building_number'] = this.buildingNumber;
    data['floor'] = this.floor;
    data['apartment'] = this.apartment;
    data['additional_info'] = this.additionalInfo;
    return data;
  }
}
