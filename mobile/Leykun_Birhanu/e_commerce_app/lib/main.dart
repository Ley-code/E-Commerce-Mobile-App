
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'pages/home_page.dart';

void main(List<String> args) {
  runApp(
    const MaterialApp(
      title: "Flutter App",
      home: Home(),
      debugShowCheckedModeBanner: false,
    ),
  );
}
