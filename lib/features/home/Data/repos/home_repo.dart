import 'package:dartz/dartz.dart';
import '../../../../core/errors/failures.dart';
import '../models/book_model/book_model.dart';

abstract class HomeRepo {
  Future<Either<Failures, List<BookModel>>> FetchNewestBooks();
  Future<Either<Failures, List<BookModel>>> FetchFeatureBooks();
  Future<Either<Failures, List<BookModel>>> FetchSimilarBooks({required String category});
}
