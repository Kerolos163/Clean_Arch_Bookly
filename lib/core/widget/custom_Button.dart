import 'package:flutter/material.dart';

import '../utils/styles.dart';

Widget Custom_Button(
    {required BackgroundColor, required TextColor, BorderRadius,required String txt,double? fontsize,required Function onPressed}) {
  return SizedBox(
    height: 48,
    child: TextButton(
      onPressed: () => onPressed(),
      style: TextButton.styleFrom(
          shape: RoundedRectangleBorder(
              borderRadius:BorderRadius),
          backgroundColor: BackgroundColor),
      child: Text(
        txt,
        style: Styles.textStyle18.copyWith(
          color: TextColor,
          fontWeight: FontWeight.w900,
          fontSize: fontsize
        ),
      ),
    ),
  );
}
