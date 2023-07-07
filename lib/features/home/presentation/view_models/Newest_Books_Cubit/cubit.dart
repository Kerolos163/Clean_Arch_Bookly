import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../Data/repos/home_repo.dart';
import 'state.dart';

class Newest_Books_Cubit extends Cubit<Newest_Books_State> {
  Newest_Books_Cubit(this.homeRepo) : super(Newest_Books_initstate());
  static Newest_Books_State get(context) => BlocProvider.of(context);
  final HomeRepo homeRepo;
  Future<void> FetchNewestBooks() async {
    emit(NewestBooksLoadingState());
    var result = await homeRepo.FetchNewestBooks();
    result.fold((Failures) {
      emit(NewestBooksFailureState(error: Failures.errMessage));
    }, (Books) {
      emit(NewestBooksSuccessState(Books: Books));
    });
  }
}
