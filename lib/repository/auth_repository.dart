import 'package:mvvm/data/network/network_api_service.dart';
import 'package:mvvm/res/app_url.dart';
import 'package:mvvm/utils/utils.dart';

class AuthRepository {
  final apiServices = NetworkApiService();
  Future<dynamic> loginApi(dynamic data) async {
    try {
      dynamic response = await apiServices.getPostApiResponse(
          'https://reqres.in/api/login', data);
      return response;
    } catch (e) {
      Utils.toastMessage(e.toString());
    }
  }

  Future<dynamic> signUpApi(dynamic data) async {
    try {
      dynamic response = await apiServices.getPostApiResponse(
          'https://reqres.in/api/register', data);
      return response;
    } catch (e) {
      Utils.toastMessage(e.toString());
    }
  }

}
