import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:rive/rive.dart';
import 'package:rive_animation/components/onboarding/custom_positionned.dart';
import 'package:rive_animation/utilis/const.dart';
import 'package:rive_animation/screens/entry_point.dart';
import 'package:rive_animation/utilis/rive_brain.dart';

class SignInForm extends StatefulWidget {
  const SignInForm({super.key,});

  @override
  State<SignInForm> createState() => _SignInFormState();
}

class _SignInFormState extends State<SignInForm> {
  final formKey = GlobalKey<FormState>();

  late SMITrigger check, error, reset, confetti;

  bool isShowingLoading = false;

  // Function to handle sign-in process
  //Gestion du process de connexion
  void signInBrain() {
    setState(() {
      isShowingLoading = true;
    });

    // Simulating sign-in process with delay
    Future.delayed(kOneSecond, () {
      if (formKey.currentState!.validate()) {
        check.fire(); // Trigger check animation
        Future.delayed(kTwoSecond, () {
          setState(() {
            isShowingLoading = false;
          });
          confetti.fire(); // Trigger confetti explosion animation
          Future.delayed(kOneSecond, () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const EntryPoint(),
              ),
            );
          });
        });
      } else {
        error.fire(); // Trigger error animation
        Future.delayed(kTwoSecond, () {
          setState(() {
            isShowingLoading = false;
          });
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    return Stack(
      children: [
        Form(
          key: formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 5),
              const Text(
                "Email",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 8, bottom: 16),
                child: TextFormField(
                  keyboardType: TextInputType.emailAddress,
                  validator: (value) =>
                      value!.isEmpty ? "Veuillez saisir votre Email" : null,
                  onSaved: (emailValue) {},
                  decoration: InputDecoration(
                    prefixIcon: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: SvgPicture.asset("assets/icons/email.svg"),
                    ),
                  ),
                ),
              ),
              const Text(
                "Password",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 8, bottom: 16),
                child: TextFormField(
                  validator: (value) => value!.isEmpty
                      ? "Veuillez saisir votre mot de passe"
                      : null,
                  onSaved: (passwordValue) {},
                  obscureText: true,
                  decoration: InputDecoration(
                    prefixIcon: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: SvgPicture.asset("assets/icons/password.svg"),
                    ),
                  ),
                ),
              ),
              ElevatedButton.icon(
                onPressed: () {
                  signInBrain(); // Call the sign-in function
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFFF77D8E),
                  minimumSize: Size(double.infinity, height * 0.07),
                ),
                label: Text(
                  "S'incrire",
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: height * 0.02,
                  ),
                ),
                icon: const Icon(
                  Icons.arrow_right,
                  color: Colors.white,
                ),
              ),
            ],
          ),
        ),
        // Loading animation while signing in
        isShowingLoading
            ? CustomPositioned(
                size: 100,
                child: RiveAnimation.asset(
                  "assets/RiveAssets/check.riv",
                  onInit: (artboard) {
                    StateMachineController? controller =
                        RiveBrain.getRiveController(artboard);
                    check = controller!.findSMI("Check") as SMITrigger;
                    error = controller.findSMI("Error") as SMITrigger;
                    reset = controller.findSMI("Reset") as SMITrigger;
                  },
                ),
              )
            : const SizedBox(),
        // Confetti animation for successful sign-in
        CustomPositioned(
          size: 100,
          child: Transform.scale(
            scale: 10,
            child: RiveAnimation.asset(
              "assets/RiveAssets/confetti.riv",
              onInit: (artboard) {
                StateMachineController? controller =
                    RiveBrain.getRiveController(artboard);
                confetti = controller?.findSMI("Trigger explosion");
              },
            ),
          ),
        ),
      ],
    );
  }
}
