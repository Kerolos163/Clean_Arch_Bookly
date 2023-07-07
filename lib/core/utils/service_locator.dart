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
    getIt.get<ApiService>(),
  ));

  getIt.registerSingleton<searchrepoImp>(searchrepoImp(
    api: getIt.get<ApiService>(),
  ));
}
