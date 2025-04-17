import 'package:flutter/material.dart';
import 'package:flutter_pjs_boilerplate2/common/constants/color.dart';
import 'package:flutter_pjs_boilerplate2/layouts/default_layout.dart';
import 'package:flutter_pjs_boilerplate2/models/common/cursor_pagination_model.dart';
import 'package:flutter_pjs_boilerplate2/providers/boards/board_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HomeScreen extends ConsumerStatefulWidget {
  const HomeScreen({super.key});

  @override
  ConsumerState<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends ConsumerState<HomeScreen> {
  final ScrollController _scrollController = ScrollController();
  int page = 0;

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(() {
      if (_scrollController.offset >
          _scrollController.position.maxScrollExtent - 300) {
        ref.read(boardProvider.notifier).getBoards(
              page: page + 1,
              forceRefetch: false,
            );
        page += 1;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final data = ref.watch(boardProvider);

    if (data is CursorPaginationLoading) {
      return DefaultLayout(
        backgroundColor: BACKGROUND_COLOR,
        title: 'Board',
        child: Center(
          child: CircularProgressIndicator(),
        ),
      );
    }

    if (data is CursorPaginationError) {
      return DefaultLayout(
        backgroundColor: BACKGROUND_COLOR,
        title: 'Board',
        child: Center(
          child: Text(
            data.message,
            style: TextStyle(fontSize: 24, color: ERROR_COLOR),
          ),
        ),
      );
    }

    return DefaultLayout(
      backgroundColor: BACKGROUND_COLOR,
      title: 'Board',
      child: Center(
        child: Text(
          'Home Screen',
          style: TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}
