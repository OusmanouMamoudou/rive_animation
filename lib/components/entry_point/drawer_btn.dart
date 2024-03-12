import 'package:flutter/material.dart';
import 'package:rive/rive.dart';

class DrawerBtn extends StatelessWidget {
  const DrawerBtn({
    super.key,
    this.onTap,
    required this.riveOnInit,
  });
  final void Function()? onTap;
  final ValueChanged<Artboard> riveOnInit;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    double height = size.height;
    double width = size.width;
    return GestureDetector(
      onTap: onTap,
      child: SafeArea(
          child: Container(
              height: height * 0.1,
              width: width * 0.1,
              decoration: const BoxDecoration(
                  color: Colors.white,
                  shape: BoxShape.circle,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black12,
                      offset: Offset(0, 5),
                      blurRadius: 8,
                    )
                  ]),
              child: RiveAnimation.asset(
                "assets/RiveAssets/menu_button.riv",
                onInit: riveOnInit,
              ))),
    );
  }
}
