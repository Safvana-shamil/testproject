import 'dart:convert';

List<CourseModel> courseModelFromMap(String str) =>
    List<CourseModel>.from(json.decode(str).map((x) => CourseModel.fromMap(x)));

String courseModelToMap(List<CourseModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toMap())));

class CourseModel {
  CourseModel({
    required this.body,
    required this.category,
    required this.cover,
    required this.createdAt,
    required this.id,
    required this.isDraft,
    required this.title,
    required this.views,
  });

  final String body;
  final String category;
  final String cover;
  final DateTime createdAt;
  final int id;
  final bool isDraft;
  final String title;
  final int views;

  factory CourseModel.fromMap(Map<String, dynamic> json) => CourseModel(
        body: json["body"],
        category: json["category"]!,
        cover: json["cover"],
        createdAt: DateTime.parse(json["createdAt"]),
        id: json["id"],
        isDraft: json["isDraft"],
        title: json["title"],
        views: json["views"],
      );

  Map<String, dynamic> toMap() => {
        "body": body,
        "category": category,
        "cover": cover,
        "createdAt": createdAt.toIso8601String(),
        "id": id,
        "isDraft": isDraft,
        "title": title,
        "views": views,
      };
}
