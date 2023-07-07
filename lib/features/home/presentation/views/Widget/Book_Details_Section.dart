import 'package:flutter/material.dart';

import '../../../../../constants.dart';
import '../../../../../core/utils/styles.dart';
import '../../../Data/models/book_model/book_model.dart';
import 'Book_rating.dart';
import 'Books_Action.dart';
import 'custom_BooK_Image_item.dart';
import 'custom_Book_Details_AppBar.dart';

BookDetailsSection(context, BookModel bookmodel) {
  var width = MediaQuery.of(context).size.width;
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 10),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        customBookDetailsAppBar(context),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: width * .18),
          child: CustomBookImage(context,
              img: bookmodel.volumeInfo.imageLinks?.thumbnail ??
                  KimagetoNullImage),
        ),
        const SizedBox(
          height: 40,
        ),
        Text(
          bookmodel.volumeInfo.title!,
          style: Styles.textStyle30.copyWith(fontWeight: FontWeight.bold),
          textAlign: TextAlign.center,
        ),
        const SizedBox(
          height: 6,
        ),
        Opacity(
          opacity: .7,
          child: Text(
            bookmodel.volumeInfo.authors?[0] ?? " ",
            style: Styles.textStyle18.copyWith(
                fontStyle: FontStyle.italic, fontWeight: FontWeight.w500),
          ),
        ),
        const SizedBox(
          height: 14,
        ),
        BookRating(
            MAA: MainAxisAlignment.center,
            Count: bookmodel.volumeInfo.ratingsCount ?? 0,
            Rating: bookmodel.volumeInfo.ratingsCount ?? 0),
        const SizedBox(
          height: 37,
        ),
        BookAction(bookmodel),
        const SizedBox(height: 50),
        Align(
            alignment: Alignment.centerLeft,
            child: Text(
              "You can also like",
              textAlign: TextAlign.start,
              style: Styles.textStyle14.copyWith(fontWeight: FontWeight.w600),
            )),
      ],
    ),
  );
}
