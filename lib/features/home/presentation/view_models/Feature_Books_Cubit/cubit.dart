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
  Future<void> FetchFeatureBooks({int pagenumber = 0}) async {
    if (pagenumber == 0) {
      emit(FeatureBooksLoadingState());
    } else {
      emit(FeatureBooksPaginationLoadingState());
    }
    var result = await featureBooksUseCase.call(pagenumber);
    result.fold((failure) {
      if (pagenumber == 0) {
        emit(FeatureBooksFailureState(error: failure.errMessage));
      } else {
        emit(FeatureBooksPaginationFailureState(error: failure.errMessage));
      }
    }, (Books) {
      emit(FeatureBooksSuccessState(Books: Books));
    });
  }
}
