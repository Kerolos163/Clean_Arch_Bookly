import 'package:bookly_app/core/errors/failures.dart';
import 'package:dartz/dartz.dart';

import '../../../../core/use_case/UseCase.dart';

import '../Entities/Book_Entity.dart';
import '../repos/HomeRepo.dart';

class FetchNewestBooksUseCase extends UseCase<List<BookEntity>, int> {
  final HomeRepo homeRepo;

  FetchNewestBooksUseCase(this.homeRepo);

  @override
  Future<Either<Failures, List<BookEntity>>> call([int param = 0]) async {
    return await homeRepo.FetchNewestBooks(pagenumber: param);
  }
}
