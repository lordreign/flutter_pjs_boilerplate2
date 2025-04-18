// @Query('boardId') String boardId = 'NEWS',
//     @Query('page') int page = 0,
//     @Query('size') int size = 20,
//     @Query('sort') String sort = 'id',
//     @Query('sortType') String sortType = 'desc',

import 'package:json_annotation/json_annotation.dart';

part 'pagination_params.g.dart';

@JsonSerializable()
class PaginationParams {
  final String? boardId;
  final int? page;
  final int? size;
  final String? sort;
  final String? sortType;

  const PaginationParams({
    this.boardId,
    this.page,
    this.size,
    this.sort,
    this.sortType,
  });

  PaginationParams copyWith({
    String? boardId,
    int? page,
    int? size,
    String? sort,
    String? sortType,
  }) {
    return PaginationParams(
      boardId: boardId ?? this.boardId,
      page: page ?? this.page,
      size: size ?? this.size,
      sort: sort ?? this.sort,
      sortType: sortType ?? this.sortType,
    );
  }

  factory PaginationParams.fromJson(Map<String, dynamic> json) =>
      _$PaginationParamsFromJson(json);

  Map<String, dynamic> toJson() => _$PaginationParamsToJson(this);
}
