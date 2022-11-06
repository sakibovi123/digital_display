class ProductModel {
  String? status;
  List<Results>? results;

  ProductModel({this.status, this.results});

  ProductModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    if (json['results'] != null) {
      results = <Results>[];
      json['results'].forEach((v) {
        results!.add(new Results.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    if (this.results != null) {
      data['results'] = this.results!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Results {
  int? id;
  String? name;
  Null? unit;
  String? price;
  Null? salePrice;
  String? image;
  Null? category;
  Null? badge;

  Results(
      {this.id,
      this.name,
      this.unit,
      this.price,
      this.salePrice,
      this.image,
      this.category,
      this.badge});

  Results.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    unit = json['unit'];
    price = json['price'];
    salePrice = json['sale_price'];
    image = json['image'];
    category = json['category'];
    badge = json['badge'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['unit'] = this.unit;
    data['price'] = this.price;
    data['sale_price'] = this.salePrice;
    data['image'] = this.image;
    data['category'] = this.category;
    data['badge'] = this.badge;
    return data;
  }
}
