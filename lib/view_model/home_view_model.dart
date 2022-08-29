import 'package:flutter/cupertino.dart';
import 'package:mvvm/data/response/api_response.dart';
import 'package:mvvm/model/movie_list_model.dart';
import 'package:mvvm/repository/home_repository.dart';

class HomeViewModel with ChangeNotifier {
  final myHomeRepo = HomeRepository();
  APIResponse<MovieListModel> movieList = APIResponse.loading();
  movieListData(APIResponse<MovieListModel> response) {
    movieList = response;
    notifyListeners();
  }

  Future movieErrorMessage(BuildContext context) async {
    movieListData(APIResponse.loading());
    await myHomeRepo.movieApi().then((value) {
      movieListData(APIResponse.completed());
    }).onError((error, stackTrace) {
      movieListData(APIResponse.error());
    });
  }
}
