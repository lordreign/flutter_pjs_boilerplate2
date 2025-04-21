import 'package:flutter_pjs_boilerplate2/models/common/cursor_pagination_model.dart';
import 'package:flutter_pjs_boilerplate2/models/common/pagination_params.dart';
import 'package:flutter_pjs_boilerplate2/repositories/boards/board_repository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final boardProvider =
    StateNotifierProvider<BoardStateNotifier, CursorPaginationBase>(
  (ref) {
    final repository = ref.watch(boardRepositoryProvider);

    return BoardStateNotifier(repository: repository);
  },
);

class BoardStateNotifier extends StateNotifier<CursorPaginationBase> {
  final BoardRepository repository;

  BoardStateNotifier({
    required this.repository,
  }) : super(CursorPaginationLoading()) {
    getBoards();
  }

  Future<void> getBoards({
    int size = 10,
    bool fetchMore = false,
    // 강제로 다시 로딩하기
    // true - CursorPaginationLoading
    // false - 데이터를 유지한 상태에서 fetch
    bool forceRefetch = false,
  }) async {
    try {
      if (state is CursorPagination && !forceRefetch) {
        final cpState = state as CursorPagination;

        if (cpState.meta.totalCount <= (cpState.meta.totalPage * size)) {
          return;
        }
      }

      final isLoading = state is CursorPaginationLoading;
      final isFetching = state is CursorPaginationFetching;
      if (fetchMore && (isLoading || isFetching)) {
        return;
      }
      // pagination params 생성
      PaginationParams paginationParams = PaginationParams(
        boardId: 'NEWS',
        page: 1,
        size: size,
      );

      if (fetchMore) {
        final cpState = state as CursorPagination;
        state = CursorPaginationFetching(
          meta: cpState.meta,
          data: cpState.data,
        );
        paginationParams = paginationParams.copyWith(
          page: cpState.meta.currentPage + 1,
        );
      } else {
        if (state is CursorPagination && !forceRefetch) {
          final cpState = state as CursorPagination;
          state = CursorPaginationFetching(
            meta: cpState.meta,
            data: cpState.data,
          );
        } else {
          state = CursorPaginationLoading();
        }
      }

      final resp = await repository.getBoards(
        paginationParams: paginationParams,
      );

      if (fetchMore) {
        final cpState = state as CursorPagination;
        state = resp.copyWith(
          meta: resp.meta,
          data: [...cpState.data, ...resp.data],
        );
      } else {
        state = resp;
      }
    } catch (e) {
      print(e);
      state = CursorPaginationError(
        message: '데이터를 가져오지 못했습니다.',
      );
    }
  }
}
