class CityModel {
  List<City>? cities;

  CityModel({this.cities});

  CityModel.fromJson(Map<String, dynamic> json) {
    if (json['cities'] != null) {
      cities = <City>[];
      json['cities'].forEach((v) {
        cities!.add(new City.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.cities != null) {
      data['cities'] = this.cities!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class City {
  String? id;
  String? name;
  String? deliveryPrice;

  City({this.id, this.name, this.deliveryPrice});

  City.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    deliveryPrice = json['delivery_price'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['delivery_price'] = this.deliveryPrice;
    return data;
  }
}
