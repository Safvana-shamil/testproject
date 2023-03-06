import 'package:testproject/import_packages.dart';
import 'package:flutter/material.dart';

class LanguageCardWidget extends StatelessWidget {
  const LanguageCardWidget({Key? key, required this.language, required this.locale}) : super(key: key);
  final String language;
  final Locale locale;

  @override
  Widget build(BuildContext context) {
    LanguageViewModel languageViewModel = context.watch<LanguageViewModel>();

    return   Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.0)),
        child: ListTile(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.0)),
          onTap: (){
            print(languageViewModel.currentLocale);
            languageViewModel.changeLocale(locale);
          },
          title: Text(
            language,
            style: TextStyle(
              color: languageViewModel.currentLocale ==
                  locale
                  ? white
                  : mainColor,
            ),
          ),
          tileColor: languageViewModel.currentLocale ==
              locale
              ? mainColor
              : white,
        ));
  }
}
