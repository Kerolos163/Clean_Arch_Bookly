import 'package:bookly_app/core/errors/failures.dart';
import 'package:bookly_app/features/home/Domain/Entities/Book_Entitiy.dart';
import 'package:dartz/dartz.dart';

abstract class HomeRepo {
  Future<Either<Failures, List<BookEntity>>> FetchFeatureBooks();
  Future<Either<Failures, List<BookEntity>>> FetchNewestBooks();
}
