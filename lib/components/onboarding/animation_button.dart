import 'package:flutter/material.dart';
import 'package:rive/rive.dart';

class AnimationButon extends StatelessWidget {
  const AnimationButon({
    super.key,
    required this.btnRiveController,
    required this.height,
    required this.onPressed,
  });

  final RiveAnimationController btnRiveController;
  final double height;
  final void Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: SizedBox(
          height: height * 0.09,
          child: Stack(
            children: [
              RiveAnimation.asset("assets/RiveAssets/button.riv",
                  controllers: [btnRiveController]),
              const Positioned.fill(
                top: 8,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.arrow_right),
                    SizedBox(height: 10),
                    Text(
                      "Commencer le Tuto",
                      style: TextStyle(
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                  ],
                ),
              )
            ],
          )),
    );
  }
}
