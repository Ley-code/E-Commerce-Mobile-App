import 'package:application1/components/text_style.dart';
import 'package:application1/pages/details_page.dart';
import 'package:flutter/material.dart';

class MyCardBox extends StatelessWidget {
  const MyCardBox({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context)
            .push(MaterialPageRoute(builder: (BuildContext context) {
          return DetailsPage();
        }));
      },
      child: Card(
        child: Container(
          alignment: Alignment.center,
          width: 364,
          height: 240,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16.0),
          ),
          child: Column(
            children: [
              Container(
                width: 366,
                height: 160,
                child: ClipRRect(
                    borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(16.0),
                        topRight: Radius.circular(16.0)),
                    child: Image.asset("assets/shoes.jpeg", fit: BoxFit.cover)),
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
                child: Column(
                  children: [
                    const Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        CustomTextStyle(name: "Derby Leather Shoes",weight: FontWeight.w500,size: 20.0),
                        CustomTextStyle(name: "\$120",weight: FontWeight.w500, size: 14),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        CustomTextStyle(name: "Men's shoe",weight: FontWeight.w400,size: 12,color:Color.fromRGBO(170, 170, 170, 1.0),),
                        Container(
                          child: const Row(
                            children: [
                              Icon(
                                Icons.star,
                                color: Color.fromRGBO(255, 215, 0, 1),
                              ),
                              CustomTextStyle(name: "(4.0)",weight: FontWeight.w400,size: 12,color:Color.fromRGBO(170, 170, 170, 1.0),family:"Sora"),
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
