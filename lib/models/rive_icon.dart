import 'package:rive/rive.dart';

class RiveIcon {
  String iconSrc, artboard, stateMachine, title;
  late SMIBool input;

  set setInput(SMIBool status) {
    input = status;
  }

  RiveIcon({
    this.iconSrc = "assets/RiveAssets/icons.riv",
    required this.artboard,
    required this.stateMachine,
    required this.title,
  });
}

List<RiveIcon> myBottomNavs = [
  RiveIcon(
    artboard: 'CHAT',
    stateMachine: "CHAT_Interactivity",
    title: "Chat",
  ),
  RiveIcon(
    artboard: 'SEARCH',
    stateMachine: "SEARCH_Interactivity",
    title: "Search",
  ),
  RiveIcon(
    artboard: 'TIMER',
    stateMachine: "TIMER_Interactivity",
    title: "Timer",
  ),
  RiveIcon(
    artboard: 'BELL',
    stateMachine: "BELL_Interactivity",
    title: "Notification",
  ),
  RiveIcon(
    artboard: 'USER',
    stateMachine: "USER_Interactivity",
    title: "Profil",
  ),
];

List<RiveIcon> topSideMenus = [
  RiveIcon(
    artboard: "HOME",
    stateMachine: "HOME_Interactivity",
    title: "Acceuil",
  ),
  RiveIcon(
    artboard: 'SEARCH',
    stateMachine: "SEARCH_Interactivity",
    title: "Recherche",
  ),
  RiveIcon(
    artboard: 'LIKE/STAR',
    stateMachine: "STAR_Interactivity",
    title: "Favories",
  ),
  RiveIcon(
    artboard: 'CHAT',
    stateMachine: "CHAT_Interactivity",
    title: "Aide",
  ),
];

List<RiveIcon> bottomSideMenus = [
  RiveIcon(
    artboard: 'TIMER',
    stateMachine: "TIMER_Interactivity",
    title: "Historique",
  ),
  RiveIcon(
    artboard: 'BELL',
    stateMachine: "BELL_Interactivity",
    title: "Notification",
  ),
];
