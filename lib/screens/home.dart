import 'package:flutter/material.dart';
import 'package:rive_animation/components/home/bottom_course_card.dart';
import 'package:rive_animation/components/home/top_course_card.dart';
import 'package:rive_animation/models/course.dart'; // Importing course model

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    double height = size.height;
    double width = size.width;
    return Scaffold(
      body: SafeArea(
        bottom: false,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: height * 0.06), // Vertical spacing
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: width * 0.04,
                  vertical: height * 0.01,
                ),
                child: Text("Cours",
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.w700,
                      fontSize: height * 0.04,
                    )),
              ),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    // Displaying top course cards horizontally
                    //Les Prémiers Cards
                    ...courses.map((course) => TopCourseCard(course: course))
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: width * 0.04,
                  vertical: height * 0.01,
                ),
                child: Text(
                  "Recent",
                  style: Theme.of(context)
                      .textTheme
                      .headlineSmall!
                      .copyWith(fontWeight: FontWeight.w700),
                ),
              ),
              // Displaying bottom course cards vertically

              ...recentsCourses.map(
                  (recentCourse) => BottomCourseCard(course: recentCourse)),
              SizedBox(height: height * 0.098) // Bottom padding
            ],
          ),
        ),
      ),
    );
  }
}
