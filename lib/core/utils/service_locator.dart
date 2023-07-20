import 'package:bookly_app/features/home/Data/data_sources/home_local_data_source.dart';
import 'package:bookly_app/features/home/Data/data_sources/home_remote_data_source.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

import '../../features/home/Data/repos/home_repo_impl.dart';
import '../../features/search/Data/search_repoimp.dart';
import 'api_service.dart';

final getIt = GetIt.instance;
void SetupServiceLocator() {
  getIt.registerSingleton<ApiService>(ApiService(
    Dio(),
  ));

  getIt.registerSingleton<HomeRepoImpl>(HomeRepoImpl(
      homeremotedatasourse: HomeRemoteDataSourseImp(getIt.get<ApiService>()),
      homelocaldatasourse: HomeLocalDataSourseImp()));

  getIt.registerSingleton<searchrepoImp>(searchrepoImp(
    api: getIt.get<ApiService>(),
  ));
}
