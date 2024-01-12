class SliderItemsList {
  List<SliderItem>? slider;

  SliderItemsList({this.slider});

  SliderItemsList.fromJson(Map<String, dynamic> json) {
    if (json['slider'] != null) {
      slider = <SliderItem>[];
      json['slider'].forEach((v) {
        slider!.add(new SliderItem.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.slider != null) {
      data['slider'] = this.slider!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class SliderItem {
  String? id;
  String? imageUrl;
  String? title;
  String? description;

  SliderItem({this.id, this.imageUrl, this.title, this.description});

  SliderItem.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    imageUrl = json['image_url'];
    title = json['title'];
    description = json['description'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['image_url'] = this.imageUrl;
    data['title'] = this.title;
    data['description'] = this.description;
    return data;
  }
}
