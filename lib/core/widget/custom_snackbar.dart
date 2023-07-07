  import 'package:flutter/material.dart';

void customsnackbar(context, txt) {
    ScaffoldMessenger.of(context)
        .showSnackBar(SnackBar(content: Text(txt)));
  }