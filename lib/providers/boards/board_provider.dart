import 'package:flutter_pjs_boilerplate2/models/common/cursor_pagination_model.dart';
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
    int page = 0,
    int size = 20,
    // 강제로 다시 로딩하기
    // true - CursorPaginationLoading
    // false - 데이터를 유지한 상태에서 fetch
    bool forceRefetch = false,
  }) async {
    try {
      // TODO
    } catch (e) {
      state = CursorPaginationError(
        message: '데이터를 가져오지 못했습니다.',
      );
    }
  }
}
