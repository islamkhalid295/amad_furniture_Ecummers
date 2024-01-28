import 'package:equatable/equatable.dart';

class ProductInfoModel {
  ProductInfo? product;

  ProductInfoModel({this.product});

  ProductInfoModel.fromJson(Map<String, dynamic> json) {
    product =
    json['product'] != null ? new ProductInfo.fromJson(json['product']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.product != null) {
      data['product'] = this.product!.toJson();
    }
    return data;
  }
}

class ProductInfo extends Equatable{
  String? id;
  String? name;
  List<dynamic>? imageUrls;
  List<Categories>? categories;
  String? price;
  String? discount;
  int? availableAmount;
  List<dynamic>? wholesaleOffers;
  String? description;

  ProductInfo(
      {this.id,
        this.name,
        this.imageUrls,
        this.categories,
        this.price,
        this.discount,
        this.availableAmount,
        this.wholesaleOffers,
        this.description});

  ProductInfo.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    imageUrls = json['image_urls'];
    if (json['categories'] != null) {
      categories = <Categories>[];
      json['categories'].forEach((v) {
        categories!.add(new Categories.fromJson(v));
      });
    }
    price = json['price'];
    discount = json['discount'];
    availableAmount = json['available_amount'];
    wholesaleOffers = json['wholesale_offers'];
    description = json['description'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['image_urls'] = this.imageUrls;
    if (this.categories != null) {
      data['categories'] = this.categories!.map((v) => v.toJson()).toList();
    }
    data['price'] = this.price;
    data['discount'] = this.discount;
    data['available_amount'] = this.availableAmount;
    data['wholesale_offers'] = this.wholesaleOffers;
    data['description'] = this.description;
    return data;
  }

  @override
  // TODO: implement props
  List<Object?> get props => [id];
}

class Categories {
  String? name;
  String? id;
  List<Subcategories>? subcategories;

  Categories({this.name, this.id, this.subcategories});

  Categories.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    id = json['id'];
    if (json['subcategories'] != null) {
      subcategories = <Subcategories>[];
      json['subcategories'].forEach((v) {
        subcategories!.add(new Subcategories.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['id'] = this.id;
    if (this.subcategories != null) {
      data['subcategories'] =
          this.subcategories!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Subcategories {
  String? id;
  String? name;

  Subcategories({this.id, this.name});

  Subcategories.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    return data;
  }
}
