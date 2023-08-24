import 'package:json_annotation/json_annotation.dart';

part 'coverimage_model.g.dart';
///cover image of blogs model class
@JsonSerializable()
class CoverimageModel {
  ///default constructor
  const CoverimageModel({required this.url});

  ///blogs url
  final String? url;

///from  json
  factory CoverimageModel.fromJson(Map<String, dynamic> json) =>
      _$CoverimageModelFromJson(json);

  ///to json
  Map<String, dynamic> toJson() => _$CoverimageModelToJson(this);


  
}
