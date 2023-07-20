import 'package:bookly_app/constants.dart';
import 'package:hive_flutter/adapters.dart';

import '../../Domain/Entities/Book_Entity.dart';

abstract class HomeLocalDataSourse {
  List<BookEntity> FetchFeatureBooks();
  List<BookEntity> FetchNewestBooks();
}
class HomeLocalDataSourseImp extends HomeLocalDataSourse
{
  @override
  List<BookEntity> FetchFeatureBooks() {
    var box=Hive.box<BookEntity>(kFeatureBox);
    return box.values.toList();
  }

  @override
  List<BookEntity> FetchNewestBooks() {
    var box=Hive.box<BookEntity>(kNewestBox);
    return box.values.toList();
  }

}