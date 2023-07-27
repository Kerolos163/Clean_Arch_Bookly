import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/widget/Custom_error_widget.dart';
import '../../../../../core/widget/custom_Loading_Indicator.dart';
import '../../view_models/Newest_Books_Cubit/cubit.dart';
import '../../view_models/Newest_Books_Cubit/state.dart';
import 'best_seller_List_Item.dart';

class BestSellerListView extends StatelessWidget {
  const BestSellerListView({Key? key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<Newest_Books_Cubit, Newest_Books_State>(
      builder: (context, state) {
        if (state is NewestBooksSuccessState) {
          return NotificationListener<ScrollNotification>(
            onNotification: (notification) => true,
            child: ListView.builder(
              shrinkWrap: true,
              padding: EdgeInsets.zero,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  child: BookListViewItem(context, state.Books[index]),
                );
              },
              itemCount: state.Books.length,
              physics: const NeverScrollableScrollPhysics(),
            ),
          );
        } else if (state is NewestBooksFailureState) {
          return Error_Widget(Message: state.error);
        } else {
          return CustomLoadingIndicator();
        }
      },
    );
  }
}
