import 'package:dartz/dartz.dart';

import '../../../../core/error/failure.dart';
import '../../../../core/usecase.dart';
import '../entities/product_entity.dart';
import '../repository/product_repository.dart';

class UpdateProductUsecase implements UseCase<ProductEntity, ProductEntity> {
  final ProductRepository repository;

  UpdateProductUsecase(this.repository);

  @override
  Future<Either<Failure, ProductEntity>> execute(ProductEntity product) async {
    return await repository.updateProduct(product);
  }
}