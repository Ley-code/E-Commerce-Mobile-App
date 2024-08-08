import 'package:application1/components/button_styles.dart';
import 'package:application1/components/text_style.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class sizeCard extends StatelessWidget {
  final bool value;
  final int size;
  const sizeCard({super.key, required this.value, required this.size});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        width: 60,
        height: 60,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: value ? const Color.fromRGBO(63, 81, 243, 1) : null,
        ),
        child: Center(
          child: Text(
            "${size}",
            style: TextStyle(
              fontFamily: "Poppins",
              fontWeight: FontWeight.w500,
              fontSize: 20,
              color: value ? Colors.white : null,
            ),
          ),
        ),
      ),
    );
  }
}

class DetailsPage extends StatefulWidget {
  const DetailsPage({super.key});

  @override
  State<DetailsPage> createState() => _DetailsPageState();
}

class _DetailsPageState extends State<DetailsPage> {
  int size = 41;
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AspectRatio(
              aspectRatio: 430 / 286,
              child: Stack(children: [
                Image.asset('assets/shoes.jpeg'),
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
            ),
            const SizedBox(height: 21),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 32),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CustomTextStyle(name: "Men's shoe",weight: FontWeight.w400,size: 16,color:Color.fromRGBO(170, 170, 170, 1.0),),
                  Container(
                    child: const Row(
                      children: [
                        Icon(
                          Icons.star,
                          color: Color.fromRGBO(255, 215, 0, 1),
                        ),
                        CustomTextStyle(name: "(4.0)",weight: FontWeight.w400,size: 16,color:Color.fromRGBO(170, 170, 170, 1.0),family: "Sora",),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 16),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 32),
              child: const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CustomTextStyle(name: "Derby Leather",weight: FontWeight.w600,size: 24,),
                  CustomTextStyle(name: "\$120",weight: FontWeight.w500,size: 16,),
                ],
              ),
            ),
            const SizedBox(height: 20),
            const Padding(
              padding: EdgeInsets.only(left: 32),
              child: 
              CustomTextStyle(name: "Size: ",weight: FontWeight.w500,size: 20,),
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
                        size = index+39;
                      });
                    },
                    child: sizeCard(value: size-39 == index , size: index+39),
                  );
                },
              ),
            ),
            const SizedBox(height: 32),
            Container(
              padding: const EdgeInsets.only(left: 32),
              width: 366,
              height: 260,
              child: const Text(
                "A derby leather shoe is a classic and versatile footwear option characterized by its open lacing system, where the shoelace eyelets are sewn on top of the vamp (the upper part of the shoe). This design feature provides a more relaxed and casual look compared to the closed lacing system of oxford shoes. Derby shoes are typically made of high-quality leather, known for its durability and elegance, making them suitable for both formal and casual occasions. With their timeless style and comfortable fit, derby leather shoes are a staple in any well-rounded wardrobe.",
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
                child: const Expanded(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      PrimaryButtonStyle(name: "DELETE",
                        width: 152,
                        height: 50,
                        fgcolor: Color.fromARGB(230, 255, 19, 19),
                        bgcolor: Color.fromRGBO(255, 255, 255, 1),
                      ),
                      SizedBox(width: 16,),
                      PrimaryButtonStyle(name: "UPDATE",
                        width: 152,
                        height: 50,
                        fgcolor: Color.fromRGBO(255, 255, 255, 1),
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
