import 'package:bookly_app/features/home/Domain/Entities/Book_Entity.dart';
import 'package:bookly_app/features/home/presentation/views/Widget/Feature_Books_ListView_LoadingIndicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../../../constants.dart';
import '../../../../../core/utils/app_router.dart';
import '../../../../../core/utils/functions/build_error_snakebar.dart';
import '../../../../../core/widget/Custom_error_widget.dart';
import '../../../../../core/widget/custom_Loading_Indicator.dart';
import '../../view_models/Feature_Books_Cubit/cubit.dart';
import '../../view_models/Feature_Books_Cubit/state.dart';
import 'custom_BooK_Image_item.dart';

class BooklyListView extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _MyListViewState();
}

class _MyListViewState extends State<BooklyListView> {
  late ScrollController _scrollController;
  var NextPage = 1;
  bool isLoading = false;
  List<BookEntity> books = [];
  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
    _scrollController.addListener(_scrollListener);
  }

  @override
  void dispose() {
    _scrollController.removeListener(_scrollListener);
    _scrollController.dispose();
    super.dispose();
  }

  void _scrollListener() async {
    final double scrollPosition = _scrollController.position.pixels;
    final double maxScrollExtent = _scrollController.position.maxScrollExtent;
    final double threshold = maxScrollExtent * 0.7;

    if (scrollPosition >= threshold) {
      if (!isLoading) {
        isLoading = true;
        await Feature_Books_Cubit.get(context)
            .FetchFeatureBooks(pagenumber: NextPage++);
        isLoading = false;
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<Feature_Books_Cubit, Feature_Books_State>(
      listener: (context, state) {
        if (state is FeatureBooksSuccessState) {
          books.addAll(state.Books);
        } else if (state is FeatureBooksPaginationFailureState) {
          ScaffoldMessenger.of(context).showSnackBar(
            Custom_Error_Widget(state.error),
          );
        }
      },
      builder: (context, state) {
        if (state is FeatureBooksSuccessState ||
            state is FeatureBooksPaginationLoadingState ||
            state is FeatureBooksPaginationFailureState) {
          return Padding(
            padding: const EdgeInsets.only(left: 15),
            child: SizedBox(
              height: MediaQuery.of(context).size.height * .25,
              child: ListView.builder(
                controller: _scrollController, // Add the scroll controller here
                itemBuilder: (context, index) {
                  return InkWell(
                    onTap: () {
                      GoRouter.of(context).push(
                        AppRouter.Kbookdetailsview,
                        extra: books,
                      );
                    },
                    child: Padding(
                      padding: const EdgeInsets.only(left: 15),
                      child: CustomBookImage(context,
                          img: books[index].image ?? KimagetoNullImage),
                    ),
                  );
                },
                itemCount: books.length,
                scrollDirection: Axis.horizontal,
                physics: const BouncingScrollPhysics(),
              ),
            ),
          );
        } else if (state is FeatureBooksFailureState) {
          return Error_Widget(Message: state.error);
        } else {
          return CustomLoadingIndicator();
        }
      },
    );
  }
}
