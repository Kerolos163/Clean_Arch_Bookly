import 'package:bookly_app/constants.dart';
import 'package:hive_flutter/adapters.dart';

import '../../Domain/Entities/Book_Entity.dart';

abstract class HomeLocalDataSourse {
  List<BookEntity> FetchFeatureBooks({int pagenumber = 0});
  List<BookEntity> FetchNewestBooks();
}

class HomeLocalDataSourseImp extends HomeLocalDataSourse {
  @override
  List<BookEntity> FetchFeatureBooks({pagenumber = 0}) {
    int startIndex = pagenumber * 10;
    int endIndex = (pagenumber + 1) * 10;
    var box = Hive.box<BookEntity>(kFeatureBox);
    int length = box.values.length;
    if (startIndex >= length || endIndex > length) {
      return [];
    }
    return box.values.toList().sublist(startIndex, endIndex);
  }

  @override
  List<BookEntity> FetchNewestBooks() {
    var box = Hive.box<BookEntity>(kNewestBox);
    return box.values.toList();
  }
}
