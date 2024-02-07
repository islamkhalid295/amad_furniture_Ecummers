class BasicDataModel {
  String? logo;
  CallUs? callUs;
  List<Socialmedia>? socialmedia;

  BasicDataModel({this.logo, this.callUs, this.socialmedia});

  BasicDataModel.fromJson(Map<String, dynamic> json) {
    logo = json['logo'];
    callUs =
    json['call_us'] != null ? new CallUs.fromJson(json['call_us']) : null;
    if (json['socialmedia'] != null) {
      socialmedia = <Socialmedia>[];
      json['socialmedia'].forEach((v) {
        socialmedia!.add(new Socialmedia.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['logo'] = this.logo;
    if (this.callUs != null) {
      data['call_us'] = this.callUs!.toJson();
    }
    if (this.socialmedia != null) {
      data['socialmedia'] = this.socialmedia!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class CallUs {
  String? location;
  String? email;
  String? number;

  CallUs({this.location, this.email, this.number});

  CallUs.fromJson(Map<String, dynamic> json) {
    location = json['location'];
    email = json['email'];
    number = json['number'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['location'] = this.location;
    data['email'] = this.email;
    data['number'] = this.number;
    return data;
  }
}

class Socialmedia {
  String? name;
  String? logo;
  String? url;

  Socialmedia({this.name, this.logo, this.url});

  Socialmedia.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    logo = json['logo'];
    url = json['url'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['logo'] = this.logo;
    data['url'] = this.url;
    return data;
  }
}
