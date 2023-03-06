import 'package:testproject/import_packages.dart';
import 'package:flutter/material.dart';

class CourseDetails extends StatelessWidget {
  const CourseDetails({Key? key, required this.courseModel}) : super(key: key);
  final CourseModel courseModel;
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: SafeArea(
        child: CheckNetworkWidget(
          child: Container(
            height: height,
            child: Stack(

              children: [
                Image.asset(
                  courseModel.category == 'one'
                      ? 'assets/images/course1.png'
                      : courseModel.category == 'two'
                          ? 'assets/images/course2.png'
                          : 'assets/images/course3.png',
                  height: height / 2,
                  width: width,
                  fit: BoxFit.cover,
                ),
                Positioned(
                    bottom: 0.0,
                    child: Stack(
                      children: [
                        Container(
                          margin: const EdgeInsets.only(top: 20.0),
                          padding: const EdgeInsets.symmetric(
                              horizontal: 20.0, vertical: 30.0),
                          height: height / 2.0,
                          width: width,
                          decoration: const BoxDecoration(
                              color: white,
                              borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(50.0),
                                  topRight: Radius.circular(50.0))),
                          child: SingleChildScrollView(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                TitleWidget(
                                  title: courseModel.title,
                                  fontSize: 32.0,
                                ),
                                const SizedBox(
                                  height: 20.0,
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      '\$${courseModel.views}',
                                      style: const TextStyle(
                                          color: mainColor,
                                          fontSize: 28.0,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    Row(
                                      children: const [
                                        Text(
                                          '4.3',
                                          style: TextStyle(
                                              color: lightText,
                                              fontSize: 20,
                                              fontWeight: FontWeight.bold),
                                        ),
                                        Icon(
                                          Icons.star_rounded,
                                          color: mainColor,
                                          size: 20.0,
                                        ),
                                      ],
                                    )
                                  ],
                                ),
                                const SizedBox(
                                  height: 20.0,
                                ),
                                Row(
                                  children: const [
                                    CourseScheduleCard(
                                      title: '24',
                                      subTitle: 'Classes',
                                    ),
                                    Padding(
                                      padding:
                                          EdgeInsets.symmetric(horizontal: 15.0),
                                      child: CourseScheduleCard(
                                        title: '2hour',
                                        subTitle: 'Time',
                                      ),
                                    ),
                                    CourseScheduleCard(
                                      title: '24',
                                      subTitle: 'Seats',
                                    ),
                                  ],
                                ),
                                const SizedBox(
                                  height: 20.0,
                                ),
                                const Text(
                                    'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an',
                                    style: TextStyle(
                                        fontSize: 15.0, color: lightText)),
                                const SizedBox(
                                  height: 20.0,
                                ),
                                Row(
                                  children: [
                                    Expanded(
                                        flex: 1,
                                        child: ElevatedButtonWidget(
                                          backGroundColor: white,
                                          padding: 12.0,
                                          borderRadius: 12.0,
                                          borderColor: lightBackground,
                                          onPressed: () {
                                            context.pop();
                                          },
                                          child: const Icon(
                                            Icons.close,
                                            color: lightText,
                                          ),
                                        )),
                                    const SizedBox(
                                      width: 15.0,
                                    ),
                                    Expanded(
                                        flex: 3,
                                        child: ElevatedButtonWidget(
                                          backGroundColor: mainColor!,
                                          padding: 12.0,
                                          borderRadius: 12.0,
                                          borderColor: mainColor!,
                                          onPressed: () {},
                                          child: const Text(
                                            'Join Course',
                                            style: TextStyle(
                                                fontSize: 20.0,
                                                color:white,
                                                fontWeight: FontWeight.bold),
                                          ),
                                        )),
                                  ],
                                )
                              ],
                            ),
                          ),
                        ),
                        const Positioned(right: 30, child: FavouriteIconWidget())
                      ],
                    ))
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class CourseScheduleCard extends StatelessWidget {
  const CourseScheduleCard({
    Key? key,
    required this.title,
    required this.subTitle,
  }) : super(key: key);
  final String title;
  final String subTitle;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.0)),
      child: Container(
        padding: const EdgeInsets.all(12.0),
        decoration: BoxDecoration(
          color:lightBackground,
          borderRadius: BorderRadius.circular(12.0),
        ),
        child: Column(
          children: [
            Text(
              title,
              style: TextStyle(fontSize: 18.0, color: mainColor),
            ),
            Text(
              subTitle,
              style: const TextStyle(fontSize: 15.0, color: lightText),
            ),
          ],
        ),
      ),
    );
  }
}
