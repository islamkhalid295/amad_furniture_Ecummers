class ProductsListModel {
  List<Product>? products;

  ProductsListModel({this.products});

  ProductsListModel.fromJson(Map<String, dynamic> json) {
    if (json['products'] != null) {
      products = <Product>[];
      json['products'].forEach((v) {
        products!.add(new Product.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.products != null) {
      data['products'] = this.products!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Product {
  String? id = "-1";
  String? name = "لايوجد اسم";
  String? imageUrl = "";
  String? price = "السعر غير متاح";
  String? discount ="0";
  int? availableAmount = 0;
  bool inCart = false;

  Product(
      {required this.id,
        required this.name,
        required this.imageUrl,
        required this.price,
        required this.discount,
        required this.availableAmount});

  Product.fromJson(Map<String, dynamic> json) {
    id = json['id'] ;
    name = json['name'] ;
    imageUrl = json['image_url'] ;
    price = json['price'] ;
    discount = json['discount'];
    availableAmount = json['available_amount'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['image_url'] = this.imageUrl;
    data['price'] = this.price;
    data['discount'] = this.discount;
    data['available_amount'] = this.availableAmount;
    return data;
  }
}
