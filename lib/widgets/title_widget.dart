import 'package:flutter/material.dart';

import '../import_packages.dart';

class TitleWidget extends StatelessWidget {
  const TitleWidget({Key? key, required this.title, required this.fontSize})
      : super(key: key);
  final String title;
  final double fontSize;
  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: TextStyle(
          fontSize: fontSize, fontWeight: FontWeight.bold, color: nearlyBlack),
    );
  }
}
