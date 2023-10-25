
import 'package:dartz/dartz.dart';
import 'package:news_1_flutter/core/failures_successes/exceptions.dart';
import 'package:news_1_flutter/core/failures_successes/failures.dart';
import 'package:news_1_flutter/core/services_locator.dart';
import 'package:news_1_flutter/features/show_news/data/datasources/fetch_from_remote_ds.dart';
import 'package:news_1_flutter/features/show_news/domain/entities/news_info.dart';
import 'package:news_1_flutter/features/show_news/domain/repositories/fetch_repository_contract.dart';

class FetchRepoImpl implements FetchRepositoryContract {
  /*final FetchFromRemoteDS fetchFromRemoteDS;
  const FetchRepoImpl({required this.fetchFromRemoteDS});*/
  final FetchFromRemoteDS fetchFromRemoteDS = sl<FetchFromRemoteDS>();
  @override
  Future<Either<Failure, List<NewsInfo>>> fetchNews(String? searchText) async{
    try {
      return Right(await fetchFromRemoteDS.fetchNews(searchText));
    } on FetchException catch(e) {
      return Left(FetchFailure(message: e.message));
    }
  }
}