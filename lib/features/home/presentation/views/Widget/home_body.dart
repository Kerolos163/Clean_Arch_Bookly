import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../../../core/utils/assets.dart';
import '../../../../../core/utils/styles.dart';

import '../../view_models/Newest_Books_Cubit/cubit.dart';
import 'BestSellerListView.dart';
import 'List_view.dart';
import 'best_seller_List_Item.dart';
import 'customappbar.dart';

class HomeViewBody extends StatefulWidget {
  const HomeViewBody({Key? key});

  @override
  State<HomeViewBody> createState() => _HomeViewBodyState();
}

class _HomeViewBodyState extends State<HomeViewBody> {
  final _scrollController = ScrollController();
  int nextPage = 0;
  bool isLoading = false;
  @override
  void initState() {
    _scrollController.addListener(_onScroll);
    super.initState();
  }

  void _onScroll() async {
    final double currentPosition = _scrollController.position.pixels;
    final double maxExtent = _scrollController.position.maxScrollExtent;
    final double percentage = currentPosition / maxExtent;
    if (percentage >= 0.7) {
      if (!isLoading) {
        isLoading = true;
        await Newest_Books_Cubit.get(context)
            .FetchNewestBooks(pagenumber: nextPage++);
        isLoading = false;
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      controller: _scrollController,
      physics: const BouncingScrollPhysics(),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const CustomAppBar(),
          BooklyListView(),
          const SizedBox(
            height: 50,
          ),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 30),
            child: Text("Newest Books", style: Styles.textStyle18),
          ),
          const SizedBox(
            height: 20,
          ),
          const BestSellerListView()
        ],
      ),
    );
  }
}
