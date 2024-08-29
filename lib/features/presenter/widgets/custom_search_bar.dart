import 'package:flutter/material.dart';

class CustomSearchBar extends StatefulWidget {
  @override
  _CustomSearchBarState createState() => _CustomSearchBarState();
}

class _CustomSearchBarState extends State<CustomSearchBar> {
  String _searchText = '';

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 1.0),
      decoration: BoxDecoration(
        color: Colors.transparent,
        border: Border(
          bottom: BorderSide(color: Colors.grey.shade400, width: 1.0),
        ),
      ),
      child: Row(
        children: [
          Icon(Icons.search, color: Colors.grey.shade400),
          SizedBox(width: 8.0),
          Expanded(
            child: TextField(
              onChanged: (text) {
                setState(() {
                  _searchText = text;
                });
              },
              style: TextStyle(color: Colors.black),
              decoration: InputDecoration(
                hintText: 'Pesquisar',
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
