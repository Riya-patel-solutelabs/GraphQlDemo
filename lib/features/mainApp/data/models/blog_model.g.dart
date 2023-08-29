// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'blog_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BlogModel _$BlogModelFromJson(Map<String, dynamic> json) => BlogModel(
      title: json['title'] as String?,
      excerpt: json['excerpt'] as String?,
      content: json['content'] as String?,
      coverImage: json['coverImage'] == null
          ? null
          : CoverimageModel.fromJson(
              json['coverImage'] as Map<String, dynamic>),
      author: json['author'] == null
          ? null
          : AuthorModel.fromJson(json['author'] as Map<String, dynamic>),
      id: json['id'] as String?,
    );

Map<String, dynamic> _$BlogModelToJson(BlogModel instance) => <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'excerpt': instance.excerpt,
      'content': instance.content,
      'coverImage': instance.coverImage,
      'author': instance.author,
    };
