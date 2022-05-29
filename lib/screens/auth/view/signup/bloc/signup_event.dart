part of 'signup_bloc.dart';

@immutable
class SignupEvent {}
class SignupUsernameChanged extends SignupEvent {
  final String username;

  SignupUsernameChanged({required this.username});
}
class SignupEmailChanged extends SignupEvent {
  final String email;

  SignupEmailChanged({required this.email});
}

class SignupPasswordChanged extends SignupEvent {
  final String password;

  SignupPasswordChanged({required this.password});
}

class SignupPressed extends SignupEvent {} 