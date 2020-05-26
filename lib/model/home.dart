class HomeModel {
  List<String> slides;
  List<Category> category;
  List<RecommendList> recommendList;

  HomeModel({this.slides, this.category, this.recommendList});

  HomeModel.fromJson(Map<String, dynamic> json) {
    slides = json['slides'].cast<String>();
    if (json['category'] != null) {
      category = new List<Category>();
      json['category'].forEach((v) {
        category.add(new Category.fromJson(v));
      });
    }
    if (json['recommendList'] != null) {
      recommendList = new List<RecommendList>();
      json['recommendList'].forEach((v) {
        recommendList.add(new RecommendList.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['slides'] = this.slides;
    if (this.category != null) {
      data['category'] = this.category.map((v) => v.toJson()).toList();
    }
    if (this.recommendList != null) {
      data['recommendList'] =
          this.recommendList.map((v) => v.toJson()).toList();
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

class RecommendList {
  String image;
  String mallPrice;
  String price;

  RecommendList({this.image, this.mallPrice, this.price});

  RecommendList.fromJson(Map<String, dynamic> json) {
    image = json['image'];
    mallPrice = json['mallPrice'];
    price = json['price'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['image'] = this.image;
    data['mallPrice'] = this.mallPrice;
    data['price'] = this.price;
    return data;
  }
}