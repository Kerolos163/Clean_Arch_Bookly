import '../../Domain/Entities/Book_Entitiy.dart';

abstract class HomeLocalDataSourse {
  List<BookEntity> FetchFeatureBooks();
  List<BookEntity> FetchNewestBooks();
}
class HomeLocalDataSourseImp extends HomeLocalDataSourse
{
  @override
  List<BookEntity> FetchFeatureBooks() {
    // TODO: implement FetchFeatureBooks
    throw UnimplementedError();
  }

  @override
  List<BookEntity> FetchNewestBooks() {
    // TODO: implement FetchNewestBooks
    throw UnimplementedError();
  }

}