// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cursor_pagination_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CursorPaginationMeta _$CursorPaginationMetaFromJson(
        Map<String, dynamic> json) =>
    CursorPaginationMeta(
      result: json['result'] as bool,
      currentPage: (json['currentPage'] as num).toInt(),
      totalPage: (json['totalPage'] as num).toInt(),
      totalCount: (json['totalCount'] as num).toInt(),
    );

Map<String, dynamic> _$CursorPaginationMetaToJson(
        CursorPaginationMeta instance) =>
    <String, dynamic>{
      'result': instance.result,
      'currentPage': instance.currentPage,
      'totalPage': instance.totalPage,
      'totalCount': instance.totalCount,
    };

CursorPagination<T> _$CursorPaginationFromJson<T>(
  Map<String, dynamic> json,
  T Function(Object? json) fromJsonT,
) =>
    CursorPagination<T>(
      meta: CursorPaginationMeta.fromJson(json['meta'] as Map<String, dynamic>),
      data: (json['data'] as List<dynamic>).map(fromJsonT).toList(),
    );

Map<String, dynamic> _$CursorPaginationToJson<T>(
  CursorPagination<T> instance,
  Object? Function(T value) toJsonT,
) =>
    <String, dynamic>{
      'meta': instance.meta,
      'data': instance.data.map(toJsonT).toList(),
    };
