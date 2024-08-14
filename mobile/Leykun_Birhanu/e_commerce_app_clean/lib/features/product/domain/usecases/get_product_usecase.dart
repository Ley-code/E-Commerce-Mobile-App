import 'package:dartz/dartz.dart';

import '../../../../core/error/failure.dart';
import '../../../../core/usecase.dart';
import '../entities/product_entity.dart';
import '../repository/product_repository.dart';

class GetProductUsecase implements UseCase<ProductEntity, String> {
  final ProductRepository repository;

  GetProductUsecase(this.repository);

  @override
  Future<Either<Failure,ProductEntity>> execute(String id) async {
    return await repository.getProduct(id);
  }
}
