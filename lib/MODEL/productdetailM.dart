// To parse this JSON data, do
//
//     final addproductmodel = addproductmodelFromJson(jsonString);

import 'dart:convert';

Addproductmodel addproductmodelFromJson(String str) =>
    Addproductmodel.fromJson(json.decode(str));

String addproductmodelToJson(Addproductmodel data) =>
    json.encode(data.toJson());

class Addproductmodel {
  bool? status;
  Data? data;
  String? message;

  Addproductmodel({
    this.status,
    this.data,
    this.message,
  });

  factory Addproductmodel.fromJson(Map<String, dynamic> json) =>
      Addproductmodel(
        status: json["status"],
        data: json["data"] == null ? null : Data.fromJson(json["data"]),
        message: json["message"],
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "data": data?.toJson(),
        "message": message,
      };
}

class Data {
  Product? product;
  List<Related>? related;

  Data({
    this.product,
    this.related,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        product:
            json["product"] == null ? null : Product.fromJson(json["product"]),
        related: json["related"] == null
            ? []
            : List<Related>.from(
                json["related"]!.map((x) => Related.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "product": product?.toJson(),
        "related": related == null
            ? []
            : List<dynamic>.from(related!.map((x) => x.toJson())),
      };
}

class Product {
  int? id;
  String? name;
  String? price;
  String? image;
  String? description;
  String? storageInstructions;
  dynamic serves;
  int? categoryId;
  String? stock;
  List<CuttingType>? cuttingTypes;

  Product({
    this.id,
    this.name,
    this.price,
    this.image,
    this.description,
    this.storageInstructions,
    this.serves,
    this.categoryId,
    this.stock,
    this.cuttingTypes,
  });

  factory Product.fromJson(Map<String, dynamic> json) => Product(
        id: json["id"],
        name: json["name"],
        price: json["price"],
        image: json["image"],
        description: json["description"],
        storageInstructions: json["storage_instructions"],
        serves: json["serves"],
        categoryId: json["category_id"],
        stock: json["stock"],
        cuttingTypes: json["cutting_types"] == null
            ? []
            : List<CuttingType>.from(
                json["cutting_types"]!.map((x) => CuttingType.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "price": price,
        "image": image,
        "description": description,
        "storage_instructions": storageInstructions,
        "serves": serves,
        "category_id": categoryId,
        "stock": stock,
        "cutting_types": cuttingTypes == null
            ? []
            : List<dynamic>.from(cuttingTypes!.map((x) => x.toJson())),
      };
}

class CuttingType {
  int? id;
  int? productId;
  int? cuttingTypeId;
  String? type;
  String? cuttingImage;
  String? netWeight;
  String? grossWeight;
  String? originalPrice;
  String? offerPrice;
  String? offerPercentage;

  CuttingType({
    this.id,
    this.productId,
    this.cuttingTypeId,
    this.type,
    this.cuttingImage,
    this.netWeight,
    this.grossWeight,
    this.originalPrice,
    this.offerPrice,
    this.offerPercentage,
  });

  factory CuttingType.fromJson(Map<String, dynamic> json) => CuttingType(
        id: json["id"],
        productId: json["product_id"],
        cuttingTypeId: json["cutting_type_id"],
        type: json["type"],
        cuttingImage: json["cutting_image"],
        netWeight: json["net_weight"],
        grossWeight: json["gross_weight"],
        originalPrice: json["original_price"],
        offerPrice: json["offer_price"],
        offerPercentage: json["offer_percentage"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "product_id": productId,
        "cutting_type_id": cuttingTypeId,
        "type": type,
        "cutting_image": cuttingImage,
        "net_weight": netWeight,
        "gross_weight": grossWeight,
        "original_price": originalPrice,
        "offer_price": offerPrice,
        "offer_percentage": offerPercentage,
      };
}

class Related {
  int? id;
  String? productName;
  String? productImage;
  int? cuttingTypeId;
  String? type;
  String? cuttingImage;
  String? netWeight;
  String? grossWeight;
  String? originalPrice;
  String? offerPrice;
  String? offerPercentage;
  String? stock;
  int? categoryId;

  Related({
    this.id,
    this.productName,
    this.productImage,
    this.cuttingTypeId,
    this.type,
    this.cuttingImage,
    this.netWeight,
    this.grossWeight,
    this.originalPrice,
    this.offerPrice,
    this.offerPercentage,
    this.stock,
    this.categoryId,
  });

  factory Related.fromJson(Map<String, dynamic> json) => Related(
        id: json["id"],
        productName: json["product_name"],
        productImage: json["product_image"],
        cuttingTypeId: json["cutting_type_id"],
        type: json["type"],
        cuttingImage: json["cutting_image"],
        netWeight: json["net_weight"],
        grossWeight: json["gross_weight"],
        originalPrice: json["original_price"],
        offerPrice: json["offer_price"],
        offerPercentage: json["offer_percentage"],
        stock: json["stock"],
        categoryId: json["category_id"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "product_name": productName,
        "product_image": productImage,
        "cutting_type_id": cuttingTypeId,
        "type": type,
        "cutting_image": cuttingImage,
        "net_weight": netWeight,
        "gross_weight": grossWeight,
        "original_price": originalPrice,
        "offer_price": offerPrice,
        "offer_percentage": offerPercentage,
        "stock": stock,
        "category_id": categoryId,
      };
}
