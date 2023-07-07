// ignore_for_file: public_member_api_docs, sort_constructors_first
import '../../../../../home/Data/models/book_model/book_model.dart';

abstract class SearchState {}

class searchinitstate extends SearchState {}

class FetchLoadingstate extends SearchState {}

class FetchSuccessstate extends SearchState {

}

class FetchFailurestate extends SearchState {
  final String error;
  FetchFailurestate({
    required this.error,
  });
}
class SearchLoadingstate extends SearchState {}

class SearchSuccessstate extends SearchState {
}

class SearchFailurestate extends SearchState {
  final String error;
  SearchFailurestate({
    required this.error,
  });
}
