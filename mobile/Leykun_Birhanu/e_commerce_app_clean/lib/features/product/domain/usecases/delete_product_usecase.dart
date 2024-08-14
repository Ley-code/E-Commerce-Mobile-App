import 'package:dartz/dartz.dart';

import '../../../../core/error/failure.dart';
import '../../../../core/usecase.dart';
import '../repository/product_repository.dart';

class DeleteProductUsecase implements UseCase<bool, String> {
  final ProductRepository repository;

  DeleteProductUsecase(this.repository);

  @override
  Future<Either<Failure, bool>> execute(String id) async {
    return await repository.deleteProduct(id);
  }
}

