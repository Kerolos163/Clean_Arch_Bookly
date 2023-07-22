import 'package:bloc/bloc.dart';
import 'package:bookly_app/features/home/Domain/use_case/fetch_Newest_Books_Use_Case.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../Domain/repos/HomeRepo.dart';
import 'state.dart';

class Newest_Books_Cubit extends Cubit<Newest_Books_State> {
  Newest_Books_Cubit(this.fetchNewestBooksUseCase)
      : super(Newest_Books_initstate());
  static Newest_Books_State get(context) => BlocProvider.of(context);
  final FetchNewestBooksUseCase fetchNewestBooksUseCase;
  Future<void> FetchNewestBooks() async {
    emit(NewestBooksLoadingState());
    var result = await fetchNewestBooksUseCase.call();
    result.fold((failure) {
      emit(NewestBooksFailureState(error: failure.errMessage));
    }, (Books) {
      emit(NewestBooksSuccessState(Books: Books));
    });
  }
}
