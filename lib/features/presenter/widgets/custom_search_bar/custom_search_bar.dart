import 'package:flutter/material.dart';

import '../../../../design_system/strings/app_strings_portuguese.dart';

class CustomSearchBar extends StatelessWidget {
  final Function(String) onTextChanged;

  const CustomSearchBar({super.key, required this.onTextChanged});

  //String _searchText = '';
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 1.0),
      decoration: BoxDecoration(
        color: Colors.transparent,
        border: Border(
          bottom: BorderSide(color: Colors.grey.shade400, width: 1.0),
        ),
      ),
      child: Row(
        children: [
          Icon(Icons.search, color: Colors.grey.shade400),
          const SizedBox(width: 8.0),
          Expanded(
            child: TextField(
              onChanged: (text) {
                onTextChanged(text);
              },
              style: const TextStyle(color: Colors.black),
              decoration: InputDecoration(
                hintText: AppStringsPortuguese.searchBarHint,
                hintStyle: TextStyle(color: Colors.grey.shade400),
                border: InputBorder.none,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
