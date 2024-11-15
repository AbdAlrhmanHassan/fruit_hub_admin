import 'package:flutter/material.dart';

Future<void> showErrorORWarningDialog({
  required BuildContext context,
  required String subtitle,
  required Function fct,
  bool isError = true,
}) async {
  await showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Icon(
            Icons.warning_amber_sharp,
            color: Colors.red,
            size: 50,
          ),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.0)),
          backgroundColor: Theme.of(context).scaffoldBackgroundColor,
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              // const SizedBox(
              //   height: 16.0,
              // ),
              Text(
                subtitle,
                style:
                    const TextStyle(fontWeight: FontWeight.w600, fontSize: 18),
              ),
              const SizedBox(
                height: 16.0,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Visibility(
                    visible: !isError,
                    child: TextButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: const Text(
                        "إلغاء",
                        style: TextStyle(color: Colors.red, fontSize: 16),
                      ),
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      fct();
                      Navigator.pop(context);
                    },
                    child: const Text(
                      "متابعة",
                      style: TextStyle(color: Colors.green, fontSize: 16),
                    ),
                  ),
                ],
              )
            ],
          ),
        );
      });
}
