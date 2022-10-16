import 'package:shamo_app/model/category.dart';
import 'package:shamo_app/model/galleries.dart';

class ProductsResponse {
  int? id;
  String? name;
  double? price;
  String? description;
  String? tags = null;
  DateTime? createdAt;
  DateTime? updatedAt;
  Category? category;
  List<Galleries>? galleries;

  ProductsResponse({
    this.id,
    this.name,
    this.price,
    this.description,
    this.tags,
    this.createdAt,
    this.updatedAt,
    this.category,
    this.galleries,
  });

  ProductsResponse.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    price = double.parse(json['price'].toString());
    description = json['description'];
    tags = json['tags'];
    createdAt = DateTime.parse(json['created_at'].toString());
    updatedAt = DateTime.parse(json['updated_at'].toString());
    // category = Category.fromJson(json['category']);
    category = json['category'] != null
        ? new Category.fromJson(json['category'])
        : null;
    // galleries = json['galleries']
    //     .map<Galleries>(
    //       (gallery) => Galleries.fromJson(gallery),
    //     )
    //     .toList();
    if (json['galleries'] != null) {
      galleries = <Galleries>[];
      json['galleries'].forEach((v) {
        galleries!.add(new Galleries.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['price'] = this.price;
    data['description'] = this.description;
    data['tags'] = this.tags;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    // data['category'] = category!.toJson();
    // data['galleries'] = galleries!.map((gallery) => gallery.toJson()).toList();
    if (this.category != null) {
      data['category'] = this.category!.toJson();
    }
    if (this.galleries != null) {
      data['galleries'] = this.galleries!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}
