import 'package:flutter/material.dart';
import 'package:islami/app_theme.dart';

class CustomIndicator extends StatelessWidget {
  bool active;
  CustomIndicator({super.key, required this.active});
  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      margin: EdgeInsets.only(left: 11),
      duration: Duration(milliseconds: 250),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(100),
        color: active ? AppTheme.primary : Color(0xFF707070),
      ),
      width: active ? 18 : 7,
      height: 7,
    );
  }
}
