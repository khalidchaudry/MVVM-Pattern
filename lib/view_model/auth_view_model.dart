import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:mvvm/repository/auth_repository.dart';
import 'package:mvvm/utils/utils.dart';

import '../utils/routes/routes_name.dart';

class AuthViewModel with ChangeNotifier {
  bool loading = false;
  setLoading(bool value) {
    loading = value;
    notifyListeners();
  }

  final myRepo = AuthRepository();
  Future loginApi(
      {required dynamic data, required BuildContext context}) async {
    setLoading(true);
    myRepo.loginApi(data).then((value) {
      setLoading(false);
      Utils.flushBarErrorMessage(
          value.toString(), context, 'Login Successfully!');
    }).onError((error, stackTrace) {
      setLoading(false);
      if (kDebugMode) {
        Utils.flushBarErrorMessage(
            error.toString(), context, 'Something went wrong');
      }
    });
  }

  Future signUpApi({required dynamic data, required dynamic context}) async {
    setLoading(true);

    myRepo.signUpApi(data).then((value) {
      setLoading(false);
      Navigator.pushNamed(context, RoutesName.home);
      Utils.flushBarErrorMessage(
          value.toString(), context, 'Registered successfully!');
    }).onError((error, stackTrace) {
      setLoading(false);
      Utils.flushBarErrorMessage(error.toString(), context, 'Something wrong');
    });
  }
}
