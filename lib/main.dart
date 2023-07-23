import 'package:bookly_app/core/utils/Simple_Bloc_Observer.dart';
import 'package:bookly_app/core/utils/api_service.dart';
import 'package:bookly_app/features/home/Data/data_sources/home_local_data_source.dart';
import 'package:bookly_app/features/home/Data/data_sources/home_remote_data_source.dart';
import 'package:bookly_app/features/home/Domain/Entities/Book_Entity.dart';
import 'package:bookly_app/features/home/Domain/use_case/fetch_Feature_Books_Use_Case.dart';
import 'package:bookly_app/features/home/Domain/use_case/fetch_Newest_Books_Use_Case.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hive_flutter/adapters.dart';

import 'constants.dart';
import 'core/utils/app_router.dart';
import 'core/utils/service_locator.dart';
import 'features/home/Data/repos/home_repo_impl.dart';
import 'features/home/presentation/view_models/Feature_Books_Cubit/cubit.dart';
import 'features/home/presentation/view_models/Newest_Books_Cubit/cubit.dart';
import 'features/search/Data/search_repoimp.dart';
import 'features/search/presentation/views/view_model/Search_cubit/cubit.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SetupServiceLocator();
  await Hive.initFlutter();
  Hive.registerAdapter(BookEntityAdapter());
  await Hive.openBox<BookEntity>(kFeatureBox);
  await Hive.openBox<BookEntity>(kNewestBox);
  Bloc.observer = simpleblocobserver();
  runApp(const Bookly());
}

class Bookly extends StatelessWidget {
  const Bookly({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => Feature_Books_Cubit(
            FetchFeatureBooksUseCase(getIt.get<HomeRepoImpl>()),
          )..FetchFeatureBooks(),
        ),
        BlocProvider(
          create: (context) => Newest_Books_Cubit(
            FetchNewestBooksUseCase(getIt.get<HomeRepoImpl>()),
          )..FetchNewestBooks(),
        ),
      ],
      child: MaterialApp.router(
        routerConfig: AppRouter.router,
        debugShowCheckedModeBanner: false,
        theme: ThemeData.dark().copyWith(
            scaffoldBackgroundColor: Kprimarycolor,
            textTheme:
                GoogleFonts.montserratTextTheme(ThemeData.dark().textTheme)),
      ),
    );
  }
}
