import 'package:json_annotation/json_annotation.dart';

part 'blog_model.g.dart';

@JsonSerializable()
class BlogModel{
  String id;
  String title;
  String createdAt;
  String imageUrl;

  BlogModel({this.id, this.title, this.createdAt, this.imageUrl});

  factory BlogModel.fromJson(Map<String, dynamic> json) => _$BlogModelFromJson(json);

  Map<String, dynamic> toJson() => _$BlogModelToJson(this);

}