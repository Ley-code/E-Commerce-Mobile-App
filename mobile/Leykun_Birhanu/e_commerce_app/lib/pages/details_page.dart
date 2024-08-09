import 'dart:io';

import 'package:application1/components/button_styles.dart';
import 'package:application1/components/text_style.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../components/size_cards.dart';
import '../data/product.dart';

class DetailsPage extends StatefulWidget {
  Product selectedProduct;

  DetailsPage({
    super.key,
    required this.selectedProduct,
  });

  @override
  State<DetailsPage> createState() => _DetailsPageState();
}

class _DetailsPageState extends State<DetailsPage> {
  int size = 41;
  
  @override
  Widget build(BuildContext context) {
  bool isFile = File(widget.selectedProduct.image).existsSync();
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(children: [
              SizedBox(
                width: 430,
                height: 286,
                child: isFile ?Image.file(File(widget.selectedProduct.image)) : Image.asset(
                  widget.selectedProduct.image,
                  fit: BoxFit.cover,
                ),
              ),
              Positioned(
                left: 24,
                top: 25,
                child: IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: const Icon(
                    Icons.arrow_back,
                    color: Color.fromRGBO(63, 81, 243, 1),
                  ),
                  style: IconButton.styleFrom(
                    backgroundColor: Colors.white,
                    shape: const CircleBorder(),
                  ),
                ),
              )
            ]),
            const SizedBox(height: 21),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 32),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CustomTextStyle(
                    name: widget.selectedProduct.type,
                    weight: FontWeight.w400,
                    size: 16,
                    color: Color.fromRGBO(170, 170, 170, 1.0),
                  ),
                  Container(
                    child: Row(
                      children: [
                        Icon(
                          Icons.star,
                          color: Color.fromRGBO(255, 215, 0, 1),
                        ),
                        CustomTextStyle(
                          name: "${widget.selectedProduct.rating}",
                          weight: FontWeight.w400,
                          size: 16,
                          color: Color.fromRGBO(170, 170, 170, 1.0),
                          family: "Sora",
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 16),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 32),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CustomTextStyle(
                    name: widget.selectedProduct.name,
                    weight: FontWeight.w600,
                    size: 24,
                  ),
                  CustomTextStyle(
                    name: "\$${widget.selectedProduct.price}",
                    weight: FontWeight.w500,
                    size: 16,
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            const Padding(
              padding: EdgeInsets.only(left: 32),
              child: CustomTextStyle(
                name: "Size: ",
                weight: FontWeight.w500,
                size: 20,
              ),
            ),
            Container(
              width: 500,
              height: 60,
              child: ListView.builder(
                itemCount: 6,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      setState(() {
                        size = index + 39;
                      });
                    },
                    child:
                        sizeCard(value: size - 39 == index, size: index + 39),
                  );
                },
              ),
            ),
            const SizedBox(height: 32),
            Container(
              padding: const EdgeInsets.only(left: 32),
              width: 366,
              height: 260,
              child: Text(
                widget.selectedProduct.description,
                style: TextStyle(
                  fontFamily: "Poppins",
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            const SizedBox(height: 61),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Container(
                padding: const EdgeInsets.fromLTRB(32, 0, 32, 32),
                child: Expanded(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      PrimaryButtonStyle(
                        pressed: () {
                          Navigator.of(context).pop("delete");
                        },
                        name: "DELETE",
                        width: 152,
                        height: 50,
                        fgcolor: Color.fromARGB(230, 255, 19, 19),
                        bgcolor: Colors.white,
                      ),
                      SizedBox(
                        width: 16,
                      ),
                      PrimaryButtonStyle(
                        pressed: () {
                          Navigator.pushNamed(context, "/update_page",
                              arguments: widget.selectedProduct);
                        },
                        name: "UPDATE",
                        width: 152,
                        height: 50,
                        fgcolor: Colors.white,
                        bgcolor: Color.fromRGBO(63, 81, 243, 1),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
