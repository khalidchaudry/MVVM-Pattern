import 'package:another_flushbar/flushbar.dart';
import 'package:another_flushbar/flushbar_route.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class Utils {
  static toastMessage(String msg) {
    Fluttertoast.showToast(
      
      msg: msg, backgroundColor: Colors.red);
  }

  static flushBarErrorMessage(
      String errorMessage, BuildContext context, String title) {
    showFlushbar(
        context: context,
        flushbar: Flushbar(
          title: title,
          message: errorMessage,
          duration: const Duration(seconds: 3),
          backgroundColor: Colors.purple,
        )..show(context));
  }

  static showSnackBar(String message, BuildContext context) {
    return ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text(message),
    ));
  }

  static focusNodeField(
      {required BuildContext context,
      required FocusNode current,
      required FocusNode nextFocus}) {
    current.unfocus();
    FocusScope.of(context).requestFocus(nextFocus);
  }
}
