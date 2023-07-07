import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../constants.dart';
import '../../../../../core/widget/Custom_error_widget.dart';
import '../../../../../core/widget/custom_Loading_Indicator.dart';
import '../../view_models/Similar_Books_Cubit/cubit.dart';
import '../../view_models/Similar_Books_Cubit/state.dart';
import 'custom_BooK_Image_item.dart';

SimilarBooksListview(context) {
  return BlocBuilder<Similar_Books_Cubit, Similar_Books_State>(
    builder: (context, state) {
      if (state is SimilarBooksSuccessState) {
        return SizedBox(
          height: MediaQuery.of(context).size.height * .15,
          child: ListView.builder(
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.only(left: 10),
                child: CustomBookImage(context,
                    img: state.Books[index].volumeInfo.imageLinks?.thumbnail ??
                        KimagetoNullImage),
              );
            },
            itemCount: state.Books.length,
            scrollDirection: Axis.horizontal,
            physics: const BouncingScrollPhysics(),
          ),
        );
      } else if (state is SimilarBooksFailureState) {
        return Error_Widget(Message: state.error);
      } else {
        return CustomLoadingIndicator();
      }
    },
  );
}
