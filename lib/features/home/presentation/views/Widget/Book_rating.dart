import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../../../core/utils/styles.dart';

BookRating(
    {MAA = MainAxisAlignment.start, required num Rating, required num Count}) {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 40),
    child: Row(
      mainAxisAlignment: MAA,
      children: [
        const Icon(
          FontAwesomeIcons.solidStar,
          size: 14,
          color: Color(0xffFFDD4F),
        ),
        const SizedBox(
          width: 6,
        ),
        Text(
          "$Rating",
          style: Styles.textStyle16,
        ),
        const SizedBox(
          width: 9,
        ),
        Opacity(
          opacity: .5,
          child: Text(
            "$Count",
            style: Styles.textStyle14.copyWith(fontWeight: FontWeight.w600),
          ),
        ),
      ],
    ),
  );
}
