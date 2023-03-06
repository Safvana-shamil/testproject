import 'package:flutter/material.dart';
import '../import_packages.dart';

class CourseViewModel extends ChangeNotifier {
  CourseViewModel() {
    getAllCourses();
  }
  String _selectedCategory = 'one';
  bool _loading = false;
  TextEditingController _searchText = TextEditingController();
  List<CourseModel> _courseList = [];
  List<CourseModel> _filteredCourseList = [];
  final List<CourseModel> _popularCourseList = [];
  Error _courseError = Error(
    code: null,
    errorMessage: null,
  );
  bool get loading => _loading;
  List<CourseModel> get courseList => _courseList;
  List<CourseModel> get filteredCourseList => _filteredCourseList;
  List<CourseModel> get popularCourseList => _popularCourseList;
  Error get courseError => _courseError;
  String get selectedCategory => _selectedCategory;
  TextEditingController get searchText => _searchText;

  setLoading(bool loading) async {
    _loading = loading;
    notifyListeners();
  }

  setCourseList(List<CourseModel> courseList) {
    _courseList = courseList;
    getFilterCourseList();
    getPopularCourseList();
  }

  getFilterCourseList() {
    _filteredCourseList.clear();
    for (var course in _courseList) {
      if (course.category == selectedCategory) {
        if (_searchText.text == '') {
          _filteredCourseList.add(course);
        } else if (_searchText.text != '' &&
            course.title.contains(_searchText.text)) {
          _filteredCourseList.add(course);
        }
      }
    }
    notifyListeners();
  }

  getPopularCourseList() {
    _popularCourseList.clear();
    for (var course in _courseList) {
      if (course.views > 300) {
        if (_searchText.text == '') {
          _popularCourseList.add(course);
        } else if (_searchText.text != '' &&
            course.title.contains(_searchText.text)) {
          _popularCourseList.add(course);
        }
      }
    }
  }

  setCourseError(Error courseError) {
    _courseError = courseError;
  }

  getAllCourses() async {
    setLoading(true);
    var response = await ApiData.getAllCoursesApi();
    if (response is Success) {
      setCourseList(response.response as List<CourseModel>);
    }
    if (response is Error) {
      setCourseError(response);
    }
    setLoading(false);
  }

  changeCategory(String selectedCategory) {
    _selectedCategory = selectedCategory;
    notifyListeners();
  }
}
