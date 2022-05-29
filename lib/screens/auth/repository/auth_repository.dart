import 'package:flutter/foundation.dart';

class AuthRepository {
  Future<void> login() async {
    if (kDebugMode) {
      print('attempting login');
    }
    await Future.delayed(const Duration(seconds: 3));
    if (kDebugMode) {
      print('logged in');
    }
    throw Exception('failed log in');
  }
   Future<void> signup() async {
    if (kDebugMode) {
      print('attempting Signup');
    }
    await Future.delayed(const Duration(seconds: 5));
    if (kDebugMode) {
      print('registered');
    }
    throw Exception('failed to register');
  }
}
