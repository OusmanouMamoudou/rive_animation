import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:rive/rive.dart';
import 'package:rive_animation/components/onboarding/animation_button.dart'; // Importing custom animation button
import 'package:rive_animation/components/onboarding/general_dialog.dart'; // Importing general dialog
import 'package:rive_animation/utilis/const.dart'; // Importing constants

class Onboarding extends StatefulWidget {
  const Onboarding({
    super.key,
  });

  @override
  State<Onboarding> createState() => _OnboardingState();
}

class _OnboardingState extends State<Onboarding> {
  late RiveAnimationController btnRiveController;
  bool begin = true, isGeneralDialogShow = false;

  @override
  void initState() {
    // Initializing Rive animation controller
    //Initialisation du controller Rive
    btnRiveController = OneShotAnimation(
      "active",
      autoplay: false,
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    double height = size.height;
    double width = size.width;
    return Scaffold(
        body: Stack(
      children: [
        // Positioned background image
        //Image d'arrière plan
        Positioned(
            height: height * 0.5,
            top: height * 0.3,
            left: width * 0.3,
            child: Image.asset("assets/Backgrounds/Spline.png")),
        // Backdrop filter for blur effect

        Positioned.fill(
          child: BackdropFilter(
            filter: ImageFilter.blur(
              sigmaX: 20,
              sigmaY: 10,
            ),
          ),
        ),
        // Rive animation
        const RiveAnimation.asset("assets/RiveAssets/shapes.riv"),
        // Another backdrop filter for blur effect
        Positioned.fill(
          child: BackdropFilter(
              filter: ImageFilter.blur(
                sigmaX: 20,
                sigmaY: 10,
              ),
              child: const SizedBox()),
        ),
        // Animated positioned widget for general dialog
        AnimatedPositioned(
          top: isGeneralDialogShow ? -50 : 0,
          duration: kMilliSecond,
          height: height,
          width: width,
          child: SafeArea(
              child: Padding(
            padding: EdgeInsets.symmetric(horizontal: width * 0.1),
            child: Column(
              children: [
                const Spacer(),
                // Title text
                Text(
                  "Apprendre le Design et le Code",
                  style: TextStyle(
                    fontSize: height * 0.05,
                    fontFamily: "poppins",
                    height: 1.2,
                  ),
                ),
                const SizedBox(height: 10),
                // Description text
                const Text(
                    "Il faut pas négliger le Design, apprenez à faire le "
                    "design et le code en créer des applications avec Flutter..."),
                const Spacer(flex: 2),
                // Custom animation button
                AnimationButon(
                  btnRiveController: btnRiveController,
                  height: height,
                  onPressed: () {
                    // Activating Rive animation button
                    //Activation du button d'animation Rive
                    btnRiveController.isActive = true;

                    // Delaying dialog display

                    Future.delayed(const Duration(milliseconds: 810), () {
                      setState(() {
                        isGeneralDialogShow = true;
                      });
                      // Displaying general dialog
                      generalDialog(context, width, height, begin,
                          onClosed: (_) {
                        setState(() {
                          isGeneralDialogShow = false;
                        });
                      });
                    });
                  },
                ),
                const SizedBox(height: 20),
                // Footer text
                const Column(
                  children: [
                    Text(
                        "Des Tutos Exceptionnels Bientôt sur ma chaîne Youtube:"),
                    Text("Ousmanou",
                        style: TextStyle(fontWeight: FontWeight.bold)),
                    SizedBox(height: 20),
                  ],
                ),
              ],
            ),
          )),
        )
      ],
    ));
  }
}
