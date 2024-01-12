class CategoriesList {
  List<Categories>? categories;

  CategoriesList({this.categories});

  CategoriesList.fromJson(Map<String, dynamic> json) {
    if (json['categories'] != null) {
      categories = <Categories>[];
      json['categories'].forEach((v) {
        categories!.add(new Categories.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.categories != null) {
      data['categories'] = this.categories!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Categories {
  late String name;
  late String imageUrl;
  List<String>? subcategories;

  Categories({required this.name, required this.imageUrl, this.subcategories});

  Categories.fromJson(Map<String, dynamic> json) {
    name = json['name'] ?? "";
    imageUrl = json['image_url'] ??"";
    subcategories = json['subcategories'].cast<String>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['image_url'] = this.imageUrl;
    data['subcategories'] = this.subcategories;
    return data;
  }
}
