import 'dart:convert';
import 'package:equatable/equatable.dart';


class BreedModel extends Equatable {
  final String id;
  final String name;
  final String origin;
  final String description;
  final String lifeSpan;
  final int adaptability;
  final int intelligence;
  final String referenceImageId;

  final String urlImage;

  const BreedModel({
    required this.id,
    required this.name,
    required this.origin,
    required this.description,
    required this.lifeSpan,
    required this.adaptability,
    required this.intelligence,
    required this.referenceImageId,
    required this.urlImage,
  });

  factory BreedModel.fromJson(Map<String, dynamic> json) => BreedModel(
    id: json["id"]??"",
    name: json["name"]??"",
    origin: json["origin"]??"",
    description: json["description"]??"",
    lifeSpan: json["life_span"]??"",
    adaptability: json["adaptability"],
    intelligence: json["intelligence"],
    referenceImageId: json["reference_image_id"]??"",
    urlImage: "",
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "origin": origin,
    "description": description,
    "life_span": lifeSpan,
    "adaptability": adaptability,
    "intelligence": intelligence,
    "reference_image_id": referenceImageId,
  };

  BreedModel copyWith({
    String? id,
    String? name,
    String? origin,
    String? description,
    String? lifeSpan,
    int? adaptability,
    int? intelligence,
    String? referenceImageId,
    String? urlImage,
  }) =>
      BreedModel(
        id: id ?? this.id,
        name: name ?? this.name,
        origin: origin ?? this.origin,
        description: description ?? this.description,
        lifeSpan: lifeSpan ?? this.lifeSpan,
        adaptability: adaptability ?? this.adaptability,
        intelligence: intelligence ?? this.intelligence,
        referenceImageId: referenceImageId ?? this.referenceImageId,
        urlImage: urlImage ?? this.urlImage,
      );

  static List<BreedModel> breedModelFromJson(String str) => List<BreedModel>.from(json.decode(str).map((x) => BreedModel.fromJson(x)));

  static String breedModelToJson(List<BreedModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

  @override
  List<Object?> get props => [
    id,
    name,
    origin,
    description,
    lifeSpan,
    adaptability,
    intelligence,
    referenceImageId,
    urlImage,
  ];

}
