import 'package:json_annotation/json_annotation.dart';

part 'board_model.g.dart';

@JsonSerializable()
class BoardModel {
  final String id;
  final String title;
  final String content;
  final String? createdAt;
  final String? updatedAt;

  BoardModel({
    required this.id,
    required this.title,
    required this.content,
    this.createdAt,
    this.updatedAt,
  });

  factory BoardModel.fromJson(Map<String, dynamic> json) =>
      _$BoardModelFromJson(json);

  Map<String, dynamic> toJson() => _$BoardModelToJson(this);
}
