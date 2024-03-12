import 'package:flutter/material.dart';

class Course {
  final String title, descrption, iconSrc;
  final Color bgColor;

  Course({
    required this.title,
    this.descrption = 'Développer une app Android from crach',
    this.iconSrc = "assets/icons/ios.svg",
    this.bgColor = const Color(0XFF7553F6),
  });
}

List<Course> courses = [
  Course(title: "Animation en Kotlin en UI"),
  Course(
    title: "Animation en Flutter",
    iconSrc: "assets/icons/code.svg",
    bgColor: const Color(0xFF80A4ff),
  )
];

//

List<Course> recentsCourses = [
  Course(title: "State Machine"),
  Course(
    title: "Menu animé",
    bgColor: const Color(0xff9cc5ff),
    iconSrc: "assets/icons/code.svg",
  ),
  Course(title: "Rive avec Flutter"),
  Course(title: "Extras"),
];
