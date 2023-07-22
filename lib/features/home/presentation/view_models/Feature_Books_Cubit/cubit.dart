import 'package:bloc/bloc.dart';
import 'package:bookly_app/features/home/presentation/view_models/Feature_Books_Cubit/state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../Domain/repos/HomeRepo.dart';
import '../../../Domain/use_case/fetch_Feature_Books_Use_Case.dart';

class Feature_Books_Cubit extends Cubit<Feature_Books_State> {
  Feature_Books_Cubit(this.featureBooksUseCase)
      : super(Feature_Books_initstate());
  static Feature_Books_Cubit get(context) => BlocProvider.of(context);
  final FetchFeatureBooksUseCase featureBooksUseCase;
  Future<void> FetchFeatureBooks() async {
    emit(FeatureBooksLoadingState());
    var result = await featureBooksUseCase.call();
    result.fold((failure) {
      emit(FeatureBooksFailureState(error: failure.errMessage));
    }, (Books) {
      emit(FeatureBooksSuccessState(Books: Books));
    });
  }
}
