import 'package:flutter/material.dart';
import 'package:flutter_pjs_boilerplate2/common/constants/color.dart';

class DefaultLayout extends StatelessWidget {
  final Color backgroundColor;
  final Widget child;
  final String? title;
  final Widget? bottomNavigationBar;
  final bool automaticallyImplyLeading;
  final Widget? floatingActionButton;

  const DefaultLayout({
    super.key,
    required this.child,
    this.title,
    this.bottomNavigationBar,
    this.backgroundColor = Colors.white,
    this.automaticallyImplyLeading = false,
    this.floatingActionButton,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: renderAppBar(),
      body: child,
      bottomNavigationBar: bottomNavigationBar,
      floatingActionButton: floatingActionButton,
    );
  }

  AppBar? renderAppBar() {
    if (title == null) {
      return null;
    }
    return AppBar(
      backgroundColor: BACKGROUND_COLOR,
      automaticallyImplyLeading: automaticallyImplyLeading,
      title: Text(
        title!,
        style: const TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w500,
          color: TEXT_COLOR,
        ),
      ),
      elevation: 0,
      centerTitle: true,
    );
  }
}
