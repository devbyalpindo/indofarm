part of 'model.dart';

GaleryModel galeryModelFromJson(String str) => GaleryModel.fromJson(json.decode(str));

String galeryModelToJson(GaleryModel data) => json.encode(data.toJson());

class GaleryModel {
    GaleryModel({
        this.id,
        this.name,
        this.image,
        this.description,
        this.createdAt,
    });

    int id;
    String name;
    String image;
    String description;
    dynamic createdAt;

    factory GaleryModel.fromJson(Map<String, dynamic> json) => GaleryModel(
        id: json["id"],
        name: json["name"],
        image: json["image"],
        description: json["description"],
        createdAt: json["created_at"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "image": image,
        "description": description,
        "created_at": createdAt,
    };
}
