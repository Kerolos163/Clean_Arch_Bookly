
import 'package:bookly_app/features/home/presentation/views/Widget/similar_books_listView.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../Data/models/book_model/book_model.dart';
import '../../view_models/URL_cubit/cubit.dart';
import 'Book_Details_Section.dart';
import 'Book_rating.dart';
import 'Books_Action.dart';
import 'best_seller_List_Item.dart';
import 'custom_BooK_Image_item.dart';
import 'custom_Book_Details_AppBar.dart';

class BookDetailsViewBody extends StatelessWidget {
  const BookDetailsViewBody({super.key, required this.bookmodel});
  final BookModel bookmodel;
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => URLCubit(),
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(left: 20),
          child: Column(
            children: [
              BookDetailsSection(context, bookmodel),
              const SizedBox(height: 16),
              // SimilarBooksListview(context),
              const SizedBox(height: 40),
            ],
          ),
        ),
      ),
    );
  }
}
