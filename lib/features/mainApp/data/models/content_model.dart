import 'package:json_annotation/json_annotation.dart';

part 'content_model.g.dart';


///blog content model class
@JsonSerializable() 
class ContentModel {
  ///default constructor
  ContentModel({required this.text});


  
///from  json
  factory ContentModel.fromJson(Map<String, dynamic> json) =>
      _$ContentModelFromJson(json);

  ///to json
  Map<String, dynamic> toJson() => _$ContentModelToJson(this);

///text form of content
  final String text;
}
