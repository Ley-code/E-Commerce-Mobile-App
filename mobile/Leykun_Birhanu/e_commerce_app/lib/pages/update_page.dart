import 'dart:io';

import 'package:application1/components/button_styles.dart';
import 'package:application1/components/text_style.dart';
import 'package:application1/components/text_field.dart';
import 'package:application1/data/product.dart';
import 'package:application1/pages/home_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class UpdatePage extends StatefulWidget {
  final Product selectedProduct;
  const UpdatePage({
    super.key,
    required this.selectedProduct,
  });

  @override
  State<UpdatePage> createState() => _UpdatePageState();
}

class _UpdatePageState extends State<UpdatePage> {

  File? _selectedImage;
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _categoryController = TextEditingController();
  final TextEditingController _priceController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();
  Future _pickImageFromGallery() async {
    final returnedImage =
        await ImagePicker().pickImage(source: ImageSource.gallery);
    setState(() {
      if (returnedImage != null) {
        _selectedImage = File(returnedImage.path);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: const EdgeInsets.all(32),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: const Icon(
                      Icons.arrow_back_ios_rounded,
                      color: Color.fromRGBO(63, 81, 243, 1),
                    ),
                  ),
                  const SizedBox(width: 80),
                  CustomTextStyle(
                      name: "Update Product",
                      weight: FontWeight.w500,
                      size: 16),
                ],
              ),
              const SizedBox(height: 23),
              GestureDetector(
                onTap: () {
                  _pickImageFromGallery();
                },
                child: Container(
                  width: 366,
                  height: 190,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
                    color: const Color.fromRGBO(243, 243, 243, 1),
                  ),
                  child: _selectedImage == null ? const Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.image_outlined,
                          size: 48,
                        ),
                        const SizedBox(
                          height: 16,
                        ),
                        CustomTextStyle(
                            name: "upload image",
                            weight: FontWeight.w500,
                            size: 14)
                      ],
                    ),
                  ) : Image.file(_selectedImage!),
                ),
              ),
              const SizedBox(height: 16),
              const CustomTextStyle(
                name: "name",
                weight: FontWeight.w500,
                size: 14,
              ),
              const SizedBox(height: 8),
              CustomTextField(
                controller: _nameController,
                hint: widget.selectedProduct.name,
              ),
              const SizedBox(height: 16),
              const CustomTextStyle(
                name: "category",
                weight: FontWeight.w500,
                size: 14,
              ),
              const SizedBox(height: 8),
              CustomTextField(
                controller: _categoryController,
                hint: widget.selectedProduct.type,
              ),
              const SizedBox(height: 16),
              const CustomTextStyle(
                name: "price",
                weight: FontWeight.w500,
                size: 14,
              ),
              const SizedBox(height: 8),
              Stack(
                children: [
                  CustomTextField(
                    hint: widget.selectedProduct.price.toString(),
                    controller: _priceController,
                  ),
                  Positioned(
                    left: 290,
                    top: 16,
                    child: Icon(Icons.attach_money),
                  )
                ],
              ),
              const SizedBox(height: 16),
              const CustomTextStyle(
                name: "description",
                weight: FontWeight.w500,
                size: 14,
              ),
              const SizedBox(height: 8),
              CustomTextField(
                lines: 5,
                controller: _descriptionController,
                hint: widget.selectedProduct.description,
              ),
              const SizedBox(height: 32),
              PrimaryButtonStyle(
                pressed: () {
                  widget.selectedProduct.name = _nameController.text;
                  widget.selectedProduct.type = _categoryController.text;
                  widget.selectedProduct.price = int.parse(_priceController.text);
                  widget.selectedProduct.description = _descriptionController.text;
                  widget.selectedProduct.image = _selectedImage!.path;
                  // Ensure that all required fields are filled
                  Navigator.pushNamed(context, "/home_page");
                },
                name: "UPDATE",
                width: double.infinity,
                height: 50,
                fgcolor: Color.fromRGBO(255, 255, 255, 1),
                bgcolor: Color.fromRGBO(63, 81, 243, 1),
              ),
              const SizedBox(height: 16),
              const PrimaryButtonStyle(
                pressed: null,
                name: "DELETE",
                width: double.infinity,
                height: 50,
                fgcolor: Color.fromARGB(230, 255, 19, 19),
                bgcolor: Color.fromRGBO(255, 255, 255, 1),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
