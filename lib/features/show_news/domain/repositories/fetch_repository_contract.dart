import 'package:dartz/dartz.dart';
import 'package:news_1_flutter/core/failures_successes/failures.dart';
import 'package:news_1_flutter/features/show_news/domain/entities/news_info.dart';

abstract class FetchRepositoryContract {
  Future<Either<Failure, List<NewsInfo>>> fetchNews(String? searchText);
}