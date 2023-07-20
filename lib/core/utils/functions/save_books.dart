  import 'package:hive_flutter/adapters.dart';

import '../../../features/home/Domain/Entities/Book_Entity.dart';

void SaveBooksData(List<BookEntity> Books,String BoxName) {
    var box = Hive.box<BookEntity>(BoxName);
    box.addAll(Books);
  }