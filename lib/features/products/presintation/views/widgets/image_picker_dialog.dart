import 'package:flutter/material.dart';

Future<void> imagePickerDialog({
  required BuildContext context,
  required Function cameraFCT,
  required Function galleryFCT,
  required Function removeFCT,
}) async {
  await showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Center(
            child: Text(
              "Choose option",
            ),
          ),
          content: SingleChildScrollView(
              child: ListBody(
            children: [
              TextButton.icon(
                onPressed: () {
                  cameraFCT();
                  if (Navigator.canPop(context)) {
                    Navigator.pop(context);
                  }
                },
                icon: const Icon(Icons.camera),
                label: const Text(
                  "Camera",
                ),
              ),
              TextButton.icon(
                onPressed: () {
                  galleryFCT();
                  if (Navigator.canPop(context)) {
                    Navigator.pop(context);
                  }
                },
                icon: const Icon(Icons.image),
                label: const Text(
                  "Gallery",
                ),
              ),
              TextButton.icon(
                onPressed: () {
                  removeFCT();
                  if (Navigator.canPop(context)) {
                    Navigator.pop(context);
                  }
                },
                icon: const Icon(Icons.remove),
                label: const Text(
                  "Remove",
                ),
              ),
            ],
          )),
        );
      });
}
