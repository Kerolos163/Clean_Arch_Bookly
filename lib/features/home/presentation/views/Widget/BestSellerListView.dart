import 'package:bookly_app/features/home/Domain/Entities/Book_Entity.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/utils/functions/build_error_snakebar.dart';
import '../../../../../core/widget/Custom_error_widget.dart';
import '../../../../../core/widget/custom_Loading_Indicator.dart';
import '../../view_models/Newest_Books_Cubit/cubit.dart';
import '../../view_models/Newest_Books_Cubit/state.dart';
import 'Newest_Books_ListView_LoadingIndicator.dart';
import 'best_seller_List_Item.dart';

class BestSellerListView extends StatefulWidget {
  const BestSellerListView({Key? key});

  @override
  State<BestSellerListView> createState() => _BestSellerListViewState();
}

class _BestSellerListViewState extends State<BestSellerListView> {
  List<BookEntity> Books = [];

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<Newest_Books_Cubit, Newest_Books_State>(
      listener: (context, state) {
        if (state is NewestBooksSuccessState) {
          Books.addAll(state.Books);
        } else if (state is NewestBooksPaginationFailureState) {
          ScaffoldMessenger.of(context).showSnackBar(
            Custom_Error_Widget(state.error),
          );
        }
      },
      builder: (context, state) {
        if (state is NewestBooksSuccessState ||
            state is NewestBooksPaginationLoadingState ||
            state is NewestBooksPaginationFailureState) {
          return NotificationListener<ScrollNotification>(
            onNotification: (notification) => true,
            child: ListView.builder(
              shrinkWrap: true,
              padding: EdgeInsets.zero,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  child: BookListViewItem(context, Books[index]),
                );
              },
              itemCount: Books.length,
              physics: const NeverScrollableScrollPhysics(),
            ),
          );
        } else if (state is NewestBooksFailureState) {
          return Error_Widget(Message: state.error);
        } else {
          return const NewestBooksListViewLoadingIndicator();
        }
      },
    );
  }
}
