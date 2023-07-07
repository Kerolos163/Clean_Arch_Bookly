
import '../../../Data/models/book_model/book_model.dart';
import 'cubit.dart';

abstract class Similar_Books_State {}

class Similar_Books_initstate extends Similar_Books_State {}

class SimilarBooksLoadingState extends Similar_Books_State {}

class SimilarBooksSuccessState extends Similar_Books_State {
  List<BookModel> Books;
  SimilarBooksSuccessState({
    required this.Books,
  });
}

class SimilarBooksFailureState extends Similar_Books_State {
  String error;
  SimilarBooksFailureState({
    required this.error,
  });
}
