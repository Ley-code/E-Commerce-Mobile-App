import 'package:dartz/dartz.dart';

import 'error/failure.dart';

abstract class UseCase<T, P> {
  Future<Either<Failure, T>> execute(P p);
}
