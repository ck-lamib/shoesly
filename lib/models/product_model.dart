import 'dart:convert';

import 'package:shoesly/models/review_model.dart';
import 'package:shoesly/utils/constants/enums.dart';

typedef ProductModelList = List<ProductModel>;

// ProductModelList productModelListFromJson(String str) =>
//     List<ProductModel>.from(
//       json.decode(str).map(
//             (x) => ProductModel.fromJson(x),
//           ),
//     );
ProductModelList productModelListFromJsonList(List<dynamic> jsons) =>
    jsons.map((e) => ProductModel.fromJson(e)).toList();

class ProductModel {
  final String? id;
  final String? name;
  final String? description;
  final List<String>? images;
  final List<String>? sizes;
  final List<ProductColors>? colors;
  final double? price;
  final double? averageRating;
  final Brands? brand;
  final List<Review>? reviews;
  final String? dateAdded;
  final Genders? gender;

  ProductModel({
    this.id,
    this.name,
    this.description,
    this.images,
    this.sizes,
    this.colors,
    this.price,
    this.averageRating,
    this.brand,
    this.reviews,
    this.dateAdded,
    this.gender,
  });

  ProductModel copyWith({
    String? id,
    String? name,
    String? description,
    List<String>? images,
    List<String>? sizes,
    List<ProductColors>? colors,
    double? price,
    double? averageRating,
    Brands? brand,
    List<Review>? reviews,
    String? dateAdded,
    Genders? gender,
  }) =>
      ProductModel(
        id: id ?? this.id,
        name: name ?? this.name,
        description: description ?? this.description,
        images: images ?? this.images,
        sizes: sizes ?? this.sizes,
        colors: colors ?? this.colors,
        price: price ?? this.price,
        averageRating: averageRating ?? this.averageRating,
        brand: brand ?? this.brand,
        reviews: reviews ?? this.reviews,
        dateAdded: dateAdded ?? this.dateAdded,
        gender: gender ?? this.gender,
      );

  factory ProductModel.fromRawJson(String str) =>
      ProductModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory ProductModel.fromJson(Map<String, dynamic> json) => ProductModel(
        id: json["id"],
        name: json["name"],
        description: json["description"],
        images: json["images"] == null
            ? []
            : List<String>.from(json["images"]!.map((x) => x)),
        sizes: json["sizes"] == null
            ? []
            : List<String>.from(json["sizes"]!.map((x) => x)),
        colors: json["colors"] == null
            ? []
            : List<ProductColors>.from(
                json["colors"]!.map((x) => parseColor(x))),
        price: json["price"],
        averageRating: json["averageRating"],
        brand: parseBrand(json["brand"]),
        reviews: json["reviews"] == null
            ? []
            : List<Review>.from(
                json["reviews"]!.map((x) => Review.fromJson(x)),
              ),
        dateAdded: json["dateAdded"],
        gender: parseGender(json["gender"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "description": description,
        "images":
            images == null ? [] : List<dynamic>.from(images!.map((x) => x)),
        "sizes": sizes == null ? [] : List<dynamic>.from(sizes!.map((x) => x)),
        "colors": colors == null
            ? []
            : List<dynamic>.from(colors!.map((x) => getColorString(x))),
        "price": price,
        "averageRating": averageRating,
        "brand": getBrandString(brand),
        "reviews": reviews == null
            ? []
            : List<dynamic>.from(reviews!.map((x) => x.toJson())),
        "dateAdded": dateAdded,
        "gender": getGenderString(gender),
      };

  // Helper methods to parse and serialize the Brands enum
  static Brands? parseBrand(String? brandString) {
    switch (brandString?.toLowerCase()) {
      case "all":
        return Brands.all;
      case "adidas":
        return Brands.adidas;
      case "jordan":
        return Brands.jordan;
      case "nike":
        return Brands.nike;
      case "puma":
        return Brands.puma;
      case "reebok":
        return Brands.reebok;
      case "vans":
        return Brands.vans;
      default:
        return null;
    }
  }

  static String? getBrandString(Brands? brand) {
    switch (brand) {
      case Brands.all:
        return "all";
      case Brands.adidas:
        return "adidas";
      case Brands.jordan:
        return "jordan";
      case Brands.nike:
        return "nike";
      case Brands.puma:
        return "puma";
      case Brands.reebok:
        return "reebok";
      case Brands.vans:
        return "vans";
      default:
        return null;
    }
  }

  static Genders? parseGender(String? genderString) {
    switch (genderString?.toLowerCase()) {
      case "man":
        return Genders.man;
      case "woman":
        return Genders.woman;
      case "unisex":
        return Genders.unisex;
      default:
        return null;
    }
  }

  // Helper method to get the string representation of the Genders enum
  static String? getGenderString(Genders? gender) {
    switch (gender) {
      case Genders.man:
        return "Man";
      case Genders.woman:
        return "Woman";
      case Genders.unisex:
        return "Unisex";
      default:
        return null;
    }
  }

  static ProductColors? parseColor(String? colorString) {
    switch (colorString?.toLowerCase()) {
      case "black":
        return ProductColors.black;
      case "white":
        return ProductColors.white;
      case "red":
        return ProductColors.red;
      case "grey":
        return ProductColors.grey;
      case "blue":
        return ProductColors.blue;
      default:
        return null;
    }
  }

  static String? getColorString(ProductColors? color) {
    switch (color) {
      case ProductColors.black:
        return "Black";
      case ProductColors.white:
        return "White";
      case ProductColors.red:
        return "Red";
      case ProductColors.grey:
        return "Grey";
      case ProductColors.blue:
        return "Blue";
      default:
        return null;
    }
  }
}
