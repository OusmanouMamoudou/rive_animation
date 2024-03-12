import 'dart:math';

import 'package:flutter/material.dart';
import 'package:rive/rive.dart';
import 'package:rive_animation/components/animated_bar.dart'; // Importing custom animated bar
import 'package:rive_animation/components/entry_point/drawer_btn.dart'; // Importing drawer button
import 'package:rive_animation/components/side_menu.dart'; // Importing side menu
import 'package:rive_animation/models/rive_icon.dart'; // Importing RiveIcon model
import 'package:rive_animation/screens/home.dart'; // Importing home screen
import 'package:rive_animation/utilis/const.dart'; // Importing constants
import 'package:rive_animation/utilis/rive_brain.dart'; // Importing RiveBrain utility

class EntryPoint extends StatefulWidget {
  const EntryPoint({super.key});

  @override
  State<EntryPoint> createState() => _EntryPointState();
}

class _EntryPointState extends State<EntryPoint>
    with SingleTickerProviderStateMixin {
  late SMIBool
      search; // Variable for searching functionality //Variable pour acitiver l'animation
  late SMIBool
      isSideBarClosed; // Variable for checking if the sidebar is closed
  bool isSideMenuClosed =
      true; // Variable for checking if the side menu is closed
  RiveIcon selectedBottomNav =
      myBottomNavs.first; // Selected bottom navigation item

  late AnimationController
      animationController; // Animation controller for sidebar animation
  late Animation<double> animation; // Animation for sidebar slide
  late Animation<double> scalAnimation; // Animation for sidebar scale

  @override
  void initState() {
    animationController = AnimationController(
      vsync: this,
      duration: kMilliSecond, // Animation duration
    )..addListener(() {
        setState(() {});
      });

    animation = Tween<double>(begin: 0, end: 1).animate(
      CurvedAnimation(
        parent: animationController,
        curve: Curves.fastOutSlowIn,
      ),
    );

    //Pour animer la taille du Home
    scalAnimation = Tween<double>(begin: 1, end: 0.8).animate(
      CurvedAnimation(
        parent: animationController,
        curve: Curves.fastOutSlowIn,
      ),
    );
    super.initState();
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    double height = size.height;
    double width = size.width;
    return Scaffold(
      resizeToAvoidBottomInset: true,
      extendBody: true,
      backgroundColor: kBackgroundColor2,
      body: Stack(
        children: [
          AnimatedPositioned(
            duration: kMilliSecond,
            curve: Curves.fastOutSlowIn,
            height: height,
            width: width * 0.7,
            left: isSideMenuClosed ? width * 0.5 : 0,
            child: const SideMenu(), // Displaying side menu
          ),
          Transform(
            alignment: Alignment.center,
            transform: Matrix4.identity()
              ..setEntry(3, 2, 0.001)
              ..rotateY(
                animation.value - 30 * animation.value * pi / 180,
              ),
            child: Transform.translate(
              offset: Offset(animation.value * width * 0.62, 0),
              child: Transform.scale(
                scale: scalAnimation.value,
                child: const ClipRRect(
                    borderRadius: BorderRadius.all(
                      Radius.circular(20),
                    ),
                    child: Home()), // Displaying home screen
              ),
            ),
          ),
          AnimatedPositioned(
            duration: kMilliSecond,
            curve: Curves.fastOutSlowIn,
            left: isSideMenuClosed ? 0 : width * 0.52,
            child: DrawerBtn(
              onTap: () {
                isSideBarClosed.value = !isSideBarClosed.value;
                if (isSideMenuClosed) {
                  animationController.forward();
                } else {
                  animationController.reverse();
                }
                setState(() {
                  isSideMenuClosed = isSideBarClosed.value;
                });
              },
              riveOnInit: (artboard) {
                StateMachineController controller = RiveBrain.getRiveController(
                  artboard,
                  stateMachine: "State Machine",
                );

                isSideBarClosed = controller.findSMI("isOpen") as SMIBool;
                isSideBarClosed.value = true;
              },
            ),
          ),
        ],
      ),
      bottomNavigationBar: Transform.translate(
        offset: Offset(0, animation.value * 100),
        child: SafeArea(
            bottom: false,
            child: Container(
              margin: EdgeInsets.symmetric(
                horizontal: width * 0.07,
                vertical: height * 0.01,
              ),
              padding: EdgeInsets.symmetric(horizontal: width * 0.05),
              decoration: BoxDecoration(
                color: kBackgroundColor2.withOpacity(0.8),
                borderRadius: const BorderRadius.all(Radius.circular(25)),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ...List.generate(myBottomNavs.length, (index) {
                    final navs = myBottomNavs[index];
                    return GestureDetector(
                      onTap: () {
                        navs.input.change(true);
                        setState(() {
                          selectedBottomNav = navs;
                        });
                        Future.delayed(kOneSecond, () {
                          navs.input.change(false);
                        });
                      },
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          AnimatedBar(
                            isActive: navs == selectedBottomNav,
                          ),
                          SizedBox(
                            height: height * 0.08,
                            width: width * 0.1,
                            child: Opacity(
                              opacity: navs == selectedBottomNav ? 1 : 0.5,
                              child: RiveAnimation.asset(
                                navs.iconSrc,
                                artboard: navs.artboard,
                                onInit: (artboard) {
                                  StateMachineController controller =
                                      RiveBrain.getRiveController(
                                    artboard,
                                    stateMachine: navs.stateMachine,
                                  );
                                  navs.setInput =
                                      controller.findSMI("active") as SMIBool;
                                },
                              ),
                            ),
                          ),
                        ],
                      ),
                    );
                  }),
                ],
              ),
            )),
      ),
    );
  }
}
