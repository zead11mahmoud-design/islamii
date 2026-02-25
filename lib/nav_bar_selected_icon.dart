import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class NavBarSelectedIcon extends StatelessWidget {
  String imageName;

  NavBarSelectedIcon({super.key, required this.imageName});
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 6, horizontal: 12),
      decoration: BoxDecoration(
        color: Color(0xFF202020).withValues(alpha: 0.6),
        borderRadius: BorderRadius.circular(66),
      ),
      child: SvgPicture.asset(
        'assets/icons/$imageName.svg',
        height: 22,
        width: 22,
        fit: BoxFit.fill,
        colorFilter: ColorFilter.mode(Colors.white, BlendMode.srcIn),
      ),
    );
  }
}
