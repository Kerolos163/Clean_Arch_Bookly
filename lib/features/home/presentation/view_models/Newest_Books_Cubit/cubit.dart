import 'package:bloc/bloc.dart';
import 'package:bookly_app/features/home/Domain/use_case/fetch_Newest_Books_Use_Case.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../Domain/repos/HomeRepo.dart';
import 'state.dart';

class Newest_Books_Cubit extends Cubit<Newest_Books_State> {
  Newest_Books_Cubit(this.fetchNewestBooksUseCase)
      : super(Newest_Books_initstate());
  static Newest_Books_Cubit get(context) => BlocProvider.of(context);
  final FetchNewestBooksUseCase fetchNewestBooksUseCase;
  Future<void> FetchNewestBooks({int pagenumber = 0}) async {
    if (pagenumber == 0) {
      emit(NewestBooksLoadingState());
    } else {
      emit(NewestBooksPaginationLoadingState());
    }
    var result = await fetchNewestBooksUseCase.call(pagenumber);
    result.fold((failure) {
      if (pagenumber == 0) {
        emit(NewestBooksFailureState(error: failure.errMessage));
      } else {
        emit(NewestBooksPaginationFailureState(error: failure.errMessage));
      }
    }, (Books) {
      emit(NewestBooksSuccessState(Books: Books));
    });
  }
}
