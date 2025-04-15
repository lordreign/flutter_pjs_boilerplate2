import 'package:flutter/material.dart';
import 'package:flutter_pjs_boilerplate2/common/constants/color.dart';

class CustomTextFormField extends StatelessWidget {
  final String? hintText;
  final String? errorText;
  final bool obscureText;
  final bool autofocus;
  final ValueChanged<String> onChanged;

  const CustomTextFormField({
    super.key,
    required this.onChanged,
    this.hintText,
    this.errorText,
    this.obscureText = false,
    this.autofocus = false,
  });

  @override
  Widget build(BuildContext context) {
    const baseBorder = OutlineInputBorder(
      // border side 테두리
      borderSide: BorderSide(
        color: BORDER_COLOR,
        width: 1.0,
      ),
    );

    return TextFormField(
      cursorColor: PRIMARY_COLOR,
      // 비밀번호일때
      obscureText: obscureText,
      autofocus: autofocus,
      onChanged: onChanged,
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.all(8.0),
        hintText: hintText,
        hintStyle: const TextStyle(
          color: TEXT_SUB_COLOR,
          fontSize: 14.0,
        ),
        errorText: errorText,
        // true > 배경색 있음, false > 배경색 없음
        filled: true,
        fillColor: INPUT_BG_COLOR,
        border: baseBorder,
        focusedBorder: baseBorder.copyWith(
          borderSide: baseBorder.borderSide.copyWith(
            color: PRIMARY_COLOR,
          ),
        ),
        enabledBorder: baseBorder,
      ),
    );
  }
}
