
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../../../core/utils/styles.dart';
import '../../../../home/Data/models/book_model/book_model.dart';
import '../../../../home/presentation/views/Widget/best_seller_List_Item.dart';
import '../view_model/Search_cubit/cubit.dart';
import '../view_model/Search_cubit/state.dart';
import 'Custom_Search_textFeild.dart';

class Search_View_Bpdy extends StatelessWidget {
  const Search_View_Bpdy({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SearchCubit, SearchState>(
      builder: (context, state) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 30,
            ),
            Custom_Search_TextField(context),
            const SizedBox(
              height: 20,
            ),
            const Padding(
              padding: EdgeInsets.only(left: 30),
              child: Text("Result", style: Styles.textStyle18),
            ),
            const SizedBox(
              height: 20,
            ),
            if(state is SearchLoadingstate)
            const LinearProgressIndicator(),
            if (state is SearchSuccessstate)
              Expanded(child: Search_ListView(SearchCubit.get(context).SearchList))
          ],
        );
      },
    );
  }

  Search_ListView(List<BookModel> book ) {
    return ListView.builder(
      shrinkWrap: true,
      padding: EdgeInsets.zero,
      itemBuilder: (context, index) {
        return  Padding(
          padding:const EdgeInsets.symmetric(vertical: 10),
          child: BookListViewItem(context,book[index]),
        );
      },
      itemCount: book.length,
      physics: const BouncingScrollPhysics(),
    );
  }
}
