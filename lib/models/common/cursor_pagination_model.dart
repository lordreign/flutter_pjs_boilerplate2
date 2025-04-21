import 'package:json_annotation/json_annotation.dart';

part 'cursor_pagination_model.g.dart';

abstract class CursorPaginationBase {}

class CursorPaginationError extends CursorPaginationBase {
  final String message;

  CursorPaginationError({
    required this.message,
  });
}

class CursorPaginationLoading extends CursorPaginationBase {}

@JsonSerializable()
class CursorPaginationMeta {
  final bool result;
  final int currentPage;
  final int totalPage;
  final int totalCount;

  CursorPaginationMeta({
    required this.result,
    required this.currentPage,
    required this.totalPage,
    required this.totalCount,
  });

  CursorPaginationMeta copyWith({
    bool? result,
    int? currentPage,
    int? totalCount,
    int? totalPage,
  }) {
    return CursorPaginationMeta(
      result: result ?? this.result,
      currentPage: currentPage ?? this.currentPage,
      totalCount: totalCount ?? this.totalCount,
      totalPage: totalPage ?? this.totalPage,
    );
  }

  factory CursorPaginationMeta.fromJson(Map<String, dynamic> json) =>
      _$CursorPaginationMetaFromJson(json);
}

@JsonSerializable(
  // generic type parameter `T` is used in the `CursorPagination` class
  genericArgumentFactories: true,
)
class CursorPagination<T> extends CursorPaginationBase {
  final CursorPaginationMeta meta;
  final List<T> data;

  CursorPagination({
    required this.meta,
    required this.data,
  });

  CursorPagination copyWith({
    CursorPaginationMeta? meta,
    List<T>? data,
  }) {
    return CursorPagination<T>(
      meta: meta ?? this.meta,
      data: data ?? this.data,
    );
  }

  factory CursorPagination.fromJson(
          Map<String, dynamic> json, T Function(Object? json) fromJsonT) =>
      _$CursorPaginationFromJson(json, fromJsonT);
}

// 새로 고침 할때
class CursorPaginationFetching<T> extends CursorPagination<T> {
  CursorPaginationFetching({
    required super.meta,
    required super.data,
  });
}
