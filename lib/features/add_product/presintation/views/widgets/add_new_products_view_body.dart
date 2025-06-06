import 'dart:io';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruit_hub_admin/core/helper_function/validation_function.dart';
import 'package:fruit_hub_admin/core/style/app_colors.dart';
import 'package:fruit_hub_admin/features/add_product/domain/entities/product_entity.dart';
import 'package:image_picker/image_picker.dart';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../../../../core/style/border.dart';
import '../../../../../core/widgets/screen_size.dart';
import '../../../../../core/widgets/show_error_or_warning_dialog.dart';
import '../../../admin/add_new_product_cubit/add_new_product_cubit.dart';
import 'image_picker_dialog.dart';
import 'pick_image_widget.dart';

class AddNewProductsViewBody extends StatefulWidget {
  const AddNewProductsViewBody({super.key});
  static const routeName = "AddNewProductsView";

  @override
  State<AddNewProductsViewBody> createState() => _AddNewProductsViewBodyState();
}

class _AddNewProductsViewBodyState extends State<AddNewProductsViewBody> {
  final _formKey = GlobalKey<FormState>();
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;
  XFile? imgFile;
  String? productImageUrl;

  TextEditingController titleController = TextEditingController();
  TextEditingController codeController = TextEditingController();

  TextEditingController priceController = TextEditingController();
  TextEditingController expirationMonthsController = TextEditingController();
  TextEditingController caloriesController = TextEditingController();
  TextEditingController calorieAmountController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  TextEditingController discountAmountController = TextEditingController();
  @override
  void dispose() {
    titleController.dispose();
    priceController.dispose();
    descriptionController.dispose();
    codeController.dispose();
    expirationMonthsController.dispose();
    caloriesController.dispose();
    calorieAmountController.dispose();
    discountAmountController.dispose();
    super.dispose();
  }

  void clearForm() {
    titleController.clear();
    priceController.clear();
    descriptionController.clear();
    codeController.clear();
  }

  Future<void> localImagePicker() async {
    final ImagePicker picker = ImagePicker();
    await imagePickerDialog(
      context: context,
      cameraFCT: () async {
        imgFile = await picker.pickImage(
            source: ImageSource.camera, imageQuality: 50);
        setState(() {});
      },
      galleryFCT: () async {
        imgFile = await picker.pickImage(
            source: ImageSource.gallery, imageQuality: 50);
        setState(() {});
      },
      removeFCT: () {
        setState(() {
          imgFile = null;
        });
      },
    );
  }

