part of 'model.dart';

DictionaryModel dictionaryModelFromJson(String str) => DictionaryModel.fromJson(json.decode(str));

String dictionaryModelToJson(DictionaryModel data) => json.encode(data.toJson());

class DictionaryModel {
    DictionaryModel({
        this.id,
        this.title,
        this.description,
        this.createdAt,
    });

    int id;
    String title;
    String description;
    DateTime createdAt;

    factory DictionaryModel.fromJson(Map<String, dynamic> json) => DictionaryModel(
        id: json["id"],
        title: json["title"],
        description: json["description"],
        createdAt: DateTime.parse(json["created_at"]),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "description": description,
        "created_at": createdAt.toIso8601String(),
    };
}
