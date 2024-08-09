import 'dart:io';

import 'package:application1/animation/animation.dart';
import 'package:application1/components/text_style.dart';
import 'package:application1/pages/details_page.dart';
import 'package:flutter/material.dart';
import '../data/product.dart';

class MyCardBox extends StatefulWidget {
  final Product product;
  const MyCardBox({
    super.key,
    required this.product,
  });

  @override
  State<MyCardBox> createState() => _MyCardBoxState();
}

class _MyCardBoxState extends State<MyCardBox> {
  @override
  Widget build(BuildContext context) {
  bool isFile = File(widget.product.image).existsSync();
    return GestureDetector(
      onTap: () async {
        //-----------------------------------------------
        String confirmation = await Navigator.push(context, MyAnimation.createRoute(DetailsPage(selectedProduct: widget.product)));
        if (confirmation == "delete") {
          
            products.remove(widget.product);
            Navigator.pushNamed(context,"/home_page");   //refresh the page after deleting the product
        }
        //Navigator.pushNamed(context, "/details_page", arguments: product);
        //-----------------------------------------------
      },
      child: Card(
        child: Container(
          alignment: Alignment.center,
          width: 364,
          height: 280,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16.0),
          ),
          child: Column(
            children: [
              Container(
                width: 366,
                height: 200,
                child: ClipRRect(
                    borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(16.0),
                        topRight: Radius.circular(16.0)),
                    child: isFile ? Image.file(File(widget.product.image)) : Image.asset(widget.product.image, fit: BoxFit.cover)),
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        CustomTextStyle(
                            name: widget.product.name,
                            weight: FontWeight.w500,
                            size: 20.0),
                        CustomTextStyle(
                            name: "\$${widget.product.price}", weight: FontWeight.w500, size: 14),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        CustomTextStyle(
                          name: "Men's shoe",
                          weight: FontWeight.w400,
                          size: 12,
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
                                  name: "(${widget.product.rating})",
                                  weight: FontWeight.w400,
                                  size: 12,
                                  color: Color.fromRGBO(170, 170, 170, 1.0),
                                  family: "Sora"),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
