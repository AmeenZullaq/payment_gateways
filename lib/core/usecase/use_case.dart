import 'package:dartz/dartz.dart';

abstract class UseCase<T, P> {
  Future<Either<String,T>> call({required P params});
}
