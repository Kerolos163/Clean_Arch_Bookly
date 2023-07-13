import '../../Domain/Entities/Book_Entitiy.dart';

abstract class HomeRemoteDataSourse {
  Future<List<BookEntity>> FetchFeatureBooks();
  Future<List<BookEntity>> FetchNewestBooks();
}

class HomeRemoteDataSourseImp extends HomeRemoteDataSourse {
  @override
  Future<List<BookEntity>> FetchFeatureBooks() {
    // TODO: implement FetchFeatureBooks
    throw UnimplementedError();
  }

  @override
  Future<List<BookEntity>> FetchNewestBooks() {
    // TODO: implement FetchNewestBooks
    throw UnimplementedError();
  }
}
