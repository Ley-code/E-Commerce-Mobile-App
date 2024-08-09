import 'package:application1/components/card_box_style.dart';
import 'package:application1/components/header.dart';
import 'package:application1/data/product.dart';
import 'package:application1/pages/details_page.dart';
import 'package:application1/pages/product_add_page.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: EdgeInsets.fromLTRB(12, 32, 12, 0),
              child: HeaderView(),
            ),
            SizedBox(height: 22.0),
            Expanded(
              child: ListView.builder(
                itemCount: products.length,
                itemBuilder: (context, index) {
                  return MyCardBox(product: products[index]);
                },
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: SizedBox(
        width: 64,
        height: 64,
        child: FloatingActionButton(
          //-----------------------------------------------------------------
          onPressed: ()  {
            Navigator.pushNamed(context, '/product_add_page');

          },
          //-----------------------------------------------------------------
          backgroundColor: Color.fromRGBO(63, 81, 243, 1),
          child: const Icon(
            Icons.add,
            size: 36,
            color: Colors.white,
          ),
          shape: const CircleBorder(),
        ),
      ),
    );
  }
}
