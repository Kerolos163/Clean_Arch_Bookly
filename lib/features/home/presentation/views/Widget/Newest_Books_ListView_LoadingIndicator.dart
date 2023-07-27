import 'package:bookly_app/core/widget/Custom_Fading_Widget.dart';
import 'package:flutter/material.dart';

import 'Newest_BooksListViewItem_LoadingIndicator.dart';

class NewestBooksListViewLoadingIndicator extends StatelessWidget {
  const NewestBooksListViewLoadingIndicator({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomFadingWidget(
      child: ListView.builder(
        shrinkWrap: true,
        padding: EdgeInsets.zero,
        itemBuilder: (context, index) {
          return const NewestBooks_ListViewItem_LoadingIndicator();
        },
        itemCount: 15,
        physics: const NeverScrollableScrollPhysics(),
      ),
    );
  }
}

