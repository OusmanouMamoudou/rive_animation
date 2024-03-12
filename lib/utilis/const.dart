import 'package:flutter/material.dart';

// Default input border style
const kDefaultInputBorder = OutlineInputBorder(
  borderRadius: kDefaultRadius,
  borderSide: BorderSide(
    color: kScaffoldColor,
    width: 1,
  ),
);

// Default border radius for input fields
const kDefaultRadius = BorderRadius.all(Radius.circular(25));

// Scaffold color constant
const kScaffoldColor = Color(0xFFDEE3F2);

// Background color constant
const kBackgroundColor2 = Color(0xFF17203A);

// Duration constants
const kOneSecond = Duration(seconds: 1); // 1 second duration
const kTwoSecond = Duration(seconds: 2); // 2 seconds duration
const kMilliSecond = Duration(milliseconds: 300); // 300 milliseconds duration
