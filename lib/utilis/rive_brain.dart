import 'package:rive/rive.dart';

class RiveBrain {
  // This method retrieves the Rive animation controller from an Artboard.
  // Cette méthode récupère le contrôleur d'animation Rive à partir d'un Artboard.
  static StateMachineController getRiveController(Artboard artboard,
      {stateMachine = "State Machine 1"}) {
    // Getting the StateMachineController from the provided Artboard
    // Récupération du StateMachineController de l'Artboard fourni
    StateMachineController? controller = StateMachineController.fromArtboard(
      artboard,
      stateMachine,
    );

    // Adding the controller to the artboard
    // Ajout du contrôleur à l'artboard
    artboard.addController(controller!);

    // Returning the controller
    // Renvoi du contrôleur
    return controller;
  }
}
