// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pagination_params.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PaginationParams _$PaginationParamsFromJson(Map<String, dynamic> json) =>
    PaginationParams(
      boardId: json['boardId'] as String?,
      page: (json['page'] as num?)?.toInt(),
      size: (json['size'] as num?)?.toInt(),
      sort: json['sort'] as String?,
      sortType: json['sortType'] as String?,
    );

Map<String, dynamic> _$PaginationParamsToJson(PaginationParams instance) =>
    <String, dynamic>{
      'boardId': instance.boardId,
      'page': instance.page,
      'size': instance.size,
      'sort': instance.sort,
      'sortType': instance.sortType,
    };
