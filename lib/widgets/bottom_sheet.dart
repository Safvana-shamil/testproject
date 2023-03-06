import 'package:flutter/material.dart';

import '../import_packages.dart';

Future<void> viewBottomSheet(context,Widget child) async {
  await Future<void>.delayed(
    const Duration(milliseconds: 10),
        () => showModalBottomSheet<void>(
      context: context,
      builder: (_) {
        return child;
      },
    ),
  );
}
