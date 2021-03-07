part of 'model.dart';

NewsModel newsModelFromJson(String str) => NewsModel.fromJson(json.decode(str));

String newsModelToJson(NewsModel data) => json.encode(data.toJson());

class NewsModel {
    NewsModel({
        this.id,
        this.title,
        this.image,
        this.source,
        this.description,
        this.createdAt,
    });

    int id;
    String title;
    String image;
    String source;
    String description;
    DateTime createdAt;

    factory NewsModel.fromJson(Map<String, dynamic> json) => NewsModel(
        id: json["id"],
        title: json["title"],
        image: json["image"],
        source: json["source"],
        description: json["description"],
        createdAt: DateTime.parse(json["created_at"]),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "image": image,
        "source": source,
        "description": description,
        "created_at": createdAt.toIso8601String(),
    };
}
