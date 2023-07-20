
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

import '../../Data/models/book_model/book_model.dart';
import '../view_models/Similar_Books_Cubit/cubit.dart';
import 'Widget/bookDetails_ViewBody.dart';

class BookViewDetails extends StatefulWidget {
  const BookViewDetails({super.key, required this.bookModel});
  final BookModel bookModel;
  @override
  State<BookViewDetails> createState() => _BookViewDetailsState();
}

class _BookViewDetailsState extends State<BookViewDetails> {
  @override
  void initState() {
    // Similar_Books_Cubit.get(context).FetchSimilarBooks(
    //     Category: widget.bookModel.volumeInfo.categories![0]);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: BookDetailsViewBody(
          bookmodel: widget.bookModel,
        ),
      ),
    );
  }
}
