import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:rive_animation/models/course.dart';

class TopCourseCard extends StatelessWidget {
  const TopCourseCard({
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
        horizontal: width * 0.02,
      ),
      child: Container(
          height: height * 0.38,
          width: width * 0.7,
          decoration: BoxDecoration(
            color: course.bgColor,
            borderRadius: const BorderRadius.all(
              Radius.circular(14),
            ),
          ),
          child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: width * 0.05,
              vertical: height * 0.02,
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                    child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      course.title,
                      style: Theme.of(context).textTheme.titleLarge!.copyWith(
                            fontWeight: FontWeight.w900,
                            color: Colors.white,
                            fontSize: height * 0.03,
                          ),
                    ),
                    SizedBox(height: height * 0.02),
                    Text(
                      course.descrption,
                      style: const TextStyle(color: Colors.white70),
                    ),
                    const Text(
                      "11 HOURS",
                      style: TextStyle(
                        color: Colors.white54,
                      ),
                    ),
                    const Spacer(),
                    Row(children: [
                      ...List.generate(3, (index) {
                        String? jpg;
                        if (index == 1) {
                          jpg = 'jpeg';
                        } else {
                          jpg = "jpg";
                        }
                        return Transform.translate(
                          offset: Offset((-10 * index).toDouble(), 0),
                          child: CircleAvatar(
                            backgroundImage: AssetImage(
                                "assets/avaters/Avatar ${index + 1}.$jpg"),
                          ),
                        );
                      })
                    ])
                  ],
                )),
                SvgPicture.asset(course.iconSrc),
              ],
            ),
          )),
    );
  }
}
