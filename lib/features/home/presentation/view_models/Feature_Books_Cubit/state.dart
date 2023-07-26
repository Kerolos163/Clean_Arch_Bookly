import 'package:bookly_app/features/home/Domain/Entities/Book_Entity.dart';

import '../../../Data/models/book_model/book_model.dart';

abstract class Feature_Books_State {}

class Feature_Books_initstate extends Feature_Books_State {}

class FeatureBooksLoadingState extends Feature_Books_State {}

class FeatureBooksPaginationLoadingState extends Feature_Books_State {}

class FeatureBooksPaginationFailureState extends Feature_Books_State {
  String error;
  FeatureBooksPaginationFailureState({
    required this.error,
  });
}

class FeatureBooksSuccessState extends Feature_Books_State {
  List<BookEntity> Books;
  FeatureBooksSuccessState({
    required this.Books,
  });
}

class FeatureBooksFailureState extends Feature_Books_State {
  String error;
  FeatureBooksFailureState({
    required this.error,
  });
}
