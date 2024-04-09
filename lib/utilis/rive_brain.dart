import 'package:rive/rive.dart';
class RiveBrain {
  static StateMachineController? getRiveController(Artboard artboard,
      {stateMachine = "State Machine 1"}) {
    // Getting the StateMachineController from the provided Artboard
    StateMachineController? controller = StateMachineController.fromArtboard(
      artboard,
      stateMachine,
    );

    // Check if controller is null
    if (controller != null) {
      // Adding the controller to the artboard
      artboard.addController(controller);

      // Returning the controller
      return controller;
    } else {
      // If controller is null, return null
      return null;
    }
  }
}
