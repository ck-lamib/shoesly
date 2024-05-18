import 'dart:convert';

class Review {
  final String? id;
  final String? name;
  final String? image;
  final String? description;
  final int? rating;
  final String? date;

  Review({
    this.id,
    this.name,
    this.image,
    this.description,
    this.rating,
    this.date,
  });

  Review copyWith({
    String? id,
    String? name,
    String? image,
    String? description,
    int? rating,
    String? date,
  }) =>
      Review(
        id: id ?? this.id,
        name: name ?? this.name,
        image: image ?? this.image,
        description: description ?? this.description,
        rating: rating ?? this.rating,
        date: date ?? this.date,
      );

  factory Review.fromRawJson(String str) => Review.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Review.fromJson(Map<String, dynamic> json) => Review(
        id: json["id"],
        name: json["name"],
        image: json["image"],
        description: json["description"],
        rating: json["rating"],
        date: json["date"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "image": image,
        "description": description,
        "rating": rating,
        "date": date,
      };
}
