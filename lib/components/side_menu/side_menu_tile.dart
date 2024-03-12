import 'package:flutter/material.dart';
import 'package:rive/rive.dart';
import 'package:rive_animation/models/rive_icon.dart';

class SideMenuTile extends StatelessWidget {
  const SideMenuTile({
    super.key,
    required this.onTap,
    required this.menu,
    required this.riveOnInit,
    required this.isActive,
  });

  final void Function()? onTap;
  final RiveIcon menu;
  final ValueChanged<Artboard> riveOnInit;
  final bool isActive;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    double height = size.height;
    double width = size.width;

    return Column(children: [
      const Divider(
        color: Colors.white24,
        height: 1,
      ),
      Stack(
        children: [
          AnimatedPositioned(
            duration: const Duration(milliseconds: 250),
            height: height * 0.08,
            width: isActive ? 288 : 0,
            child: Container(
              decoration: const BoxDecoration(
                color: Color(0xff6792ff),
                borderRadius: BorderRadius.all(
                  Radius.circular(10),
                ),
              ),
            ),
          ),
          ListTile(
            onTap: onTap,
            leading: SizedBox(
              height: height * 0.05,
              width: width * 0.1,
              child: RiveAnimation.asset(menu.iconSrc,
                  artboard: menu.artboard, onInit: riveOnInit),
            ),
            title: Text(
              menu.title,
              style: const TextStyle(color: Colors.white),
            ),
          ),
        ],
      )
    ]);
  }
}
