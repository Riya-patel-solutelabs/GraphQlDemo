import 'package:json_annotation/json_annotation.dart';
import 'author_model.dart';
import 'coverimage_model.dart';

part 'blog_model.g.dart';

///blog model class
@JsonSerializable()
class BlogModel {
  ///default constructor
  const BlogModel(
      {this.title,
      this.excerpt,
      this.content,
      this.coverImage,
      this.author,
      this.id});

  ///from  json
  factory BlogModel.fromJson(Map<String, dynamic> json) =>
      _$BlogModelFromJson(json);

  ///to json
  Map<String, dynamic> toJson() => _$BlogModelToJson(this);

  final String? id;
  final String? title;
  final String? excerpt;
  final String? content;
  final CoverimageModel? coverImage;
  final AuthorModel? author;
}
