import 'package:bookly_app/core/errors/failures.dart';
import 'package:dartz/dartz.dart';

import '../Entities/Book_Entitiy.dart';
import '../repos/HomeRepo.dart';

class FetchFeatureBooksUseCase {
  final HomeRepo homeRepo;

  FetchFeatureBooksUseCase(this.homeRepo);

  Future<Either<Failures, List<BookEntity>>> FetchFeatureBooks() {
    return homeRepo.FetchFeatureBooks();
  }
}
