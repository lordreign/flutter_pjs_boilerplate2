import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(() {
      // if (_scrollController.position.pixels ==
      //     _scrollController.position.maxScrollExtent) {
      //   // Load more data when scrolled to the bottom
      //   print('Load more data');
      // }
      if (_scrollController.offset >
          _scrollController.position.maxScrollExtent - 300) {
        // provider.paginate(
        //   fetchMore: true,
        // );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        'Home Screen',
        style: TextStyle(fontSize: 24),
      ),
    );
  }
}
