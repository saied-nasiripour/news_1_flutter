import 'package:get_it/get_it.dart';
import 'package:news_1_flutter/core/services/api_service.dart';
import 'package:news_1_flutter/features/show_news/data/datasources/fetch_from_remote_ds.dart';
import 'package:news_1_flutter/features/show_news/data/repositories/fetch_repo_impl.dart';
import 'package:news_1_flutter/features/show_news/domain/repositories/fetch_repository_contract.dart';
import 'package:news_1_flutter/features/show_news/domain/usecases/fetch_news_usecase.dart';

final GetIt sl = GetIt.instance;
void setUpServices() {
  sl.registerSingleton<ApiService>(ApiServiceImpl());
  sl.registerSingleton<FetchFromRemoteDS>(FetchFromRemoteDSImpl());
  sl.registerSingleton<FetchRepositoryContract>(FetchRepoImpl());
  sl.registerSingleton<FetchNewsUsecase>(FetchNewsUsecase());
}
