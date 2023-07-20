import 'package:bookly_app/core/utils/api_service.dart';
import 'package:bookly_app/features/home/Data/models/book_model/book_model.dart';
import 'package:hive_flutter/adapters.dart';

import '../../../../constants.dart';
import '../../../../core/utils/functions/save_books.dart';
import '../../Domain/Entities/Book_Entity.dart';

abstract class HomeRemoteDataSourse {
  Future<List<BookEntity>> FetchFeatureBooks();
  Future<List<BookEntity>> FetchNewestBooks();
}

class HomeRemoteDataSourseImp extends HomeRemoteDataSourse {
  final ApiService apiService;

  HomeRemoteDataSourseImp(this.apiService);

  @override
  Future<List<BookEntity>> FetchFeatureBooks() async {
    var data = await apiService.get(
        end_point: "volumes?Filtering=free-ebooks&q=programming");
    List<BookEntity> Books = GetBookList(data);
    SaveBooksData(Books, kFeatureBox);
    return Books;
  }

  @override
  Future<List<BookEntity>> FetchNewestBooks() async {
    var data = await apiService.get(
        end_point:
            "volumes?Filtering=free-ebooks&q=programming&Sorting=newest");
    List<BookEntity> Books = GetBookList(data);
    SaveBooksData(Books, kNewestBox);
    return Books;
  }

  List<BookEntity> GetBookList(Map<String, dynamic> data) {
    List<BookEntity> Books = [];
    for (var Book in data["items"]) {
      Books.add(BookModel.fromJson(Book));
    }
    return Books;
  }
}
