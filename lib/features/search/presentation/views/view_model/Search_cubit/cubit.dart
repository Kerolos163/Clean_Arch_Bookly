

import 'package:bookly_app/features/search/presentation/views/view_model/Search_cubit/state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../home/Data/models/book_model/book_model.dart';
import '../../../../Data/Search_repo.dart';

class SearchCubit extends Cubit<SearchState> {
  SearchCubit(this.Search_repo) : super(searchinitstate());
  static SearchCubit get(context) => BlocProvider.of(context);
  final searchrepo Search_repo;
  late List<BookModel> MyBooks;
  Future<void> FetchBooks() async {
    MyBooks = [];
    emit(FetchLoadingstate());
    var result = await Search_repo.FetachBooks();
    result.fold((Failures) {
      emit(FetchFailurestate(error: Failures.errMessage));
    }, (Books) {
      MyBooks = Books;
      emit(FetchSuccessstate());
    });
  }

  List<BookModel> SearchList = [];
  SearchFeachedBooks({String? txt}) {
    SearchList = [];
    try {
      if (txt == null) {
        emit(SearchSuccessstate());
      } else {
        emit(SearchLoadingstate());
        MyBooks.forEach((Book) {
          if (Book.volumeInfo.authors![0].contains(txt) ||
              Book.volumeInfo.title!.contains(txt)) {
            SearchList.add(Book);
          }
        });
        print(SearchList);
        emit(SearchSuccessstate());
      }
    } on Exception catch (e) {
      emit(SearchFailurestate(error: e.toString()));
    }
  }
}
