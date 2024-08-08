import 'package:application1/components/card_box_style.dart';
import 'package:application1/components/ModalSheetWidget.dart';
import 'package:application1/components/text_style.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class ProductSearchPage extends StatefulWidget {
  const ProductSearchPage({super.key});

  @override
  State<ProductSearchPage> createState() => _ProductSearchPageState();
}

class _ProductSearchPageState extends State<ProductSearchPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.all(32),
        child: SingleChildScrollView(
          child: Column(
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
                  const SizedBox(width: 60),
                  const CustomTextStyle(
                    name: "Search Product",
                    weight: FontWeight.w500,
                    size: 16,
                  ),
                ],
              ),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    const SizedBox(
                      width: 270,
                      height: 48,
                      child: Stack(
                        children: [
                          TextField(
                            decoration: InputDecoration(
                              hintText: "Leather",
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                    color: Color.fromRGBO(217, 217, 217, 1),
                                    width: 1.0),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                    color: Color.fromRGBO(217, 217, 217, 1),
                                    width: 1.0),
                              ),
                            ),
                          ),
                          Positioned(
                              left: 230,
                              child: IconButton(
                                onPressed: null,
                                icon: Icon(
                                  Icons.arrow_forward,
                                  color: Color.fromRGBO(63, 81, 243, 1),
                                ),
                              )),
                        ],
                      ),
                    ),
                    const SizedBox(
                      width: 7,
                    ),
                    GestureDetector(
                      onTap: () {
                        showModalBottomSheet(
                          context: context,
                          builder: (BuildContext context) {
                            return ModalSheetComponent();
                          },
                        );
                      },
                      child: Container(
                        width: 48,
                        height: 48,
                        decoration: BoxDecoration(
                          color: const Color.fromRGBO(63, 81, 243, 1),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: const Icon(
                          Icons.filter_list_rounded,
                          color: Colors.white,
                        ),
                      ),
                    )
                  ],
                ),
              ),
              const SizedBox(
                height: 32,
              ),
              const MyCardBox(),
              const MyCardBox(),
              const MyCardBox(),
              const MyCardBox(),
            ],
          ),
        ),
      ),
    );
  }
}
