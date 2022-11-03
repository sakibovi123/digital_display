class ProductModel {
  int? id;
  String? name;
  String? unit;
  String? price;
  String? salePrice;
  String? image;
  String? category;
  String? badge;

  ProductModel(
      {this.id,
      this.name,
      this.unit,
      this.price,
      this.salePrice,
      this.image,
      this.category,
      this.badge});

  ProductModel.fromJson(Map<String, dynamic> json) {
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
