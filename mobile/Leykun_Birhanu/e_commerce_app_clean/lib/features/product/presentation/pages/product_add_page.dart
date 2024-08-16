import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';

import '../../domain/entities/product_entity.dart';
import '../bloc/product_bloc.dart';
import '../widgets/components/button_styles.dart';
import '../widgets/components/text_field.dart';
import '../widgets/components/text_style.dart';

class AddProudctPage extends StatefulWidget {
  const AddProudctPage({
    super.key,
  });

  @override
  State<AddProudctPage> createState() => _AddProudctPageState();
}

class _AddProudctPageState extends State<AddProudctPage> {
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
      body: BlocConsumer<ProductBloc, ProductState>(
        listener: (context, state) {
          if (state is ProductCreatedState) {
            Navigator.pushNamed(context, '/home_page');
          } else if (state is ProductErrorState) {
            ScaffoldMessenger.of(context)
                .showSnackBar(SnackBar(content: Text(state.message)));
          }
        },
        builder: (BuildContext context, ProductState state) {
          if (state is ProductLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else {
            return Container(
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
                        const CustomTextStyle(
                            name: 'Add Product',
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
                        child: _selectedImage == null
                            ? const Center(
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Icon(
                                      Icons.image_outlined,
                                      size: 48,
                                    ),
                                    SizedBox(
                                      height: 16,
                                    ),
                                    CustomTextStyle(
                                        name: 'upload image',
                                        weight: FontWeight.w500,
                                        size: 14)
                                  ],
                                ),
                              )
                            : Image.file(_selectedImage!),
                      ),
                    ),
                    const SizedBox(height: 16),
                    const CustomTextStyle(
                      name: 'name',
                      weight: FontWeight.w500,
                      size: 14,
                    ),
                    const SizedBox(height: 8),
                    CustomTextField(controller: _nameController),
                    const SizedBox(height: 16),
                    const CustomTextStyle(
                      name: 'category',
                      weight: FontWeight.w500,
                      size: 14,
                    ),
                    const SizedBox(height: 8),
                    CustomTextField(
                      controller: _categoryController,
                    ),
                    const SizedBox(height: 16),
                    const CustomTextStyle(
                      name: 'price',
                      weight: FontWeight.w500,
                      size: 14,
                    ),
                    const SizedBox(height: 8),
                    Stack(
                      children: [
                        CustomTextField(
                          controller: _priceController,
                        ),
                        const Positioned(
                          left: 290,
                          top: 16,
                          child: Icon(Icons.attach_money),
                        )
                      ],
                    ),
                    const SizedBox(height: 16),
                    const CustomTextStyle(
                      name: 'description',
                      weight: FontWeight.w500,
                      size: 14,
                    ),
                    const SizedBox(height: 8),
                    CustomTextField(
                        lines: 5, controller: _descriptionController),
                    const SizedBox(height: 32),
                    PrimaryButtonStyle(
                      pressed: () {
                        // Ensure that all required fields are filled
                        ProductEntity newProduct = ProductEntity(
                          id: '',
                          name: _nameController.text,
                          imageUrl: _selectedImage!.path,
                          description: _descriptionController.text,
                          price: double.parse(_priceController.text),
                        );
                        context
                            .read<ProductBloc>()
                            .add(CreateProductEvent(newProduct));
                      },
                      name: 'ADD',
                      width: double.infinity,
                      height: 50,
                      fgcolor: const Color.fromRGBO(255, 255, 255, 1),
                      bgcolor: const Color.fromRGBO(63, 81, 243, 1),
                    ),
                    const SizedBox(height: 16),
                    const PrimaryButtonStyle(
                      pressed: null,
                      name: 'DELETE',
                      width: double.infinity,
                      height: 50,
                      fgcolor: Color.fromARGB(230, 255, 19, 19),
                      bgcolor: Color.fromRGBO(255, 255, 255, 1),
                    ),
                  ],
                ),
              ),
            );
          }
        },
      ),
    );
  }
}
