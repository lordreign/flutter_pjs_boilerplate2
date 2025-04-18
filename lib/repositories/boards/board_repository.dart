import 'package:dio/dio.dart';
import 'package:flutter_pjs_boilerplate2/models/board_model.dart';
import 'package:flutter_pjs_boilerplate2/models/common/cursor_pagination_model.dart';
import 'package:flutter_pjs_boilerplate2/models/common/pagination_params.dart';
import 'package:flutter_pjs_boilerplate2/providers/dio_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:retrofit/retrofit.dart';

part 'board_repository.g.dart';

final boardRepositoryProvider = Provider<BoardRepository>(
  (ref) {
    // provider 안에서는 watch를 쓰는게 좋음
    final dio = ref.watch(dioProvider);
    return BoardRepository(dio);
  },
);

@RestApi()
abstract class BoardRepository {
  factory BoardRepository(Dio dio, {String baseUrl}) = _BoardRepository;

  @GET('/api/boardItems')
  Future<CursorPagination<BoardModel>> getBoards({
    @Queries() PaginationParams? paginationParams = const PaginationParams(),
  });
}
