import 'package:flutter/material.dart';
import 'package:mvvm/model/user_model.dart';
import 'package:mvvm/utils/routes/routes_name.dart';
import 'package:mvvm/utils/utils.dart';
import 'package:mvvm/view_model/user_view_model.dart';

class SplashService {
  Future<UserModel> getUserData() => UserViewModel().getUser();
  checkAuthentication(BuildContext context) async {
    getUserData().then((value) async {
      if (value.token == null || value.token == '') {
        await Future.delayed(const Duration(seconds: 3));
        Navigator.pushNamedAndRemoveUntil(
            context, RoutesName.login, (route) => false);
      } else {
        await Future.delayed(const Duration(seconds: 3));

        Navigator.pushNamedAndRemoveUntil(
            context, RoutesName.home, (route) => false);
      }
    }).onError(
        (error, stackTrace) => Utils.showSnackBar(error.toString(), context));
  }
}
