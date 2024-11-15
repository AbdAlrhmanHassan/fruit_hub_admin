import 'package:flutter/material.dart';

class CustomButtonForAuth extends StatelessWidget {
  const CustomButtonForAuth({
    super.key,
    required this.child,
    required this.onPressedF,
  });
  final Widget child;
  final void Function() onPressedF;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        style: ButtonStyle(
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16.0),
            ),
          ),
          backgroundColor: MaterialStateProperty.all(const Color(0xff1B5E37)),
          fixedSize:
              MaterialStateProperty.all(const Size(double.maxFinite, 54)),
        ),
        onPressed: onPressedF,
        child: child);
  }
}
