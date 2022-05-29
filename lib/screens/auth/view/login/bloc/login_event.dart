part of 'login_bloc.dart';
@immutable
 class LoginEvent {}
class LoginUsernameChanged extends LoginEvent {
  final String username;

  LoginUsernameChanged(this.username);
}

class LoginPasswordChanged extends LoginEvent {
  final String password;

  LoginPasswordChanged(this.password);
}

class LoginPressed extends LoginEvent {} 