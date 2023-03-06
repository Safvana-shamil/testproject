import 'package:flutter/material.dart';

import '../import_packages.dart';

class FavouriteIconWidget extends StatelessWidget {
  const FavouriteIconWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(15.0),
      decoration: const BoxDecoration(
          shape: BoxShape.circle, color: mainColor),
      child: const Icon(
        Icons.favorite_rounded,
        color: white,
      ),
    );
  }
}
