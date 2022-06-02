import 'package:flutter/material.dart';

class NavigationType {
  static push({required BuildContext context, required String route}) {
    Navigator.of(context).pushNamed(route);
  }

  static pushReplacement({required BuildContext context, required String route}) {
    Navigator.of(context).pushReplacementNamed(route);
  }

  static popAndPush({required BuildContext context, required String route}) {
    Navigator.of(context).popAndPushNamed(route);
  }

  static pop(BuildContext context) {
    Navigator.of(context).pop();
  }

  static pushAndRemoveAll({required BuildContext context, required String route}) {
    Navigator.of(context).pushNamedAndRemoveUntil(
      route,
      (route) => false,
    );
  }

  static pushAndRemoveUntil({required BuildContext context, required String newRoute, oldRoute}) {
    Navigator.of(context).pushNamedAndRemoveUntil(
      newRoute,
      ModalRoute.withName(oldRoute),
    );
  }
}
