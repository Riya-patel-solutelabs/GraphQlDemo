import 'package:json_annotation/json_annotation.dart';

part 'author_model.g.dart';
///author model
@JsonSerializable()
class AuthorModel {
  ///default constructor
  const AuthorModel({required this.name, this.profile});

///from  json
  factory AuthorModel.fromJson(Map<String, dynamic> json) =>
      _$AuthorModelFromJson(json);

  ///to json
  Map<String, dynamic> toJson() => _$AuthorModelToJson(this);
  ///name of the author
  final String name;

  ///url of profile
  final String? profile;
}
