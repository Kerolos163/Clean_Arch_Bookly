import 'package:bookly_app/core/errors/failures.dart';
import 'package:dartz/dartz.dart';

import '../../../../core/use_case/UseCase.dart';
import '../Entities/Book_Entity.dart';
import '../repos/HomeRepo.dart';

class FetchFeatureBooksUseCase extends UseCase<List<BookEntity>, No_Param> {
  final HomeRepo homeRepo;

  FetchFeatureBooksUseCase(this.homeRepo);

  @override
  Future<Either<Failures, List<BookEntity>>> call([No_Param? param]) async {
    return await homeRepo.FetchFeatureBooks();
  }
}

