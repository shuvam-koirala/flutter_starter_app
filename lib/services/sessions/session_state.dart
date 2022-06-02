part of 'session_cubit.dart';

@immutable
 class SessionState {}
class UnknownSession extends SessionState {}
class UnauthenticatedSession extends SessionState{}
class AuthenticatedSession extends SessionState{
  final dynamic user;
  AuthenticatedSession({@required this.user});
}
