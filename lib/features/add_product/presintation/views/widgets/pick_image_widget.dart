import 'dart:io';

import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:fruit_hub_admin/core/style/app_colors.dart';
import 'package:image_picker/image_picker.dart';

import '../../../../../core/widgets/screen_size.dart';

class PickImageWidget extends StatelessWidget {
  const PickImageWidget(
      {super.key,
      this.pickedImage,
      required this.function,
      required this.imageIsSelected});
  final XFile? pickedImage;
  final Function function;
  final bool? imageIsSelected;
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SizedBox(
          width: getScreenWidth(context) * .4,
          height: getScreenHight(context) * .2,
          child: pickedImage == null
              ? Padding(
                  padding: const EdgeInsets.all(6.0),
                  child: InkWell(
                    borderRadius: BorderRadius.circular(12),
                    onTap: () {
                      function();
                    },
                    child: DottedBorder(
                        color:
                            imageIsSelected == true || imageIsSelected == null
                                ? StyleColors.primaryColor
                                : Colors.red,
                        borderType: BorderType.RRect,
                        radius: const Radius.circular(12),
                        strokeWidth: 2,
                        child: const Center(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.image_outlined,
                                size: 80,
                                color: Colors.grey,
                              ),
                              SizedBox(height: 7),
                              Text(
                                "اختر صورة المنتج",
                                style: TextStyle(color: Colors.grey),
                              ),
                            ],
                          ),
                        )),
                  ),
                )
              : Image.file(
                  File(
                    pickedImage!.path,
                  ),
                ),
        ),
        Positioned(
          top: 0,
          right: 0,
          child: Material(
            borderRadius: BorderRadius.circular(16.0),
            color: imageIsSelected == true || imageIsSelected == null
                ? StyleColors.primaryColor
                : Colors.red,
            child: InkWell(
              splashColor: Colors.red,
              borderRadius: BorderRadius.circular(16.0),
              onTap: () {
                function();
              },
              child: const Padding(
                padding: EdgeInsets.all(8.0),
                child: Icon(
                  Icons.add_shopping_cart_rounded,
                  size: 20,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
