import 'package:flutter/cupertino.dart';
import 'package:mvvm/model/user_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserViewModel with ChangeNotifier {
  Future<bool> setUser(UserModel userModel) async {
    final SharedPreferences preference = await SharedPreferences.getInstance();
    preference.setString('token', userModel.token.toString());
    return true;
  }

  Future<UserModel> getUser() async {
    final SharedPreferences getData = await SharedPreferences.getInstance();
    final String? token = getData.getString('token');
    return UserModel(token: token);
  }

  Future<bool> removeUser() async {
    final SharedPreferences deleteUser = await SharedPreferences.getInstance();
    deleteUser.remove('token');
    return true;
  }
}
