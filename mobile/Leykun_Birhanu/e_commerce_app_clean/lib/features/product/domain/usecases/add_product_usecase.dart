import 'package:dartz/dartz.dart';

import '../../../../core/error/failure.dart';
import '../../../../core/usecase.dart';
import '../entities/product_entity.dart';
import '../repository/product_repository.dart';

class AddProductUsecase implements UseCase<ProductEntity, ProductEntity> {
  final ProductRepository productRepository;

  AddProductUsecase(this.productRepository);
  @override
  Future<Either<Failure, ProductEntity>> execute(ProductEntity product) async {
    return await productRepository.addProduct(product);
  }
}

