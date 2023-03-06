import 'package:testproject/import_packages.dart';
import 'package:flutter/material.dart';

class PopularCourseListCard extends StatelessWidget {
  const PopularCourseListCard({Key? key, required this.courseModel}) : super(key: key);
  final CourseModel courseModel;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        context.go('/course_details',extra: courseModel);
      },
      child: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          Container(
            padding: const EdgeInsets.all(15.0),
            margin: const EdgeInsets.only(bottom: 50.0),
            decoration: BoxDecoration(
              color: lightBackground,
              borderRadius: BorderRadius.circular(20.0),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  courseModel.title,
                  style: const TextStyle(
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,
                    overflow: TextOverflow.ellipsis,
                  ),
                  maxLines: 2,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      '${courseModel.views} lesson',
                      style: const TextStyle(
                          color: lightText, fontSize: 17.0),
                    ),
                    Row(
                      children: [
                        const Text(
                          '4.3',
                          style: TextStyle(color: lightText),
                        ),
                        Icon(
                          Icons.star_rounded,
                          color: mainColor,
                          size: 15.0,
                        ),
                      ],
                    )
                  ],
                ),

              ],
            ),
          ),
          ClipRRect(
              borderRadius: BorderRadius.circular(20.0),
              child: Image.asset(
                courseModel.category == 'one'
                    ? 'assets/images/course1.png'
                    : courseModel.category == 'two'
                    ? 'assets/images/course2.png'
                    : 'assets/images/course3.png',
                height: 100.0,
                width: 120.0,
                fit: BoxFit.cover,
              )),
        ],
      ),
    );
  }
}
