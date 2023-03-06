import 'package:flutter/material.dart';
import 'package:testproject/import_packages.dart';

class CourseHorizontalListCard extends StatelessWidget {
  const CourseHorizontalListCard({Key? key, required this.courseModel}) : super(key: key);
  final CourseModel courseModel;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        context.go('/course_details',extra: courseModel);
      },
      child: Stack(
        children: [
          Container(
            margin: const EdgeInsets.only(left: 60.0),
            padding: const EdgeInsets.fromLTRB(75.0, 15.0, 15.0, 15.0),
            width: 220.0,
            decoration: BoxDecoration(
              color: lightBackground,
              borderRadius: BorderRadius.circular(25.0),
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
                    color: nearlyBlack
                  ),
                  maxLines: 2,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      '24 lesson',
                      style: TextStyle(
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
                const SizedBox(
                  height: 5.0,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      '\$${courseModel.views}',
                      style: TextStyle(
                          color: mainColor,
                          fontSize: 18.0,
                          fontWeight: FontWeight.bold),
                    ),
                    Container(
                      padding: const EdgeInsets.all(5.0),
                      decoration: BoxDecoration(
                          color: mainColor,
                          borderRadius: BorderRadius.circular(10.0)),
                      child: const Icon(
                        Icons.add,
                        color: white,
                        size: 20.0,
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
          Center(
            child: ClipRRect(
                borderRadius: BorderRadius.circular(20.0),
                child: Image.asset(
                  courseModel.category == 'one'
                      ? 'assets/images/course1.png'
                      : courseModel.category == 'two'
                      ? 'assets/images/course2.png'
                      : 'assets/images/course3.png',
                  height: 120.0,
                  width: 120.0,
                  fit: BoxFit.cover,
                )),
          ),
        ],
      ),
    );
  }
}
