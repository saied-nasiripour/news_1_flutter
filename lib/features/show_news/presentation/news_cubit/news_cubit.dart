import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:meta/meta.dart';
import 'package:news_1_flutter/core/failures_successes/failures.dart';
import 'package:news_1_flutter/core/services_locator.dart';
import 'package:news_1_flutter/features/show_news/domain/entities/news_info.dart';
import 'package:news_1_flutter/features/show_news/domain/usecases/fetch_news_usecase.dart';

part 'news_state.dart';

class NewsCubit extends Cubit<NewsState> {
  NewsCubit() : super(NewsInitial(news: const []));
  final FetchNewsUsecase _fetchNewsUsecase = sl<FetchNewsUsecase>();

  void fetchNews(String? searchText) async {
    emit(NewsLoading());
    final Either<Failure, List<NewsInfo>> fetchNewsResult = await _fetchNewsUsecase.fetchNews(searchText);
    fetchNewsResult.fold(
      (l) {
        emit(NewsError());
      },
      (r) {
        // r == news
        if (searchText != null) {
          emit(NewsInitialSearch(news: r));
        } else {
          emit(NewsInitial(news: r));
        }
      },
    );
  }
}
