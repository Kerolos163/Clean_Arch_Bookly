import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../../../core/utils/assets.dart';
import '../../../../../core/utils/styles.dart';
import 'BestSellerListView.dart';
import 'List_view.dart';
import 'best_seller_List_Item.dart';
import 'customappbar.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics:const BouncingScrollPhysics(),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomAppBar(context),
          BooklyListView(context),
          const SizedBox(
            height: 50,
          ),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 30),
            child: Text("Newest Books", style: Styles.textStyle18),
          ),
          const SizedBox(
            height: 10,
          ),
          BestSellerListView()
        ],
      ),
    );
  }
}
