

import 'package:bookly_app/core/utils/service_locator.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../features/home/Data/models/book_model/book_model.dart';
import '../../features/home/Data/repos/home_repo_impl.dart';
import '../../features/home/presentation/view_models/Similar_Books_Cubit/cubit.dart';
import '../../features/home/presentation/views/Book_Details_View.dart';
import '../../features/home/presentation/views/home.dart';
import '../../features/search/Data/search_repoimp.dart';
import '../../features/search/presentation/views/Search_view.dart';
import '../../features/search/presentation/views/view_model/Search_cubit/cubit.dart';
import '../../features/splash/presentation/Views/splash_view.dart';

abstract class AppRouter {
  static const Khomeview = '/homeview';
  static const Kbookdetailsview = '/bookdetailsview';
  static const KSearchView = '/searchview';
  static final router = GoRouter(
    routes: [
      GoRoute(
        path: '/',
        builder: (context, state) => const SplashView(),
      ),
      GoRoute(
        path: Khomeview,
        builder: (context, state) => const homeview(),
      ),
      // GoRoute(
      //   path: Kbookdetailsview,
      //   builder: (context, state) => BlocProvider(
      //     create: (context) => Similar_Books_Cubit(getIt.get<HomeRepoImpl>()),
      //     child: BookViewDetails(bookModel: state.extra as BookModel),
      //   ),
      // ),
      GoRoute(
        path: KSearchView,
        builder: (context, state) => BlocProvider(
          create: (context) =>
              SearchCubit(getIt.get<searchrepoImp>())..FetchBooks(),
          child:const SearchView(),
        ),
      ),
    ],
  );
}
