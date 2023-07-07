
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../../../../core/widget/custom_Button.dart';
import '../../../Data/models/book_model/book_model.dart';
import '../../view_models/URL_cubit/cubit.dart';
import '../../view_models/URL_cubit/state.dart';

Widget BookAction(BookModel Book) {
  return BlocBuilder<URLCubit, URL_State>(
    builder: (context, state) {
      return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8),
        child: Row(
          children: [
            Expanded(
              child: Custom_Button(
                  txt: "FREE",
                  BackgroundColor: Colors.white,
                  TextColor: Colors.black,
                  BorderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(16),
                      bottomLeft: Radius.circular(16)),
                  onPressed: () {
                    print("FREE");
                  }),
            ),
            if (state is URLLoadingState)
              const Center(child: CircularProgressIndicator())
            else
              Expanded(
                child: Custom_Button(
                    txt: get_text(Book),
                    fontsize: 16,
                    BackgroundColor: const Color(0xffEF8262),
                    TextColor: Colors.white,
                    BorderRadius: const BorderRadius.only(
                        topRight: Radius.circular(16),
                        bottomRight: Radius.circular(16)),
                    onPressed: () async {
                      if (Book.volumeInfo.previewLink != null) {
                        final Uri url = Uri.parse(Book.volumeInfo.previewLink!);
                        URLCubit.get(context).got_TO_URL(
                          context,
                          url: url,
                        );
                      }
                    }),
              ),
          ],
        ),
      );
    },
  );
}

String get_text(BookModel book) {
  if (book.volumeInfo.previewLink == null) {
    return "Not Avaliable";
  } else {
    return "Preview";
  }
}
