import 'package:bookly_app/features/home/Domain/Entities/Book_Entity.dart';
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

BookListViewItem(context, BookEntity Book) {
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
                    Book.image?? KimagetoNullImage),
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
                        Book.title,
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
                    Book.authorName?? "No Name",
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
                          Rating: Book.rating?? 0  ,
                          Count: 0)
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
