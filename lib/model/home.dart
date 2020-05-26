class HomeModel {
  List<String> slides;
  List<Category> category;

  HomeModel({this.slides, this.category});

  HomeModel.fromJson(Map<String, dynamic> json) {
    slides = json['slides'].cast<String>();
    if (json['category'] != null) {
      category = new List<Category>();
      json['category'].forEach((v) {
        category.add(new Category.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['slides'] = this.slides;
    if (this.category != null) {
      data['category'] = this.category.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Category {
  String image;
  String text;

  Category({this.image, this.text});

  Category.fromJson(Map<String, dynamic> json) {
    image = json['image'];
    text = json['text'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['image'] = this.image;
    data['text'] = this.text;
    return data;
  }
}