import 'package:flutter/material.dart';

class NavigationType {
  static push(BuildContext context, String route) {
    Navigator.of(context).pushNamed(route);
  }

  static pushReplacement(BuildContext context, String route) {
    Navigator.of(context).pushReplacementNamed(route);
  }

  static popAndPush(BuildContext context, String route) {
    Navigator.of(context).popAndPushNamed(route);
  }

  static pop(BuildContext context) {
    Navigator.of(context).pop();
  }

  static pushAndRemoveAll(BuildContext context, String route) {
    Navigator.of(context).pushNamedAndRemoveUntil(
      route,
      (route) => false,
    );
  }

  static pushAndRemoveUntil(BuildContext context, String newRoute, oldRoute) {
    Navigator.of(context).pushNamedAndRemoveUntil(
      newRoute,
      ModalRoute.withName(oldRoute),
    );
  }
}
