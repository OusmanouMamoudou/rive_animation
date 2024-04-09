import 'package:flutter/material.dart';
import 'package:rive/rive.dart';
import 'package:rive_animation/components/side_menu/info_card.dart';
import 'package:rive_animation/components/side_menu/side_menu_tile.dart';
import 'package:rive_animation/models/rive_icon.dart';
import 'package:rive_animation/utilis/const.dart';
import 'package:rive_animation/utilis/rive_brain.dart';

class SideMenu extends StatefulWidget {
  const SideMenu({super.key});

  @override
  State<SideMenu> createState() => _SideMenuState();
}

class _SideMenuState extends State<SideMenu> {
  // Selected top and bottom menu icons
  RiveIcon selectedTopMenu = topSideMenus.first;
  RiveIcon selectedBottomMenu = bottomSideMenus.first;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    double height = size.height;
    double width = size.width;

    // Text style for menu items
    var textStyle = Theme.of(context).textTheme.titleSmall!.copyWith(
          color: Colors.white70,
        );

    return Scaffold(
      body: Container(
        height: double.infinity,
        width: width * 0.7,
        color: const Color(0xff17203A), // Side menu background color
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Info card with user name and profession
              const InfoCard(name: 'Ousmanou', profession: 'Flutter Dev'),

              // Browse section
              Padding(
                padding: EdgeInsets.only(
                  top: height * 0.04,
                  bottom: height * 0.01,
                ),
                child: Text("BROWSE", style: textStyle), // Text: Browse
              ),
              // List of top side menu tiles
              ...topSideMenus.map(
                (menu) => SideMenuTile(
                  menu: menu,
                  onTap: () {
                    changeInput(menu);
                    setState(() {
                      selectedTopMenu = menu;
                    });
                  },
                  riveOnInit: (artboard) {
                    riveOnInit(artboard, menu);
                  },
                  isActive: selectedTopMenu == menu,
                ),
              ),

              // History section
              Padding(
                padding: EdgeInsets.only(
                  top: height * 0.04,
                  bottom: height * 0.01,
                ),
                child: Text("HISTORY", style: textStyle), // Text: History
              ),
              // List of bottom side menu tiles
              ...bottomSideMenus.map((menu) => SideMenuTile(
                    onTap: () {
                      changeInput(menu);
                      setState(() {
                        selectedBottomMenu = menu;
                      });
                    },
                    menu: menu,
                    riveOnInit: (artboard) {
                      riveOnInit(artboard, menu);
                    },
                    isActive: selectedBottomMenu == menu,
                  )),
            ],
          ),
        ),
      ),
    );
  }

  // Function to change input of Rive icon
  void changeInput(RiveIcon menu) {
    menu.input.change(true);
    Future.delayed(kOneSecond, () {
      menu.input.change(false);
    });
  }

  // Function to initialize Rive animation
  void riveOnInit(Artboard artboard, RiveIcon menu) {
  // Retrieve the StateMachineController from the artboard
  StateMachineController? controller = RiveBrain.getRiveController(
    artboard,
    stateMachine: menu.stateMachine,
  );

  // Check if the controller is not null before accessing its properties/methods
  if (controller != null) {
    // Find the SMIBool with the name "active" in the controller
    SMIBool? input = controller.findSMI("active") as SMIBool?;

    // Check if the SMIBool input is not null
    if (input != null) {
      // Set the input property of the menu
      menu.setInput = input;
    } else {
      // Handle the case when the SMIBool with the name "active" is not found
      print("Error: SMIBool 'active' not found in the controller.");
    }
  } else {
    // Handle the case when the controller is null
    print("Error: Failed to retrieve StateMachineController.");
  }
}

}
