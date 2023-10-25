
import 'package:news_1_flutter/core/constants/strings.dart';
import 'package:news_1_flutter/core/failures_successes/exceptions.dart';
import 'package:news_1_flutter/core/services/api_service.dart';
import 'package:news_1_flutter/core/services_locator.dart';
import 'package:news_1_flutter/features/show_news/data/models/news_info_model.dart';

abstract class FetchFromRemoteDS {
  Future<List<NewsInfoModel>> fetchNews(String? searchText);
}

class FetchFromRemoteDSImpl implements FetchFromRemoteDS {
  /*final ApiService apiService;
  FetchFromRemoteDSImpl({required this.apiService});*/
  final ApiService apiService = sl<ApiService>();


  @override
  Future<List<NewsInfoModel>> fetchNews(String? searchText) async{
    try {
      Map<String, dynamic> data = await apiService.getData(
        searchText != null ? Strings.apiEverything : Strings.apiTopHeadlines,
        {
          'apiKey': Strings.apiKey,
          if (searchText == null) 'country': 'us',
          if (searchText != null) 'q': searchText,
        }
      );

      List list = data['articles'];

      List<Map<String, dynamic>> mapList = [];
      for (int i = 0; i < list.length; i++) {
        Map<String, dynamic> map = list[i] as Map<String, dynamic>;
        mapList.add(map);
      }

      List<NewsInfoModel> news = [];
      for(int i = 0; i < mapList.length; i++) {
        NewsInfoModel newsInfoModel  = NewsInfoModel.fromMap(mapList[i]);
        news.add(newsInfoModel);
      }

      return news;
    } catch(e) {
      throw const FetchException(message: 'Failed to get data');
    }
  }
}

