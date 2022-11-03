class DisplayModel {
  int? id;
  List<Products>? products;
  List<Catalogs>? catalogs;
  String? name;
  String? description;
  String? category;
  String? templateName;
  String? bannerText;

  DisplayModel(
      {this.id,
      this.products,
      this.catalogs,
      this.name,
      this.description,
      this.category,
      this.templateName,
      this.bannerText});

  DisplayModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    if (json['products'] != null) {
      products = <Products>[];
      json['products'].forEach((v) {
        products!.add(new Products.fromJson(v));
      });
    }
    if (json['catalogs'] != null) {
      catalogs = <Catalogs>[];
      json['catalogs'].forEach((v) {
        catalogs!.add(new Catalogs.fromJson(v));
      });
    }
    name = json['name'];
    description = json['description'];
    category = json['category'];
    templateName = json['template_name'];
    bannerText = json['banner_text'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    if (this.products != null) {
      data['products'] = this.products!.map((v) => v.toJson()).toList();
    }
    if (this.catalogs != null) {
      data['catalogs'] = this.catalogs!.map((v) => v.toJson()).toList();
    }
    data['name'] = this.name;
    data['description'] = this.description;
    data['category'] = this.category;
    data['template_name'] = this.templateName;
    data['banner_text'] = this.bannerText;
    return data;
  }
}

class Products {
  int? id;
  String? name;
  String? unit;
  String? price;
  String? salePrice;
  String? image;
  String? category;
  String? badge;

  Products(
      {this.id,
      this.name,
      this.unit,
      this.price,
      this.salePrice,
      this.image,
      this.category,
      this.badge});

  Products.fromJson(Map<String, dynamic> json) {
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

class Catalogs {
  int? id;
  Null? name;
  Null? unit;
  Null? price;
  Null? salePrice;
  Null? image;
  Null? video;
  Null? badge;

  Catalogs(
      {this.id,
      this.name,
      this.unit,
      this.price,
      this.salePrice,
      this.image,
      this.video,
      this.badge});

  Catalogs.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    unit = json['unit'];
    price = json['price'];
    salePrice = json['sale_price'];
    image = json['image'];
    video = json['video'];
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
    data['video'] = this.video;
    data['badge'] = this.badge;
    return data;
  }
}
