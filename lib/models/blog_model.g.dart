// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'blog_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BlogModel _$BlogModelFromJson(Map<String, dynamic> json) {
  return BlogModel(
    id: json['id'] as String,
    title: json['title'] as String,
    createdAt: json['createdAt'] as String,
    imageUrl: json['imageUrl'] as String,
  );
}

Map<String, dynamic> _$BlogModelToJson(BlogModel instance) => <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'createdAt': instance.createdAt,
      'imageUrl': instance.imageUrl,
    };
