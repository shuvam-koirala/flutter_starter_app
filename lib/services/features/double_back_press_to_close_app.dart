
import 'dart:io';

import 'package:starter_project/export_packages.dart';

class DoubleBackPressToCloseApp extends StatefulWidget {
   const DoubleBackPressToCloseApp({Key? key,required Widget child}) : _child=child,super(key: key);
  final Widget _child;

  @override
  State<DoubleBackPressToCloseApp> createState() => _DoubleBackPressToCloseAppState();
}

class _DoubleBackPressToCloseAppState extends State<DoubleBackPressToCloseApp> {
  DateTime? currentBackPressTime;

  Future<bool> onWillPop() {
    DateTime now = DateTime.now();
    if (currentBackPressTime == null || 
        now.difference(currentBackPressTime!) > const Duration(seconds: 2)) {
      currentBackPressTime = now;
      Fluttertoast.showToast(msg: "Press again to exit.");
      return Future.value(false);
    }
    exit(0);
    // return Future.value(true);
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(onWillPop: onWillPop, child: widget._child,);
  }
}