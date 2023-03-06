import 'package:flutter/material.dart';
import '../import_packages.dart';

class CategoryWidget extends StatelessWidget {
  const CategoryWidget({Key? key, required this.title}) : super(key: key);
  final String title;
  @override
  Widget build(BuildContext context) {
    CourseViewModel courseViewModel = context.watch<CourseViewModel>();

    return Padding(
      padding: const EdgeInsets.only(right: 20.0),
      child: Container(
        height: 50.0,
        width: 120.0,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30.0),
            color: courseViewModel.selectedCategory == title
                ? mainColor
                : white,
            border: Border.all(
                color: courseViewModel.selectedCategory == title
                    ? white
                    : mainColor!)),
        child: InkWell(
          onTap: (){
            courseViewModel.changeCategory(title);
            courseViewModel.getFilterCourseList();
          },
          child: Center(
            child: Text(
              title == 'one' ? 'Ui/Ux' : title == 'two' ? 'Coding' : 'Basic UI',
              style: TextStyle(
                  color: courseViewModel.selectedCategory == title
                      ? chipBackground
                      : mainColor,
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold),
            ),
          ),
        ),
      ),
    );
  }
}
