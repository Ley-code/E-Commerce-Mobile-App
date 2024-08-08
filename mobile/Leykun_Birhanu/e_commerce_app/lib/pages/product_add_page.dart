import 'package:application1/components/button_styles.dart';
import 'package:application1/components/text_style.dart';
import 'package:application1/components/text_field.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AddProudctPage extends StatelessWidget {
  const AddProudctPage({super.key});

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
                  CustomTextStyle(name: "Add Product", weight: FontWeight.w500, size: 16),
                ],
              ),
              const SizedBox(height: 23),
              Container(
                width: 366,
                height: 190,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16),
                  color: const Color.fromRGBO(243, 243, 243, 1),
                ),
                child: const Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.image_outlined,size: 48,),
                      const SizedBox(height: 16,),
                      CustomTextStyle(name: "upload image", weight: FontWeight.w500, size: 14)
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 16),
              
              const CustomTextStyle(name: "name",weight: FontWeight.w500,size: 14,),
              const SizedBox(height: 8),
              const CustomTextField(),
              const SizedBox(height: 16),
              
              const CustomTextStyle(name: "category",weight: FontWeight.w500,size: 14,),
              const SizedBox(height: 8),
              const CustomTextField(),
              const SizedBox(height: 16),
              
              const CustomTextStyle(name: "price",weight: FontWeight.w500,size: 14,),
              const SizedBox(height: 8),
              const Stack(
                children: [
                  CustomTextField(),
                  Positioned(
                    left: 290,
                    top: 16,
                    child: Icon(Icons.attach_money),
                  )
                ],
              ),
              const SizedBox(height: 16),
              const CustomTextStyle(name: "description",weight: FontWeight.w500,size: 14,),
              const SizedBox(height: 8),
              const CustomTextField(lines: 5),
              const SizedBox(height: 32),
              const PrimaryButtonStyle(name: "ADD",
                width: double.infinity,
                height: 50,
                fgcolor: Color.fromRGBO(255, 255, 255, 1),
                bgcolor: Color.fromRGBO(63, 81, 243, 1),
              ),
              const SizedBox(height: 16),
              const PrimaryButtonStyle(name: "DELETE",
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
