import 'package:flutter/material.dart';
import 'package:flutter_pjs_boilerplate2/common/constants/color.dart';
import 'package:flutter_pjs_boilerplate2/layouts/default_layout.dart';
import 'package:flutter_pjs_boilerplate2/screens/boards/board_screen.dart';

class MainTab extends StatefulWidget {
  const MainTab({super.key});

  @override
  State<MainTab> createState() => _MainTabState();
}

class _MainTabState extends State<MainTab> with SingleTickerProviderStateMixin {
  int index = 0;
  late TabController controller;

  @override
  void initState() {
    super.initState();
    controller = TabController(
      length: 4,
      vsync: this, // mixin > SingleTickerProviderStateMixin 을 적용 해야함
    );
    controller.addListener(tabListener);
  }

  @override
  void dispose() {
    controller.removeListener(tabListener);
    super.dispose();
  }

  void tabListener() {
    setState(() {
      index = controller.index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return DefaultLayout(
      title: 'PJS Demo',
      backgroundColor: BACKGROUND_COLOR,
      child: TabBarView(
        controller: controller,
        physics: NeverScrollableScrollPhysics(),
        children: [
          BoardScreen(),
          BoardScreen(),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: PRIMARY_COLOR,
        unselectedItemColor: TEXT_COLOR,
        selectedFontSize: 10,
        unselectedFontSize: 10,
        type: BottomNavigationBarType.fixed,
        backgroundColor: BACKGROUND_COLOR,
        onTap: (int index) {
          controller.animateTo(index);
        },
        currentIndex: index,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home_outlined),
            label: '홈',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person_outline),
            label: '프로필',
          ),
        ],
      ),
    );
  }
}
