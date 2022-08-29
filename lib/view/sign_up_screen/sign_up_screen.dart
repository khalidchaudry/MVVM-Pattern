import 'package:flutter/material.dart';
import 'package:mvvm/res/components/rounded_button.dart';
import 'package:mvvm/utils/routes/routes_name.dart';
import 'package:mvvm/utils/utils.dart';
import 'package:mvvm/view_model/auth_view_model.dart';
import 'package:provider/provider.dart';

class SignUpScreen extends StatelessWidget {
  // LoginScreen({Key? key}) : super(key: key);
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final authViewModel = Provider.of<AuthViewModel>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text('SignUp'),
        centerTitle: true,
      ),
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextFormField(
              textInputAction: TextInputAction.next,
              controller: emailController,
              keyboardType: TextInputType.emailAddress,
              decoration: const InputDecoration(
                fillColor: Colors.white,
                border: InputBorder.none,
                filled: true,
                hintText: 'Email',
                prefixIcon: Icon(Icons.alternate_email_outlined),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            TextFormField(
              controller: passwordController,
              textInputAction: TextInputAction.done,
              keyboardType: TextInputType.emailAddress,
              decoration: const InputDecoration(
                border: InputBorder.none,
                fillColor: Colors.white,
                filled: true,
                hintText: 'Password',
                prefixIcon: Icon(Icons.key),
              ),
            ),
            const SizedBox(
              height: 40,
            ),
            RoundedButton(
                title: 'SignUp'.toUpperCase(),
                loading: authViewModel.loading,
                press: () {
                  if (emailController.text.isEmpty) {
                    Utils.flushBarErrorMessage('Please enter Email', context,
                        'Fill the required Field');
                  } else if (passwordController.text.isEmpty) {
                    Utils.flushBarErrorMessage('Please enter Password', context,
                        'Fill the required Field');
                  } else if (passwordController.text.length < 8) {
                    Utils.flushBarErrorMessage('Please enter 8 digits password',
                        context, 'Write a strong password');
                  } else {
                    Map data = {
                      'email': emailController.text.toString(),
                      'password': passwordController.text.toString()
                    };
                    authViewModel.signUpApi(data: data, context: context);
                    debugPrint('API hit');
                  }
                }),
            const SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                const Text("Already have an account?"),
                TextButton(
                    onPressed: () =>
                        Navigator.pushNamed(context, RoutesName.login),
                    child: const Text('Login'))
              ],
            )
          ],
        ),
      )),
    );
  }
}
