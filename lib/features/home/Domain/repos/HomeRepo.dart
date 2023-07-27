import 'package:bookly_app/core/errors/failures.dart';

import 'package:dartz/dartz.dart';

import '../Entities/Book_Entity.dart';

abstract class HomeRepo {
  Future<Either<Failures, List<BookEntity>>> FetchFeatureBooks(
      {int pagenumber = 0});
  Future<Either<Failures, List<BookEntity>>> FetchNewestBooks(
      {int pagenumber = 0});
}
