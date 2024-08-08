import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final int? lines;
  const CustomTextField({super.key, this.lines});

  @override
  Widget build(BuildContext context) {
    return TextField(
      maxLines: lines,
      decoration: InputDecoration(
        filled: true,
        fillColor: Color.fromARGB(255, 238, 238, 238),
        border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(6),
            borderSide: BorderSide.none),
      ),
    );
  }
}
