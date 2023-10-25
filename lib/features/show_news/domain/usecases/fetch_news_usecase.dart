import 'package:news_1_flutter/core/failures_successes/failures.dart';
import 'package:news_1_flutter/core/services_locator.dart';
import 'package:news_1_flutter/features/show_news/domain/entities/news_info.dart';
import 'package:dartz/dartz.dart';
import 'package:news_1_flutter/features/show_news/domain/repositories/fetch_repository_contract.dart';

class FetchNewsUsecase {

  /*final FetchRepositoryContract fetchContractRepository;
  FetchNewsUsecase({required this.fetchContractRepository});*/
  final FetchRepositoryContract fetchContractRepository = sl<FetchRepositoryContract>();
  Future<Either<Failure, List<NewsInfo>>> fetchNews(String? searchText) {
    return fetchContractRepository.fetchNews(searchText);
  }
}