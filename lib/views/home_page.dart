
import 'package:flutter/material.dart';
import '../import_packages.dart';
import '../widgets/bottom_sheet.dart';
import '../widgets/language_card_widget.dart';

class HomePage extends StatelessWidget {
  HomePage({Key? key}) : super(key: key);
  var scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    CourseViewModel courseViewModel = context.watch<CourseViewModel>();

    return Scaffold(
      key: scaffoldKey,
      endDrawer: Drawer(
        child: ListView(
          // Important: Remove any padding from the ListView.
          padding: EdgeInsets.zero,
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(),
              child: CircleAvatar(
                backgroundImage: AssetImage(
                  'assets/images/userImage.png',
                ),
              ),
            ),
            ListTile(
              leading: const Icon(
                Icons.language,
              ),
              title: Text(
                AppLocalizations.of(context)!.language,
                style: const TextStyle(fontSize: 20.0),
              ),
              onTap: () {
                showDataAlert(context);
              },
            ),
          ],
        ),
      ),
      drawerEnableOpenDragGesture: false,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 15.0, vertical: 30.0),
            child: CheckNetworkWidget(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            AppLocalizations.of(context)!.choose_your,
                            style: const TextStyle(
                                color: lightText,
                                fontSize: 20.0,
                                fontWeight: FontWeight.bold),
                          ),
                          Text(
                            AppLocalizations.of(context)!.design_course,
                            style: const TextStyle(
                                fontSize: 26.0,
                                fontWeight: FontWeight.bold,
                                color: nearlyBlack),
                          ),
                        ],
                      ),
                      InkWell(
                        onTap: () {
                          scaffoldKey.currentState!.openEndDrawer();
                        },
                        child: Image.asset(
                          'assets/images/userImage.png',
                          height: 50.0,
                        ),
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 30.0,
                  ),
                  SearchBoxWidget(
                    searchText: courseViewModel.searchText,
                    onChanged: (value) {
                      courseViewModel.getFilterCourseList();
                      courseViewModel.getPopularCourseList();
                    },
                  ),
                  const SizedBox(
                    height: 30.0,
                  ),
                  TitleWidget(
                    title: AppLocalizations.of(context)!.category,
                    fontSize: 26.0,
                  ),
                  const SizedBox(
                    height: 15.0,
                  ),
                  SizedBox(
                    height: 45.0,
                    child: ListView(
                      scrollDirection: Axis.horizontal,
                      children: const [
                        CategoryWidget(
                          title: 'one',
                        ),
                        CategoryWidget(
                          title: 'two',
                        ),
                        CategoryWidget(
                          title: 'three',
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 40.0,
                  ),
                  courseHorizontalList(courseViewModel, context),
                  const SizedBox(
                    height: 40.0,
                  ),
                  TitleWidget(
                    title: AppLocalizations.of(context)!.popular_course,
                    fontSize: 26.0,
                  ),
                  const SizedBox(
                    height: 15.0,
                  ),
                  popularCourseList(courseViewModel, context)
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  courseHorizontalList(CourseViewModel courseViewModel, BuildContext context) {
    if (courseViewModel.loading) {
      print('loading');

      return AppLoading();
    }
    if (courseViewModel.courseError.code != null) {
      viewBottomSheet(
          context,
          ApiError(
            errortxt: courseViewModel.courseError.errorMessage!,
          ));
      return Center(
        child: Text(
          courseViewModel.courseError.errorMessage!,
          style: const TextStyle(
              fontWeight: FontWeight.bold, fontSize: 20.0, color: red),
        ),
      );
    }
    return SizedBox(
      height: 160.0,
      child: courseViewModel.filteredCourseList.isEmpty
          ? Center(
              child: Text(
                AppLocalizations.of(context)!.no_items_found,
                style: const TextStyle(
                    fontSize: 20.0, fontWeight: FontWeight.bold),
              ),
            )
          : ListView.separated(
              scrollDirection: Axis.horizontal,
              shrinkWrap: true,
              itemBuilder: (context, index) {
                CourseModel courseModel =
                    courseViewModel.filteredCourseList[index];
                return CourseHorizontalListCard(
                  courseModel: courseModel,
                );
              },
              itemCount: courseViewModel.filteredCourseList.length,
              separatorBuilder: (BuildContext context, int index) {
                return const SizedBox(
                  width: 15.0,
                );
              },
            ),
    );
  }

  popularCourseList(CourseViewModel courseViewModel, BuildContext context) {
    if (courseViewModel.loading) {
      print('loading');

      return AppLoading();
    }
    if (courseViewModel.courseError.code != null) {
      return Center(
        child: Text(
          courseViewModel.courseError.errorMessage!,
          style: const TextStyle(
              fontWeight: FontWeight.bold, fontSize: 20.0, color: red),
        ),
      );
    }
    return courseViewModel.popularCourseList.isEmpty
        ? Center(
            child: Text(
              AppLocalizations.of(context)!.no_items_found,
              style:
                  const TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
            ),
          )
        : GridView.builder(
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            padding: const EdgeInsets.all(10.0),
            itemCount: courseViewModel.popularCourseList.length,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              mainAxisSpacing: 20.0,
              crossAxisSpacing: 20.0,
            ),
            itemBuilder: (context, index) {
              CourseModel courseModel =
                  courseViewModel.popularCourseList[index];
              return PopularCourseListCard(
                courseModel: courseModel,
              );
            });
  }

  showDataAlert(
    BuildContext context,
  ) {
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(
                  20.0,
                ),
              ),
            ),
            contentPadding: const EdgeInsets.only(
              top: 10.0,
            ),
            content: Container(
              height: 150,
              child: SingleChildScrollView(
                padding: const EdgeInsets.all(8.0),
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: const <Widget>[
                      LanguageCardWidget(
                        language: 'English',
                        locale: Locale('en', 'EN'),
                      ),
                      LanguageCardWidget(
                          language: 'عربي', locale: Locale('ar', 'AR')),
                    ],
                  ),
                ),
              ),
            ),
          );
        });
  }
}
