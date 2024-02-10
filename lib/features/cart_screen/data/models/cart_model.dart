class CartModel {
  Cart? cart;

  CartModel({this.cart});

  CartModel.fromJson(Map<String, dynamic> json) {
    cart = json['cart'] != null ? new Cart.fromJson(json['cart']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.cart != null) {
      data['cart'] = this.cart!.toJson();
    }
    return data;
  }
}

class Cart {
  String? email;
  ClientPromocode? clientPromocode;
  SellerPromocode? sellerPromocode;
  List<Products>? products;
  double? totalPrice;
  double? totalPriceAfterPromocodes;

  Cart(
      {this.email,
        this.clientPromocode,
        this.sellerPromocode,
        this.products,
        this.totalPrice,
        this.totalPriceAfterPromocodes});

  Cart.fromJson(Map<String, dynamic> json) {
    email = json['email'];
    clientPromocode = json['client_promocode'] != null
        ? new ClientPromocode.fromJson(json['client_promocode'])
        : null;
    sellerPromocode = json['seller_promocode'] != null
        ? new SellerPromocode.fromJson(json['seller_promocode'])
        : null;
    if (json['products'] != null) {
      products = <Products>[];
      json['products'].forEach((v) {
        products!.add(new Products.fromJson(v));
      });
    }
    totalPrice = json['total_price'];
    totalPriceAfterPromocodes = json['total_price_after_promocodes'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['email'] = this.email;
    if (this.clientPromocode != null) {
      data['client_promocode'] = this.clientPromocode!.toJson();
    }
    if (this.sellerPromocode != null) {
      data['seller_promocode'] = this.sellerPromocode!.toJson();
    }
    if (this.products != null) {
      data['products'] = this.products!.map((v) => v.toJson()).toList();
    }
    data['total_price'] = this.totalPrice;
    data['total_price_after_promocodes'] = this.totalPriceAfterPromocodes;
    return data;
  }
}

class ClientPromocode {
  String? promocode;
  String? type;
  String? value;

  ClientPromocode({this.promocode, this.type, this.value});

  ClientPromocode.fromJson(Map<String, dynamic> json) {
    promocode = json['promocode'];
    type = json['type'];
    value = json['value'].toString();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['promocode'] = this.promocode;
    data['type'] = this.type;
    data['value'] = this.value;
    return data;
  }
}

class SellerPromocode {
  String? promocode;
  String? type;
  String? value;

  SellerPromocode({this.promocode, this.type, this.value});

  SellerPromocode.fromJson(Map<String, dynamic> json) {
    promocode = json['promocode'];
    type = json['type'];
    value = json['value'].toString();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['promocode'] = this.promocode;
    data['type'] = this.type;
    data['value'] = this.value;
    return data;
  }
}

class Products {
  String? id;
  String? name;
  int? amount;
  String? image;
  double? discount;
  String? price;
  double? totalPrice;

  Products(
      {this.id,
        this.name,
        this.amount,
        this.image,
        this.discount,
        this.price,
        this.totalPrice});

  Products.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    amount = json['amount'];
    image = json['image'];
    discount = json['discount'];
    price = json['price'];
    totalPrice = json['total_price'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['amount'] = this.amount;
    data['image'] = this.image;
    data['discount'] = this.discount;
    data['price'] = this.price;
    data['total_price'] = this.totalPrice;
    return data;
  }
}
