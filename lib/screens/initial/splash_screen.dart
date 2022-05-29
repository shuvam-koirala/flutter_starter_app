import 'package:flutter/material.dart';
import 'package:starter_project/routes/app_routes.dart';
import 'package:starter_project/routes/navigaton_type.dart';
import 'package:starter_project/utils/app_colors.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    startTimer();
    super.initState();
  }

  void startTimer() async {
    await Future.delayed(const Duration(seconds: 3)).then((value) =>
        NavigationType.pushReplacement(context, AppRoutes.onBoardingScreen));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: white,
      body: LayoutBuilder(
        builder: ((context, constraints) => const Center(
              child: Text("Flutter Starter Project"),
            )),
      ),
    );
  }
}
