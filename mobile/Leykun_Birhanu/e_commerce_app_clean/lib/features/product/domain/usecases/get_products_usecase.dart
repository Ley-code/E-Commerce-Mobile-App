import 'package:dartz/dartz.dart';

import '../../../../core/error/failure.dart';
import '../entities/product_entity.dart';
import '../repository/product_repository.dart';

class GetProductsUsecase{
  final ProductRepository repository;

  GetProductsUsecase(this.repository);
  Future<Either<Failure, List<ProductEntity>>> execute() async {
    return await repository.getProducts();
  }
}
