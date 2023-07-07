import 'package:bloc/bloc.dart';
import 'package:bookly_app/features/home/presentation/view_models/Feature_Books_Cubit/state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../Data/repos/home_repo.dart';

class Feature_Books_Cubit extends Cubit<Feature_Books_State> {
  Feature_Books_Cubit(this.homeRepo) : super(Feature_Books_initstate());
  static Feature_Books_Cubit get(context) => BlocProvider.of(context);
  final HomeRepo homeRepo;
  Future<void> FetchFeatureBooks() async {
    emit(FeatureBooksLoadingState());
    var result = await homeRepo.FetchFeatureBooks();
    result.fold((Failures) {
      emit(FeatureBooksFailureState(error: Failures.errMessage));
    }, (Books) {
      emit(FeatureBooksSuccessState(Books: Books));
    });
  }
}
