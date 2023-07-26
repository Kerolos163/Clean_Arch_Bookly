import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

import '../../../../../core/widget/Custom_Fading_Widget.dart';
import 'custom_BooK_Image_item.dart';

class FeatureBooksListViewLoadingIndicator extends StatelessWidget {
  const FeatureBooksListViewLoadingIndicator({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomFadingWidget(
      child: Padding(
        padding: const EdgeInsets.only(left: 15),
        child: SizedBox(
          height: MediaQuery.of(context).size.height * .25,
          child: ListView.builder(
            itemBuilder: (context, index) {
              return AspectRatio(
                aspectRatio: 2.6 / 4,
                child: Padding(
                  padding: const EdgeInsets.only(left: 15),
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16),
                      color: Colors.grey[100],
                    ),
                  ),
                ),
              );
            },
            itemCount: 15,
            scrollDirection: Axis.horizontal,
            physics: const BouncingScrollPhysics(),
          ),
        ),
      ),
    );
  }
}
