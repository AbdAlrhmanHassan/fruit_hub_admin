import 'package:flutter/material.dart';

InputBorder? customInputBorder({Color? activeColor}) {
  return OutlineInputBorder(
      borderSide: BorderSide(
        color: activeColor ?? const Color(0xFF000000),
        width: activeColor != null ? 2 : 1,
      ),
      borderRadius: const BorderRadius.all(
        Radius.circular(10),
      ));
}
