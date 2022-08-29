import 'package:flutter/material.dart';
import 'package:mvvm/view/splash_screen/splash_service.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    SplashService().checkAuthentication(context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
        body: Center(
      child: Text(
        'Splash Screen',
        style: TextStyle(
            fontSize: 25, fontWeight: FontWeight.bold, color: Colors.purple),
      ),
    ));
  }
}
