import 'package:flutter/material.dart';

class SearchTextField extends StatelessWidget {
  const SearchTextField(
      {super.key,
      required this.textEditingController,
      required this.onChangedF});
  final TextEditingController textEditingController;
  final Function(String) onChangedF;
  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 2,
      shadowColor: Colors.grey.withOpacity(0.5),
      child: TextField(
        autofocus: false,
        controller: textEditingController,
        onTap: () {
          // Add your search logic here
        },
        onChanged: onChangedF,
        decoration: InputDecoration(
          border: InputBorder.none,
          prefixIcon: Icon(
            Icons.search,
            color: Colors.green[900],
          ),
          hintText: 'ابحث عن.......',
          suffixIcon: IconButton(
            icon: const Icon(
              Icons.category,
              color: Color(0xff949D9E),
            ),
            onPressed: () {
              // sortByPriceBottomSheet(context);
            },
          ),
        ),
      ),
    );
  }
}
