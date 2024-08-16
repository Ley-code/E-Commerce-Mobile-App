import 'package:flutter/material.dart';

import '../functions/animation.dart';
import '../../pages/product_search_page.dart';
import 'text_style.dart';


class HeaderView extends StatelessWidget {
  const HeaderView({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      SizedBox(
        width: 364,
        height: 50,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    width: 50,
                    height: 50,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(11),
                      color: const Color.fromRGBO(204, 204, 204, 0.8),
                    ),
                  ),
                  const SizedBox(width: 10),
                  const Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CustomTextStyle(
                        name: 'July 14,2023',
                        weight: FontWeight.w400,
                        size: 12,
                        family: 'Syne',
                        color: Color.fromRGBO(170, 170, 170, 1),
                      ),
                      Row(
                        children: [
                          CustomTextStyle(name: 'Hello, ', weight: FontWeight.w400, size: 15),
                          CustomTextStyle(name: 'Yohannes', weight: FontWeight.w600, size: 15),
                        ],
                      )
                    ],
                  )
                ],
              ),
            ),
            Container(
              width: 40,
              height: 40,
              decoration: BoxDecoration(
                border: Border.all(
                  color: const Color.fromRGBO(221, 221, 221, 1),
                  width: 1.0,
                ),
                borderRadius: BorderRadius.circular(9.0),
              ),
              child: Stack(
                children: [
                  IconButton(
                    icon: const Icon(Icons.notifications_none_outlined),
                    color: const Color.fromRGBO(102, 102, 102, 1),
                    onPressed: () {},
                  ),
                  Positioned(
                      left: 20,
                      top: 12,
                      child: Icon(
                        Icons.circle,
                        size: 8,
                        color: Colors.blue[800],
                      ))
                ],
              ),
            ),
          ],
        ),
      ),
      const SizedBox(height: 38.0),
      SizedBox(
        width: 364,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const CustomTextStyle(
                name: 'Available Products', weight: FontWeight.w600, size: 24),
            Container(
              width: 40,
              height: 40,
              decoration: BoxDecoration(
                border: Border.all(
                  color: const Color.fromRGBO(221, 221, 221, 1), // Border color
                  width: 1.0, // Border width
                ),
                borderRadius: BorderRadius.circular(9.0), // Border radius
              ),
              child: IconButton(
                icon: const Icon(Icons.search,size: 24,),
                color: const Color.fromRGBO(221, 221, 221, 1), // Icon color
                onPressed: () {
                  Navigator.push(context, MyAnimation.createRoute(const ProductSearchPage()));
                }
              ),
            ),
          ],
        ),
      ),
    ]);
  }
}
