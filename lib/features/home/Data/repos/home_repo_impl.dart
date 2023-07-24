import 'package:bookly_app/features/home/Data/data_sources/home_local_data_source.dart';
import 'package:bookly_app/features/home/Data/data_sources/home_remote_data_source.dart';
import 'package:bookly_app/features/home/Domain/Entities/Book_Entity.dart';
import 'package:dartz/dartz.dart';

import 'package:dio/dio.dart';

import '../../../../core/errors/failures.dart';
import '../../../../core/utils/api_service.dart';
import '../../Domain/repos/HomeRepo.dart';
import '../models/book_model/book_model.dart';

class HomeRepoImpl implements HomeRepo {
  final HomeLocalDataSourse homelocaldatasourse;
  final HomeRemoteDataSourse homeremotedatasourse;

  HomeRepoImpl(
      {required this.homelocaldatasourse, required this.homeremotedatasourse});
  @override
  Future<Either<Failures, List<BookEntity>>> FetchNewestBooks() async {
    try {
      List<BookEntity> Books;
      Books = await homelocaldatasourse.FetchNewestBooks();
      if (Books.isNotEmpty) {
        print("Cached");
        return right(Books);
      }
      Books = await homeremotedatasourse.FetchNewestBooks();
      return Right(Books);
    } catch (e) {
      if (e is DioException) {
        return Left(FailuresServer.fromDioExceptio(e));
      }
      return Left(FailuresServer(e.toString()));
    }
  }

  @override
  Future<Either<Failures, List<BookEntity>>> FetchFeatureBooks(
      {int pagenumber = 0}) async {
    try {
      List<BookEntity> Books;
      Books = await homelocaldatasourse.FetchFeatureBooks();
      if (Books.isNotEmpty) {
        print("Cached");
        return right(Books);
      }
      Books = await homeremotedatasourse.FetchFeatureBooks();
      return Right(Books);
    } catch (e) {
      if (e is DioException) {
        return Left(FailuresServer.fromDioExceptio(e));
      }
      return Left(FailuresServer(e.toString()));
    }
  }

  // @override
  // Future<Either<Failures, List<BookModel>>> FetchSimilarBooks(
  //     {required String category}) async {
  //   try {
  //     var data = await api.get(
  //         end_point:
  //             'volumes?Filtering=free-ebooks&q=subject:programming&Sorting=relevance');
  //     List<BookModel> Books = [];
  //     for (var item in data["items"]) {
  //       Books.add(BookModel.fromJson(item));
  //     }
  //     return right(Books);
  //   } on Exception catch (e) {
  //     if (e is DioException) {
  //       return left(FailuresServer.fromDioExceptio(e));
  //     }
  //     return left(FailuresServer(e.toString()));
  //   }
  // }
}
