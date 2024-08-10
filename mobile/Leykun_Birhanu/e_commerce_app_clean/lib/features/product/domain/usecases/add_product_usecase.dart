import 'package:dartz/dartz.dart';

import '../../../../core/error/failure.dart';
import '../entities/product_entity.dart';
import '../repository/product_repository.dart';

class AddProductUsecase{
  final ProductRepository productRepository;

  AddProductUsecase(this.productRepository);

   Future<Either<Failure,ProductEntity>> execute (ProductEntity product) async {
    return await productRepository.addProduct(product);
  }
}