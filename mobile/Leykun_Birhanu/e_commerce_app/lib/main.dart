
import 'package:flutter/material.dart';

import 'data/product.dart';
import 'pages/details_page.dart';
import 'pages/home_page.dart';
import 'pages/product_add_page.dart';
import 'pages/product_search_page.dart';
import 'pages/update_page.dart';

void main(List<String> args) {
  runApp(
  MaterialApp(
      
      initialRoute: '/home_page',
      onGenerateRoute:(settings)  {
        if (settings.name == '/home_page'){
          return MaterialPageRoute(builder: (_) => const Home());
        }
        else if(settings.name=='/product_add_page'){
          return MaterialPageRoute(builder: (_) => const AddProudctPage());
        }
        else if(settings.name=='/product_search_page'){
          return MaterialPageRoute(builder: (_) => const ProductSearchPage());
        }
        else if(settings.name=='/details_page'){
          return MaterialPageRoute(builder: (_) => DetailsPage(selectedProduct: settings.arguments as Product));
        }else if(settings.name=='/update_page'){
          return MaterialPageRoute(builder: (_) => UpdatePage(selectedProduct: settings.arguments as Product));
        }
        return null;
        
      } ,
      
      title: 'Flutter App',
      debugShowCheckedModeBanner: false,
    ),
  );
}
