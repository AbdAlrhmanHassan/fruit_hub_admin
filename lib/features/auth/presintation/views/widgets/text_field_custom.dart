import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField(
      {super.key,
      required this.hintText,
      this.onChangedF,
      this.suffixIcon,
      this.hideText = false,
      this.keyboardType,
      this.validatorF,
      this.controller,
      this.textInputAction});
  final String hintText;
  final void Function(String)? onChangedF;
  final Widget? suffixIcon;
  final bool hideText;
  final TextInputType? keyboardType;
  final String? Function(String?)? validatorF;
  final TextEditingController? controller;
  final TextInputAction? textInputAction;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      textDirection: TextDirection.ltr,
      textInputAction: textInputAction,
      controller: controller,
      validator: validatorF,
      keyboardType: keyboardType,
      obscureText: hideText,
      onChanged: onChangedF,
      decoration: InputDecoration(
          hintTextDirection: TextDirection.ltr,
          hintStyle: const TextStyle(
            color: Color(0xFF949D9E),
            fontSize: 13,
            fontWeight: FontWeight.w700,
          ),
          filled: true,
          fillColor: const Color(0xffF9FAFA),
          hintText: hintText,
          enabledBorder: const OutlineInputBorder(
            borderSide:
                BorderSide(color: Colors.grey), // Grey color when not focused
            borderRadius: BorderRadius.all(Radius.circular(8)),
          ),
          focusedBorder: const OutlineInputBorder(
            borderSide:
                BorderSide(color: Colors.grey), // Grey color when focused
            borderRadius: BorderRadius.all(Radius.circular(8)),
          ),
          disabledBorder: const OutlineInputBorder(
            borderSide:
                BorderSide(color: Colors.grey), // Grey color when disabled
            borderRadius: BorderRadius.all(Radius.circular(8)),
          ),
          errorBorder: OutlineInputBorder(
            borderSide: BorderSide(
                color: Colors.red[800]!), // Grey color when error is present
            borderRadius: const BorderRadius.all(Radius.circular(8)),
          ),
          focusedErrorBorder: OutlineInputBorder(
            borderSide: BorderSide(
                color: Colors
                    .red[200]!), // Grey color when focused and error is present
            borderRadius: const BorderRadius.all(Radius.circular(8)),
          ),
          suffixIcon: suffixIcon),
    );
  }
}
