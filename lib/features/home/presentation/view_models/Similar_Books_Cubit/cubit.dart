import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../Data/repos/home_repo.dart';
import 'state.dart';

class Similar_Books_Cubit extends Cubit<Similar_Books_State> {
  Similar_Books_Cubit(this.homeRepo) : super(Similar_Books_initstate());
  static Similar_Books_Cubit get(context) => BlocProvider.of(context);
  final HomeRepo homeRepo;
  Future<void> FetchSimilarBooks({required String Category}) async {
    emit(SimilarBooksLoadingState());
    var result = await homeRepo.FetchSimilarBooks(category:Category );
    result.fold((Failures) {
      emit(SimilarBooksFailureState(error: Failures.errMessage));
    }, (Books) {
      print("Get Similar Books");
      emit(SimilarBooksSuccessState(Books: Books));
    });
  }
}
