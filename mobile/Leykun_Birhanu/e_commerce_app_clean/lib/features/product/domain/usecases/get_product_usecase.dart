import 'package:dartz/dartz.dart';

import '../../../../core/error/failure.dart';
import '../entities/product_entity.dart';
import '../repository/product_repository.dart';

class GetProductUsecase {
  final ProductRepository repository;

  GetProductUsecase(this.repository);

  Future<Either<Failure,ProductEntity>> execute(String id) async {
    return await repository.getProduct(id);
  }
}
