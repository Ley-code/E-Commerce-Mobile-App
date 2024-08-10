import 'package:dartz/dartz.dart';

import '../../../../core/error/failure.dart';
import '../repository/product_repository.dart';

class DeleteProductUsecase{
  final ProductRepository repository;

  DeleteProductUsecase(this.repository);

  Future<Either<Failure, bool>> execute(String id) async {
    return await repository.deleteProduct(id);
  }
}