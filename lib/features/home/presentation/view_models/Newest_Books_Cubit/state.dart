
import '../../../Data/models/book_model/book_model.dart';
import 'cubit.dart';

abstract class Newest_Books_State {}

class Newest_Books_initstate extends Newest_Books_State {}

class NewestBooksLoadingState extends Newest_Books_State {}

class NewestBooksSuccessState extends Newest_Books_State {
  List<BookModel> Books;
  NewestBooksSuccessState({
    required this.Books,
  });
}

class NewestBooksFailureState extends Newest_Books_State {
  String error;
  NewestBooksFailureState({
    required this.error,
  });
}
