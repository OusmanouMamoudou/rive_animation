import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:rive_animation/models/course.dart';

class BottomCourseCard extends StatelessWidget {
  const BottomCourseCard({
    super.key,
    required this.course,
  });

  final Course course;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    double height = size.height;
    double width = size.width;
    return Padding(
      padding: EdgeInsets.symmetric(
        vertical: height * 0.008,
        horizontal: width * 0.02,
      ),
      child: Container(
          decoration: BoxDecoration(
            color: course.bgColor,
            borderRadius: const BorderRadius.all(
              Radius.circular(20),
            ),
          ),
          child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: width * 0.05,
              vertical: height * 0.03,
            ),
            child: Row(
              children: [
                Expanded(
                  child: Column(
                    children: [
                      Text(
                        course.title,
                        style: Theme.of(context).textTheme.titleLarge!.copyWith(
                              fontWeight: FontWeight.w900,
                              color: Colors.white,
                            ),
                      ),
                      const Text(
                        "Regarder une vidéo de 15mins",
                        style: TextStyle(
                          color: Colors.white70,
                        ),
                      )
                    ],
                  ),
                ),
                SizedBox(
                  height: height * 0.06,
                  width: width * 0.1,
                  child: const VerticalDivider(
                    color: Colors.white70,
                  ),
                ),
                SvgPicture.asset(course.iconSrc)
              ],
            ),
          )),
    );
  }
}
