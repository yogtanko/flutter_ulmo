import 'package:flutter/material.dart';
import 'package:flutter_ulmo/config/constants.dart';

Widget searchBar() {
  return Container(
    margin: const EdgeInsets.symmetric(horizontal: 16),
    padding: const EdgeInsets.symmetric(horizontal: 16),
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(8),
      color: giratina[100],
    ),
    child: TextField(
      cursorColor: giratina[500],
      decoration: InputDecoration(
        border: InputBorder.none,
        hintStyle: TextStyle(color: giratina[500]),
        hintText: "Search",
        icon: Icon(
          Icons.search,
          color: giratina[500],
        ),
      ),
    ),
  );
}