  bool? imageIsSelected;
  bool isFeatured = false;
  bool isOrganic = false;
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AddNewProductCubit, AddNewProductState>(
        builder: (context, state) {
      return Stack(
        children: [
          Scaffold(
            appBar: AppBar(
              title: const Text('اضافة منتج جديد'),
            ),
            body: SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(
                    height: getScreenHight(context) * .06,
                  ),
                  SizedBox(
                      width: getScreenWidth(context) * .4,
                      height: getScreenHight(context) * .2,
                      child: Center(
                        child: PickImageWidget(
                            imageIsSelected: imageIsSelected,
                            pickedImage: imgFile,
                            function: () async {
                              await localImagePicker();
                              imageIsSelected = imgFile == null ? false : true;
                              setState(() {});
                            }),
                      )),
                  const SizedBox(height: 5),
                  Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 16, vertical: 0),
                    child: Form(
                      autovalidateMode: autovalidateMode,
                      key: _formKey,
                      child: Column(
                        children: [
                          TextFormField(
                            controller: titleController,
                            key: const ValueKey('Title'),
                            minLines: 1,
                            maxLines: 1,
                            keyboardType: TextInputType.multiline,
                            textInputAction: TextInputAction.next,
                            decoration: InputDecoration(
                              hintText: 'عنوان المنتج',
                              border: customInputBorder(),
                              enabledBorder: customInputBorder(),
                              focusedBorder: customInputBorder(
                                  activeColor: StyleColors.primaryColor),
                            ),
                            validator: (value) {
                              return validateField(value, 'عنوان المنتج');
                            },
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          TextFormField(
                            textInputAction: TextInputAction.next,
                            controller: codeController,
                            key: const ValueKey('Code'),
                            keyboardType: TextInputType.text,
                            decoration: InputDecoration(
                              border: customInputBorder(),
                              enabledBorder: customInputBorder(),
                              focusedBorder: customInputBorder(
                                  activeColor: StyleColors.primaryColor),
                              hintText: 'الكود',
                            ),
                            validator: (value) {
                              return validateField(value, 'الكود');
                            },
                          ),
                          const SizedBox(height: 10),
                          Row(
                            children: [
                              Flexible(
                                flex: 1,
                                child: TextFormField(
                                  textInputAction: TextInputAction.next,
                                  controller: priceController,
                                  key: const ValueKey('Price \$'),
                                  keyboardType: TextInputType.number,
                                  inputFormatters: <TextInputFormatter>[
                                    FilteringTextInputFormatter.allow(
                                      RegExp(r'^(\d+)?\.?\d{0,2}'),
                                    ),
                                  ],
                                  decoration: InputDecoration(
                                    border: customInputBorder(),
                                    enabledBorder: customInputBorder(),
                                    focusedBorder: customInputBorder(
                                        activeColor: StyleColors.primaryColor),
                                    hintText: 'السعر',
                                    suffixIcon: const Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Text(
                                          'JOD',
                                          style: TextStyle(
                                              color: Colors.grey,
                                              fontWeight: FontWeight.w600),
                                        ),
                                      ],
                                    ),
                                  ),
                                  validator: (value) {
                                    return validateField(value, 'السعر');
                                  },
                                ),
                              ),
                              const SizedBox(width: 8),
                              Expanded(
                                flex: 1,
                                child: TextFormField(
                                  textInputAction: TextInputAction.next,
                                  controller: discountAmountController,
                                  key: const ValueKey('Discount Amount'),
                                  keyboardType: TextInputType.number,
                                  decoration: InputDecoration(
                                    border: customInputBorder(),
                                    enabledBorder: customInputBorder(),
                                    focusedBorder: customInputBorder(
                                        activeColor: StyleColors.primaryColor),
                                    hintText: 'مقدار الخصم',
                                    suffixIcon: const Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Text(
                                          'JOD',
                                          style: TextStyle(
                                              color: Colors.grey,
                                              fontWeight: FontWeight.w600),
                                        ),
                                      ],
                                    ),
                                  ),
                                  validator: (value) {
                                    return validateField(value, 'مقدار الخصم');
                                  },
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 10),
                          Row(
                            children: [
                              Expanded(
                                child: TextFormField(
                                  textInputAction: TextInputAction.next,
                                  controller: expirationMonthsController,
                                  key: const ValueKey('expirationMonths'),
                                  keyboardType: TextInputType.number,
                                  decoration: InputDecoration(
                                    border: customInputBorder(),
                                    enabledBorder: customInputBorder(),
                                    focusedBorder: customInputBorder(
                                        activeColor: StyleColors.primaryColor),
                                    hintText: 'أشهر الصلاحية',
                                  ),
                                  validator: (value) {
                                    return validateField(
                                        value, 'أشهر الصلاحية');
                                  },
                                ),
                              ),
                              const SizedBox(width: 8),
                              const Spacer(),
                            ],
                          ),
                          const SizedBox(height: 10),
                          Row(
                            children: [
                              Flexible(
                                flex: 1,
                                child: TextFormField(
                                  textInputAction: TextInputAction.next,
                                  controller: caloriesController,
                                  key: const ValueKey('calorie'),
                                  keyboardType: TextInputType.number,
                                  decoration: InputDecoration(
                                    border: customInputBorder(),
                                    enabledBorder: customInputBorder(),
                                    focusedBorder: customInputBorder(
                                        activeColor: StyleColors.primaryColor),
                                    hintText: 'كالوري',
                                  ),
                                  validator: (value) {
                                    return validateField(value, 'كالوري');
                                  },
                                ),
                              ),
                              const SizedBox(width: 8),
                              Expanded(
                                flex: 1,
                                child: TextFormField(
                                  textInputAction: TextInputAction.next,
                                  controller: calorieAmountController,
                                  key: const ValueKey('calorie amouont'),
                                  keyboardType: TextInputType.number,
                                  decoration: InputDecoration(
                                    border: customInputBorder(),
                                    enabledBorder: customInputBorder(),
                                    focusedBorder: customInputBorder(
                                        activeColor: StyleColors.primaryColor),
                                    hintText: 'الكالوري لكل ',
                                    suffixIcon: const Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Text(
                                          'غرام',
                                          style: TextStyle(
                                              color: Colors.grey,
                                              fontWeight: FontWeight.w600),
                                        ),
                                      ],
                                    ),
                                  ),
                                  validator: (value) {
                                    return validateField(
                                        value, 'نسبة الكالوري');
                                  },
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 10),
                          Row(
                            children: [
                              Checkbox(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(4),
                                ),
                                value: isFeatured,
                                onChanged: (value) {
                                  setState(() {
                                    isFeatured = value!;
                                  });
                                },
                                activeColor: const Color(0xff1B5E37),
                              ),
                              const Text(
                                'عنصر مميز',
                              ),
                              const SizedBox(width: 50),
                              Checkbox(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(4),
                                ),
                                value: isOrganic,
                                onChanged: (value) {
                                  setState(() {
                                    isOrganic = value!;
                                  });
                                },
                                activeColor: const Color(0xff1B5E37),
                              ),
                              const Text(
                                'عضوي',
                              )
                            ],
                          ),
                          const SizedBox(height: 10),
                          TextFormField(
                            textInputAction: TextInputAction.done,
                            key: const ValueKey('Description'),
                            controller: descriptionController,
                            minLines: 5,
                            maxLines: 8,
                            maxLength: 200,
                            textCapitalization: TextCapitalization.sentences,
                            decoration: InputDecoration(
                              hintText: 'وصف المنتج',
                              border: customInputBorder(),
                              enabledBorder: customInputBorder(),
                              focusedBorder: customInputBorder(
                                  activeColor: StyleColors.primaryColor),
                            ),
                            validator: (value) {
                              return validateField(value, "وصف المنتج");
                            },
                          ),
                          const SizedBox(
                            height: kBottomNavigationBarHeight + 30,
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            bottomSheet: Material(
              color: Theme.of(context).scaffoldBackgroundColor,
              child: state != AddNewProductLoading()
                  ? SizedBox(
                      height: kBottomNavigationBarHeight + 30,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          ElevatedButton.icon(
                            style: ElevatedButton.styleFrom(
                              padding: const EdgeInsets.all(12),
                              backgroundColor: Colors.red,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(
                                  10,
                                ),
                              ),
                            ),
                            icon: const Icon(
                              Icons.clear,
                              color: Colors.white,
                            ),
                            label: const Text(
                              "مسح",
                              style: TextStyle(
                                  fontSize: 20,
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold),
                            ),
                            onPressed: () {
                              autovalidateMode = AutovalidateMode.disabled;
                              _formKey.currentState!.reset();
                              setState(() {
                                imgFile = null;
                              });
                              imageIsSelected = true;
                              titleController.clear();
                              priceController.clear();
                              codeController.clear();
                              descriptionController.clear();
                            },
                          ),
                          ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              padding: const EdgeInsets.all(12),
                              backgroundColor: Colors.grey,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(
                                  10,
                                ),
                              ),
                            ),
                            child: const Row(
                              children: [
                                Icon(Icons.upload, color: Colors.white),
                                SizedBox(
                                  width: 5,
                                ),
                                Text(
                                  "تحميل المنتج",
                                  style: TextStyle(
                                      fontSize: 20,
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold),
                                ),
                              ],
                            ),
                            onPressed: () async {
                              final isValid = _formKey.currentState!.validate();
                              autovalidateMode = AutovalidateMode.always;
                              imageIsSelected = imgFile != null ? true : false;
                              setState(() {});

                              if (isValid && imgFile != null) {
                                _formKey.currentState!.save();
                                File? fileImage = File(imgFile!.path);

                                ProductEntity addProductInputEntity =
                                    ProductEntity(
                                        name: titleController.text,
                                        price: priceController.text,
                                        code: codeController.text,
                                        description: descriptionController.text,
                                        imageFile: fileImage,
                                        isFeatured: isFeatured,
                                        isOrganic: isOrganic,
                                        expirationMonths: int
                                            .parse(expirationMonthsController
                                                .text),
                                        numberOfCalories: int
                                            .parse(caloriesController.text),
                                        unitAmount:
                                            int.parse(calorieAmountController
                                                .text),
                                        reviews: [],
                                        discountAmount: discountAmountController
                                                .text.isEmpty
                                            ? 0
                                            : double.parse(
                                                discountAmountController.text));
                                await context
                                    .read<AddNewProductCubit>()
                                    .addNewProduct(
                                        addProductInputEntity:
                                            addProductInputEntity);
                                if (mounted) {
                                  showErrorORWarningDialog(
                                      context: context,
                                      subtitle: "مسح النموذج",
                                      fct: () {
                                        imgFile = null;
                                        titleController.clear();
                                        priceController.clear();
                                        codeController.clear();
                                        descriptionController.clear();
                                      },
                                      isError: false);
                                }
                              }
                            },
                          ),
                        ],
                      ),
                    )
                  : null,
            ),
          ),
          if (state == AddNewProductLoading())
            Scaffold(
              backgroundColor: Colors.black.withOpacity(0.5),
              bottomNavigationBar: LinearProgressIndicator(
                minHeight: 10,
                backgroundColor: Colors.grey[350],
                color: Colors.red[50],
                valueColor: const AlwaysStoppedAnimation<Color>(
                    StyleColors.primaryColor),
              ),
            ),
        ],
      );
    });
  }
}
