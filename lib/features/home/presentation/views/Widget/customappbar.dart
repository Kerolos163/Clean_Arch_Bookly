import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';

import '../../../../../core/utils/app_router.dart';
import '../../../../../core/utils/assets.dart';

Widget CustomAppBar(context) {
  return Padding(
    padding: const EdgeInsets.only(left: 30, right: 10, top: 50, bottom: 15),
    child: Row(
      children: [
        Image.asset(AssetData.logo, height: 20),
        const Spacer(),
        IconButton(
          onPressed: () {
            GoRouter.of(context).push(AppRouter.KSearchView);
          },
          icon: const Icon(FontAwesomeIcons.magnifyingGlass,size: 22,),
        )
      ],
    ),
  );
}
