import 'package:bookly_app/core/errors/failures.dart';
import 'package:dartz/dartz.dart';

import '../../../../core/use_case/UseCase.dart';
import '../Entities/Book_Entity.dart';
import '../repos/HomeRepo.dart';

class FetchFeatureBooksUseCase extends UseCase<List<BookEntity>, int> {
  final HomeRepo homeRepo;

  FetchFeatureBooksUseCase(this.homeRepo);

  @override
  Future<Either<Failures, List<BookEntity>>> call([int param = 0]) async {
    return await homeRepo.FetchFeatureBooks(pagenumber: param);
  }
}
