import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:rive_animation/components/onboarding/sign_in_form.dart';
import 'package:rive_animation/utilis/const.dart';

// Function to display a general dialog with transition animation
Future<Object?> generalDialog(
  BuildContext context,
  double width,
  double height,
  bool begin, {
  required ValueChanged onClosed,
}) {
  return showGeneralDialog(
    // Define the transition duration for the dialog
    transitionDuration: const Duration(milliseconds: 800),
    // Define the custom transition animation for the dialog
    transitionBuilder: (context, animation, secondaryAnimation, child) {
      Tween<Offset> tween;
      tween = Tween(
        begin: begin ? const Offset(-1, -2) : const Offset(1, 2),
        end: const Offset(0, 0),
      );
      // Delay to change the begin value after the animation duration
      Future.delayed(const Duration(milliseconds: 800), () {
        begin = false;
      });
      // Slide transition with the defined tween
      return SlideTransition(
        position: tween.animate(
          CurvedAnimation(
            parent: animation,
            curve: Curves.easeInOut,
          ),
        ),
        child: child,
      );
    },
    // Build the dialog content
    context: context,
    pageBuilder: (context, _, __) => Center(
      child: Container(
        height: height * 0.72,
        // Styling for the dialog container
        decoration: BoxDecoration(
          color: Colors.white.withOpacity(0.9),
          borderRadius: kDefaultRadius,
        ),
        margin: EdgeInsets.symmetric(horizontal: width * 0.05),
        padding: const EdgeInsets.all(10),
        child: Scaffold(
          resizeToAvoidBottomInset: false,
          backgroundColor: Colors.transparent,
          body: Stack(
            clipBehavior: Clip.none,
            children: [
              // Close button for the dialog
              Positioned(
                right: 0,
                left: 0,
                bottom: -height * 0.03,
                child: GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: const CircleAvatar(
                    backgroundColor: Colors.white,
                    child: Icon(Icons.close),
                  ),
                ),
              ),
              // Dialog content
              Column(
                children: [
                  // Dialog title
                  Text(
                    "Connectez Vous",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontFamily: "Poppins",
                      fontSize: height * 0.04,
                    ),
                  ),
                  // Dialog description
                  const Text(
                    "Accédez à plus de 100 cours, Apprenez le design et le code"
                    "avec créeans des applications avec Flutter...",
                    textAlign: TextAlign.center,
                  ),
                  // Sign in form
                  const SignInForm(),
                  // Divider and "OR" text
                  const Padding(
                    padding: EdgeInsets.symmetric(vertical: 10),
                    child: Row(
                      children: [
                        Expanded(
                          child: Divider(),
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 10),
                          child: Text("OU"),
                        ),
                        Expanded(
                          child: Divider(),
                        ),
                      ],
                    ),
                  ),
                  // Text for sign up options
                  const Padding(
                    padding: EdgeInsets.symmetric(vertical: 10),
                    child: Text(
                      "Inscrivez vous avec l'Email ou Google",
                      textAlign: TextAlign.center,
                    ),
                  ),
                  // Sign up options icons
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      IconButton(
                        onPressed: () {},
                        icon: SvgPicture.asset(
                          "assets/icons/email_box.svg",
                        ),
                      ),
                      IconButton(
                        onPressed: () {},
                        icon: SvgPicture.asset("assets/icons/google_box.svg"),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    ),
  ).then(onClosed);
}
