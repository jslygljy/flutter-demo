class ListModel {
  List<Data> data;

  ListModel({this.data});

  ListModel.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = new List<Data>();
      json['data'].forEach((v) {
        data.add(new Data.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.data != null) {
      data['data'] = this.data.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Data {
  String image;
  String mallPrice;
  String price;
  String name;
  String text;

  Data({this.image, this.mallPrice, this.price, this.name, this.text});

  Data.fromJson(Map<String, dynamic> json) {
    image = json['image'];
    mallPrice = json['mallPrice'];
    price = json['price'];
    name = json['name'];
    text = json['text'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['image'] = this.image;
    data['mallPrice'] = this.mallPrice;
    data['price'] = this.price;
    data['name'] = this.name;
    data['text'] = this.text;
    return data;
  }
}