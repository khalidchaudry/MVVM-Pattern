import 'package:flutter/material.dart';
import 'package:mvvm/res/components/colors.dart';

class RoundedButton extends StatelessWidget {
  const RoundedButton(
      {Key? key,
      required this.title,
      required this.loading,
      required this.press})
      : super(key: key);
  final String title;
  final bool loading;
  final VoidCallback press;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: press,
      child: Container(
        alignment: Alignment.center,
        height: 50,
        width: double.infinity,
        decoration: BoxDecoration(
            color: AppColors.buttonColor,
            borderRadius: BorderRadius.circular(15)),
        child: loading
            ? const CircularProgressIndicator()
            : Text(
                title,
                style: const TextStyle(color: AppColors.whiteColor),
              ),
      ),
    );
  }
}
