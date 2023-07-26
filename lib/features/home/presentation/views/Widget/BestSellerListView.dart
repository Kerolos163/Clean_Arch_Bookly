import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/widget/Custom_error_widget.dart';
import '../../../../../core/widget/custom_Loading_Indicator.dart';
import '../../view_models/Newest_Books_Cubit/cubit.dart';
import '../../view_models/Newest_Books_Cubit/state.dart';
import 'best_seller_List_Item.dart';

class BestSellerListView extends StatefulWidget {
  const BestSellerListView({Key? key});

  @override
  _BestSellerListViewState createState() => _BestSellerListViewState();
}

class _BestSellerListViewState extends State<BestSellerListView> {
  final _scrollController = ScrollController();

  bool _reached70Percent = false;

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_onScroll);
  }

  @override
  void dispose() {
    _scrollController.removeListener(_onScroll);
    super.dispose();
  }

  void _onScroll() {
    final maxScrollExtent = _scrollController.position.maxScrollExtent;
    final currentScrollOffset = _scrollController.offset;
    final viewportHeight = _scrollController.position.viewportDimension;
    final scrolledPercentage =
        (currentScrollOffset + viewportHeight) / maxScrollExtent;
    if (scrolledPercentage >= 0.7 && !_reached70Percent) {
      setState(() {
        _reached70Percent = true;
      });
      print(
          "Perform the action you want to do when the user has scrolled to 70%");
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<Newest_Books_Cubit, Newest_Books_State>(
      builder: (context, state) {
        if (state is NewestBooksSuccessState) {
          return NotificationListener<ScrollNotification>(
            onNotification: (notification) => true,
            child: ListView.builder(
              controller: _scrollController,
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
