import 'package:seventy_five/features/blogs/domain/entities/blog.dart';


class BlogModel extends BlogEntity {
  const BlogModel(
      {required super.author,
      required super.title,
      required super.description,
      required super.url,
      required super.urlToImage,
      required super.publishedAt,
      required super.content});

  factory BlogModel.fromJson(Map<String, dynamic> map) {
    return BlogModel(
        author: map["author"] ?? "",
        title: map["title"] ?? "",
        description: map["description"] ?? "",
        url: map["url"] ?? "",
        urlToImage: map["urlToImage"] ?? "",
        publishedAt: map["publishedAt"] ?? "",
        content: map["content"] ?? "");
  }
}
