import '../../export_packages.dart';
part 'session_state.dart';

class SessionCubit extends Cubit<SessionState> {
  SessionCubit() : super(UnknownSession());
  void attemptAutoLogin() {
    //if (token is not saved )
    // {emit(UnauthenticatedSession());}
    //else {
    // if(token is expired){
    // emit(UnauthenticatedSession());
    // }
    //else{
    //emit(AuthenticatedSession());
    //}
    //}
  }
  void logout() {
    emit(UnauthenticatedSession());
  }

  void showSession() {
    // emit(AuthenticatedSession(user: user));
  }
}
