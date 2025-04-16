import 'package:json_annotation/json_annotation.dart';

part 'board_model.g.dart';

@JsonSerializable()
class BoardModel {
  final int id;
  final String krTitle;
  final String krContents;
  final String? createdDtm;
  final String? updatedDtm;

  BoardModel({
    required this.id,
    required this.krTitle,
    required this.krContents,
    this.createdDtm,
    this.updatedDtm,
  });

  factory BoardModel.fromJson(Map<String, dynamic> json) =>
      _$BoardModelFromJson(json);

  Map<String, dynamic> toJson() => _$BoardModelToJson(this);
}
