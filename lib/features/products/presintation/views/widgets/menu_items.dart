import 'package:flutter/material.dart';

List<String> categoriesList = [
  "رجالي",
  "ولادي",
  "ستاتي",
  'بناتي',
  'آخر',
];

List<DropdownMenuItem<String>>? get categoriesDropDownList {
  List<DropdownMenuItem<String>>? menuItems =
      List<DropdownMenuItem<String>>.generate(
    categoriesList.length,
    (index) => DropdownMenuItem(
      value: categoriesList[index],
      child: Text(
        categoriesList[index],
      ),
    ),
  );
  return menuItems;
}