
import 'package:application1/components/card_box_style.dart';
import 'package:application1/components/header.dart';
import 'package:application1/pages/product_add_page.dart';
import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: const Center(
        child: SingleChildScrollView(
          padding: EdgeInsets.all(32),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              HeaderView(),
              SizedBox(height: 22.0),
              MyCardBox(),
              MyCardBox(),
              MyCardBox(),
              MyCardBox(),
            ],
          ),
        ),
      ),
      floatingActionButton: SizedBox(
        width: 64,
        height: 64,
        child: FloatingActionButton(
          onPressed: () {
            Navigator.of(context)
                .push(MaterialPageRoute(builder: (BuildContext context) {
              return const AddProudctPage();
            }));
          },
          
          backgroundColor:Color.fromRGBO(63, 81, 243, 1),
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
