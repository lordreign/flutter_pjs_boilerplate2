import 'package:flutter/material.dart';
import 'package:flutter_pjs_boilerplate2/common/constants/color.dart';
import 'package:flutter_pjs_boilerplate2/layouts/default_layout.dart';
import 'package:flutter_pjs_boilerplate2/models/common/cursor_pagination_model.dart';
import 'package:flutter_pjs_boilerplate2/providers/boards/board_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class BoardScreen extends ConsumerStatefulWidget {
  const BoardScreen({super.key});

  @override
  ConsumerState<BoardScreen> createState() => _BoardScreenState();
}

class _BoardScreenState extends ConsumerState<BoardScreen> {
  final ScrollController _scrollController = ScrollController();
  int page = 0;

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(() {
      if (_scrollController.offset >
          _scrollController.position.maxScrollExtent - 300) {
        ref.read(boardProvider.notifier).getBoards(
              fetchMore: true,
              forceRefetch: false,
            );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final data = ref.watch(boardProvider);

    if (data is CursorPaginationLoading) {
      return Center(
        child: CircularProgressIndicator(),
      );
    }

    if (data is CursorPaginationError) {
      return Center(
        child: Text(
          data.message,
          style: TextStyle(fontSize: 24, color: ERROR_COLOR),
        ),
      );
    }

    final cp = data as CursorPagination;

    return Container(
      child: Center(
        child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: ListView.separated(
              controller: _scrollController,
              itemCount: cp.data.length + 1,
              itemBuilder: (_, index) {
                if (index == cp.data.length) {
                  return Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                    child: Center(
                      child: data is CursorPaginationFetching
                          ? CircularProgressIndicator()
                          : Text(''),
                    ),
                  );
                }

                final parsedItem = cp.data[index];

                return GestureDetector(
                  onTap: () {
                    // Navigator.of(context).push(
                    //   MaterialPageRoute(
                    //     builder: (_) => BaordDetailScreen(
                    //       id: parsedItem.id,
                    //     ),
                    //   ),
                    // );
                  },
                  child: Center(
                    child: Text('text'),
                  ),
                );
              },
              separatorBuilder: (_, index) {
                return const SizedBox(height: 16);
              },
            )),
      ),
    );
  }
}
