import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../domain/entities/product_entity.dart';
import '../bloc/product_bloc.dart';
import '../widgets/components/button_styles.dart';
import '../widgets/components/size_cards.dart';
import '../widgets/components/text_style.dart';

class DetailsPage extends StatelessWidget {
  final ProductEntity selectedProduct;

  const DetailsPage({
    super.key,
    required this.selectedProduct,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: BlocConsumer<ProductBloc, ProductState>(
          listener: (context, state) {
            if (state is ProductDeletedState) {
              ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                  content: Text('Successfully Deleted Product')));
              Navigator.pushNamed(context, '/home_page');
            } else if (state is ProductErrorState) {
              ScaffoldMessenger.of(context)
                  .showSnackBar(const SnackBar(content: Text('error')));
            }
          },
          builder: (BuildContext context, ProductState state) {
            if (state is ProductLoading) {
              final double screenWidth = MediaQuery.of(context).size.width;
              final double screenheight = MediaQuery.of(context).size.height;
              return SizedBox(
                width: screenWidth * 1,
                height: screenheight,
                child: const Center(
                  child: CircularProgressIndicator(),
                ),
              );
            } else {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Stack(
                    children: [
                      SizedBox(
                        width: 430,
                        height: 286,
                        child: Image.network(
                          selectedProduct.imageUrl,
                          fit: BoxFit.cover,
                        ),
                      ),
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
                    ],
                  ),
                  const SizedBox(height: 21),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 32),
                    child: const Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        CustomTextStyle(
                          name: 'Men\'s shoe',
                          weight: FontWeight.w400,
                          size: 16,
                          color: Color.fromRGBO(170, 170, 170, 1.0),
                        ),
                        Row(
                          children: [
                            Icon(
                              Icons.star,
                              color: Color.fromRGBO(255, 215, 0, 1),
                            ),
                            CustomTextStyle(
                              name: '4',
                              weight: FontWeight.w400,
                              size: 16,
                              color: Color.fromRGBO(170, 170, 170, 1.0),
                              family: 'Sora',
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 16),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 32),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        CustomTextStyle(
                          name: selectedProduct.name,
                          weight: FontWeight.w600,
                          size: 24,
                        ),
                        CustomTextStyle(
                          name: '\$${selectedProduct.price}',
                          weight: FontWeight.w500,
                          size: 16,
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 20),
                  const Padding(
                    padding: EdgeInsets.only(left: 32),
                    child: CustomTextStyle(
                      name: 'Size: ',
                      weight: FontWeight.w500,
                      size: 20,
                    ),
                  ),
                  SizedBox(
                    width: 500,
                    height: 60,
                    child: ListView.builder(
                      itemCount: 6,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) {
                        return GestureDetector(
                          onTap: () {
                            // Handle size selection
                          },
                          child: SizeCards(
                            value: false,
                            size: index + 39,
                          ),
                        );
                      },
                    ),
                  ),
                  const SizedBox(height: 32),
                  Container(
                    padding: const EdgeInsets.only(left: 32),
                    width: 366,
                    height: 260,
                    child: Text(
                      selectedProduct.description,
                      style: const TextStyle(
                        fontFamily: 'Poppins',
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
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          PrimaryButtonStyle(
                            pressed: () {
                              context
                                  .read<ProductBloc>()
                                  .add(DeleteProductEvent(selectedProduct.id));
                              //Navigator.of(context).pop('delete');
                            },
                            name: 'DELETE',
                            width: 152,
                            height: 50,
                            fgcolor: const Color.fromARGB(230, 255, 19, 19),
                            bgcolor: Colors.white,
                          ),
                          const SizedBox(
                            width: 16,
                          ),
                          PrimaryButtonStyle(
                            pressed: () {
                              Navigator.pushNamed(context, '/update_page',
                                  arguments: selectedProduct);
                            },
                            name: 'UPDATE',
                            width: 152,
                            height: 50,
                            fgcolor: Colors.white,
                            bgcolor: const Color.fromRGBO(63, 81, 243, 1),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              );
            }
          },
        ),
      ),
    );
  }
}
