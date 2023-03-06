import 'package:flutter/material.dart';
import '../import_packages.dart';

class SearchBoxWidget extends StatelessWidget {
  const SearchBoxWidget({Key? key, required this.searchText,required this.onChanged,}) : super(key: key);
  final TextEditingController searchText;
  final Function(String) onChanged;
  @override
  Widget build(BuildContext context) {

    return ClipRRect(
      borderRadius: BorderRadius.circular(12.0),
      child: TextFormField(
        onChanged: onChanged,
       controller: searchText,
        decoration: InputDecoration(
            hintText: AppLocalizations.of(context)!.search_for_course,
            suffixIcon: const Icon(Icons.search),
            fillColor: lightBackground,
            filled: true,
            border: InputBorder.none,
            hintStyle: const TextStyle(color: lightText)),
      ),
    );
  }
}
