import 'package:dartz/dartz.dart';

import 'package:dio/dio.dart';

import '../../../../core/errors/failures.dart';
import '../../../../core/utils/api_service.dart';
import '../models/book_model/book_model.dart';
import 'home_repo.dart';

class HomeRepoImpl implements HomeRepo {
  final ApiService api;

  HomeRepoImpl(this.api);
  @override
  Future<Either<Failures, List<BookModel>>> FetchNewestBooks() async {
    try {
      var data = await api.get(
          end_point:
              'volumes?Filtering=free-ebooks&Sorting=newest &q=Computer Science');
      List<BookModel> Books = [];
      for (var item in data["items"]) {
        Books.add(BookModel.fromJson(item));
      }
      return right(Books);
    } on Exception catch (e) {
      if (e is DioException) {
        return left(FailuresServer.fromDioExceptio(e));
      }
      return left(FailuresServer(e.toString()));
    }
  }

  @override
  Future<Either<Failures, List<BookModel>>> FetchFeatureBooks() async {
    try {
      var data = await api.get(
          end_point: 'volumes?Filtering=free-ebooks&q=subject:programming');
      List<BookModel> Books = [];
      for (var item in data["items"]) {
        Books.add(BookModel.fromJson(item));
      }
      return right(Books);
    } on Exception catch (e) {
      if (e is DioException) {
        return left(FailuresServer.fromDioExceptio(e));
      }
      return left(FailuresServer(e.toString()));
    }
  }

  @override
  Future<Either<Failures, List<BookModel>>> FetchSimilarBooks(
      {required String category}) async {
    try {
      var data = await api.get(
          end_point: 'volumes?Filtering=free-ebooks&q=subject:programming&Sorting=relevance');
      List<BookModel> Books = [];
      for (var item in data["items"]) {
        Books.add(BookModel.fromJson(item));
      }
      return right(Books);
    } on Exception catch (e) {
      if (e is DioException) {
        return left(FailuresServer.fromDioExceptio(e));
      }
      return left(FailuresServer(e.toString()));
    }
  }
}
