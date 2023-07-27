import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../../../core/utils/assets.dart';
import '../../../../../core/utils/styles.dart';
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

  @override
  void initState() {
    _scrollController.addListener(_onScroll);
    super.initState();
  }

  void _onScroll() {
    final double currentPosition = _scrollController.position.pixels;
    final double maxExtent = _scrollController.position.maxScrollExtent;
    final double percentage = currentPosition / maxExtent;
    if (percentage >= 0.7) {
      // user has reached 70% of the CustomScrollView
      print('User has reached 70%');
    }
  }

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      controller: _scrollController,
      physics: const BouncingScrollPhysics(),
      slivers: [
        SliverToBoxAdapter(
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
            ],
          ),
        ),
        const SliverFillRemaining(
          child: BestSellerListView(),
        ),
      ],
    );
  }
}
