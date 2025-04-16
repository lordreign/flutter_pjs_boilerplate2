// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'board_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BoardModel _$BoardModelFromJson(Map<String, dynamic> json) => BoardModel(
      id: (json['id'] as num).toInt(),
      krTitle: json['krTitle'] as String,
      krContents: json['krContents'] as String,
      createdDtm: json['createdDtm'] as String?,
      updatedDtm: json['updatedDtm'] as String?,
    );

Map<String, dynamic> _$BoardModelToJson(BoardModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'krTitle': instance.krTitle,
      'krContents': instance.krContents,
      'createdDtm': instance.createdDtm,
      'updatedDtm': instance.updatedDtm,
    };
