import 'package:flutter/material.dart';

import '../components/card_box_style.dart';
import '../components/header.dart';
import '../data/product.dart';

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
            const Padding(
              padding: EdgeInsets.fromLTRB(12, 32, 12, 0),
              child: HeaderView(),
            ),
            const SizedBox(height: 22.0),
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
          backgroundColor: const Color.fromRGBO(63, 81, 243, 1),
          shape: const CircleBorder(),
          child: const Icon(
            Icons.add,
            size: 36,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
