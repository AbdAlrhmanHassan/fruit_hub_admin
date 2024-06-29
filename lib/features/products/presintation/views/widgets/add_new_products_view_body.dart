import 'package:image_picker/image_picker.dart';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../../../../core/widgets/screen_size.dart';
import '../../../../../core/widgets/validator.dart';
import 'image_picker_dialog.dart';
import 'menu_items.dart';
import 'pick_image_widget.dart';

class AddNewProductsViewBody extends StatefulWidget {
  const AddNewProductsViewBody({super.key});
  static const routeName = "AddNewProductsView";

  @override
  State<AddNewProductsViewBody> createState() => _AddNewProductsViewBodyState();
}

class _AddNewProductsViewBodyState extends State<AddNewProductsViewBody> {
  String? categoryValue;
  final _formKey = GlobalKey<FormState>();

  XFile? imgFile;
  String? productImageUrl;

  TextEditingController titleController = TextEditingController();
  TextEditingController priceController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  TextEditingController quantityController = TextEditingController();

  @override
  void dispose() {
    titleController.dispose();
    priceController.dispose();
    descriptionController.dispose();
    quantityController.dispose();
    super.dispose();
  }

  void clearForm() {
    titleController.clear();
    priceController.clear();
    descriptionController.clear();
    quantityController.clear();
  }

  Future<void> localImagePicker() async {
    final ImagePicker picker = ImagePicker();
    await imagePickerDialog(
      context: context,
      cameraFCT: () async {
        imgFile = await picker.pickImage(
            source: ImageSource.camera, imageQuality: 70);
        setState(() {});
      },
      galleryFCT: () async {
        imgFile = await picker.pickImage(
            source: ImageSource.gallery, imageQuality: 70);
        setState(() {});
      },
      removeFCT: () {
        setState(() {
          imgFile = null;
        });
      },
    );
  }

  bool? categoryIsSelected;
  bool? imageIsSelected;
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Scaffold(
          body: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(
                  height: getScreenHight(context) * .06,
                ),
                SizedBox(
                    width: getScreenWidth(context) * .4 ,
                    height: getScreenHight(context) * .2,
                    child: Center(
                      child: PickImageWidget(
                          imageIsSelected: imageIsSelected,
                          pickedImage: imgFile,
                          function: () async {
                            await localImagePicker();
                          }),
                    )),
                const SizedBox(height: 5),
                DropdownButton<String>(
                  items: categoriesDropDownList,
                  value: categoryValue,
                  hint: Text(
                    "اختر الفئة",
                    style: TextStyle(
                        color: categoryIsSelected == null ||
                                categoryIsSelected == true
                            ? Colors.black
                            : Colors.red),
                  ),
                  onChanged: (String? value) {
                    setState(() {
                      categoryValue = value;
                    });
                  },
                ),
                const SizedBox(height: 5),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 0),
                  child: Form(
                    key: _formKey,
                    child: Column(
                      children: [
                        TextFormField(
                          onChanged: (value) {
                            _formKey.currentState!.validate();
                          },
                          controller: titleController,
                          key: const ValueKey('Title'),
                          maxLength: 80,
                          minLines: 1,
                          maxLines: 1,
                          keyboardType: TextInputType.multiline,
                          textInputAction: TextInputAction.next,
                          decoration: const InputDecoration(
                            hintText: 'عنوان المنتج',
                          ),
                          validator: (value) {
                            return MyValidators.uploadProdTexts(
                              value: value,
                              toBeReturnedString: "يرجى إدخال عنوان صالح",
                            );
                          },
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Row(
                          children: [
                            Flexible(
                              flex: 1,
                              child: TextFormField(
                                onChanged: (value) {
                                  _formKey.currentState!.validate();
                                },
                                textInputAction: TextInputAction.next,
                                controller: priceController,
                                key: const ValueKey('Price \$'),
                                keyboardType: TextInputType.number,
                                inputFormatters: <TextInputFormatter>[
                                  FilteringTextInputFormatter.allow(
                                    RegExp(r'^(\d+)?\.?\d{0,2}'),
                                  ),
                                ],
                                decoration: const InputDecoration(
                                  hintText: 'السعر',
                                  suffixIcon: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
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
                                  return MyValidators.uploadProdTexts(
                                    value: value,
                                    toBeReturnedString: "السعر مفقود",
                                  );
                                },
                              ),
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            Flexible(
                              flex: 1,
                              child: TextFormField(
                                onChanged: (value) {
                                  _formKey.currentState!.validate();
                                },
                                textInputAction: TextInputAction.next,
                                inputFormatters: [
                                  FilteringTextInputFormatter.digitsOnly
                                ],
                                controller: quantityController,
                                keyboardType: TextInputType.number,
                                key: const ValueKey('Quantity'),
                                decoration: const InputDecoration(
                                  hintText: "الكمية",
                                ),
                                validator: (value) {
                                  return MyValidators.uploadProdTexts(
                                    value: value,
                                    toBeReturnedString: "الكمية مفقودة",
                                  );
                                },
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 15),
                        TextFormField(
                          onChanged: (value) {
                            _formKey.currentState!.validate();
                          },
                          textInputAction: TextInputAction.done,
                          key: const ValueKey('Description'),
                          controller: descriptionController,
                          minLines: 5,
                          maxLines: 8,
                          maxLength: 1000,
                          textCapitalization: TextCapitalization.sentences,
                          decoration: const InputDecoration(
                            hintText: 'وصف المنتج',
                          ),
                          validator: (value) {
                            return MyValidators.uploadProdTexts(
                              value: value,
                              toBeReturnedString: "الوصف مفقود",
                            );
                          },
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          bottomSheet: Material(
            color: Theme.of(context).scaffoldBackgroundColor,
            child: true
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
                            setState(() {
                              imgFile = null;
                              categoryValue = null;
                            });
                            titleController.clear();
                            priceController.clear();
                            quantityController.clear();
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
                            categoryIsSelected = categoryValue != null;
                            imageIsSelected = false;
                            setState(() {});
                            if (isValid &&
                                imgFile != null &&
                                categoryValue != null) {}
                          },
                        ),
                      ],
                    ),
                  )
                : null,
          ),
        ),
        // if (state == AddNewProductLoading())
        if (false)
          Scaffold(
            backgroundColor: Colors.black.withOpacity(0.5),
            bottomNavigationBar: LinearProgressIndicator(
              minHeight: 10,
              backgroundColor: Colors.grey[350],
              color: Colors.red[50],
              valueColor: const AlwaysStoppedAnimation<Color>(Colors.green),
            ),
          ),
      ],
    );
  }
}
