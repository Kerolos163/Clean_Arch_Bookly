import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';


import '../view_model/Search_cubit/cubit.dart';

Custom_Search_TextField(context) {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 25),
    child: TextField(
      onChanged: (value) {
        if (value.isNotEmpty) {
          SearchCubit.get(context).SearchFeachedBooks(txt: value);
        } else {
          SearchCubit.get(context).SearchFeachedBooks();
        }
      },
      decoration: InputDecoration(
          hintText: "Search",
          suffixIcon: IconButton(
            onPressed: () {},
            icon: const Opacity(
              opacity: .8,
              child: Icon(
                FontAwesomeIcons.magnifyingGlass,
                size: 22,
                color: Colors.grey,
              ),
            ),
          ),
          enabledBorder: Outline_Input_Border(),
          focusedBorder: Outline_Input_Border()),
    ),
  );
}

Outline_Input_Border() {
  return OutlineInputBorder(
      borderRadius: BorderRadius.circular(12),
      borderSide: const BorderSide(color: Colors.grey));
}
