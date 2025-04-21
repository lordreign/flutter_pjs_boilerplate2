import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_pjs_boilerplate2/common/constants/color.dart';

class SettingScreen extends StatelessWidget {
  const SettingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        'Settings Screen',
        style: TextStyle(
          fontSize: 24,
          color: TEXT_COLOR,
        ),
      ),
    );
  }
}
