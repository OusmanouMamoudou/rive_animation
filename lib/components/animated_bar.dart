import 'package:flutter/material.dart';

class AnimatedBar extends StatelessWidget {
  const AnimatedBar({
    super.key,
    required this.isActive,
  });

  final bool isActive;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    double height = size.height;
    double width = size.width;
    return AnimatedContainer(
      duration: const Duration(milliseconds: 150),
      margin: EdgeInsets.only(top: height * 0.01),
      height: height * 0.005,
      width: isActive ? width * 0.06 : 0,
      decoration: const BoxDecoration(
        color: Color(0xFF81B4FF),
      ),
    );
  }
}
