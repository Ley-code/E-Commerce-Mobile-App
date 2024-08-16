import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'features/product/domain/entities/product_entity.dart';
import 'features/product/presentation/bloc/product_bloc.dart';
import 'features/product/presentation/pages/details_page.dart';
import 'features/product/presentation/pages/home_page.dart';
import 'features/product/presentation/pages/product_add_page.dart';
import 'features/product/presentation/pages/product_search_page.dart';
import 'features/product/presentation/pages/update_page.dart';
import 'injection_container.dart' as di;
import 'injection_container.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await di.init();
  runApp(
    BlocProvider(
      create: (context) => sl<ProductBloc>(),
      child: MaterialApp(
        initialRoute: '/home_page',
        onGenerateRoute: (settings) {
          if (settings.name == '/home_page') {
            return MaterialPageRoute(builder: (_) => const Home());
          } else if (settings.name == '/product_add_page') {
            return MaterialPageRoute(builder: (_) => const AddProudctPage());
          } else if (settings.name == '/product_search_page') {
            return MaterialPageRoute(builder: (_) => const ProductSearchPage());
          } else if (settings.name == '/details_page') {
            return MaterialPageRoute(
                builder: (_) =>
                    DetailsPage(selectedProduct: settings.arguments as ProductEntity));
          } else if (settings.name == '/update_page') {
            return MaterialPageRoute(
                builder: (_) =>
                    UpdatePage(selectedProduct: settings.arguments as ProductEntity));
          }
          return null;
        },
        title: 'Flutter App',
        debugShowCheckedModeBanner: false,
      ),
    ),
  );
}
