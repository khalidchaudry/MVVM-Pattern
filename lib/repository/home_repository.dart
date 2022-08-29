import 'package:mvvm/data/app_exceptions.dart';
import 'package:mvvm/data/network/network_api_service.dart';
import 'package:mvvm/model/movie_list_model.dart';

import '../res/app_url.dart';
import '../utils/utils.dart';

class HomeRepository {
  var homeServices = NetworkApiService();

  Future<MovieListModel> movieApi() async {
    try {
      dynamic response =
          await homeServices.getGetApiResponse(AppUrl.movieListEndPoint);
      return response = MovieListModel.fromJson(response);
    } catch (e) {
      Utils.toastMessage(e.toString());
      throw FetchDataException(e.toString());
    }
  }
}
