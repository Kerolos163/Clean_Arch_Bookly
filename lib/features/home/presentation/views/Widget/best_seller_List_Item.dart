import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';

import '../../../../../constants.dart';
import '../../../../../core/utils/app_router.dart';
import '../../../../../core/utils/assets.dart';
import '../../../../../core/utils/styles.dart';
import '../../../Data/models/book_model/book_model.dart';
import 'Book_rating.dart';
import 'custom_BooK_Image_item.dart';

BookListViewItem(context, BookModel Book) {
  return InkWell(
    onTap: () {
      GoRouter.of(context).push(AppRouter.Kbookdetailsview,extra: Book);
    },
    child: Padding(
      padding: const EdgeInsets.only(left: 30),
      child: SizedBox(
        height: 130,
        child: Row(
          children: [
            CustomBookImage(context,
                img:
                    Book.volumeInfo.imageLinks?.thumbnail ?? KimagetoNullImage),
            const SizedBox(
              width: 30,
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                      width: MediaQuery.of(context).size.width * .5,
                      child: Text(
                        Book.volumeInfo.title!,
                        style: Styles.textStyle20.copyWith(
                          fontFamily: KGTSectraFine,
                        ),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      )),
                  const SizedBox(
                    height: 2,
                  ),
                  Text(
                    Book.volumeInfo.authors![0],
                    style: Styles.textStyle14,
                  ),
                  const SizedBox(
                    height: 2,
                  ),
                  Row(
                    children: [
                      Text("FREE",
                          style: Styles.textStyle20
                              .copyWith(fontWeight: FontWeight.bold)),
                      const Spacer(),
                      BookRating(
                          Rating: Book.volumeInfo.averageRating ?? 0,
                          Count: Book.volumeInfo.ratingsCount ?? 0)
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      ),
    ),
  );
}
