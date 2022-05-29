import 'package:starter_project/routes/app_routes.dart';
import 'package:starter_project/routes/navigaton_type.dart';

import '../../export_packages.dart';


class OnBoardingScreen extends StatelessWidget {
  const OnBoardingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LayoutBuilder(
        builder: (context, constraints) => Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text("Starter Pack"),
              ElevatedButton(onPressed: ()=>NavigationType.pushReplacement(context, AppRoutes.loginScreen), child: const Text("Login")),
              ElevatedButton(onPressed: ()=>NavigationType.pushReplacement(context, AppRoutes.signupScreen), child: const Text("Signup")),
            ],
          ),
        ),
      ),
    );
  }
}
