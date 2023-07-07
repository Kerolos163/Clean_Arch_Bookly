import 'package:dartz/dartz.dart';
import '../../../core/errors/failures.dart';
import '../../home/Data/models/book_model/book_model.dart';

abstract class searchrepo
{
  Future <Either<Failures,List<BookModel>>> FetachBooks();
}