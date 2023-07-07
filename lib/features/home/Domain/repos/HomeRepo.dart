import 'package:bookly_app/features/home/Domain/Entities/Book_Entitiy.dart';

abstract class HomeRepo
{
  Future<List<BookEntity>> FetchFeatureBooks();
  Future<List<BookEntity>> FetchNewestBooks();

}