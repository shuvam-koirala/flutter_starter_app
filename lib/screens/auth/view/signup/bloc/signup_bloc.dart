
import '../../../../../export_packages.dart';
import '../../../repository/auth_repository.dart';
import '../../../status/form_submission_status.dart';

part 'signup_event.dart';
part 'signup_state.dart';

class SignupBloc extends Bloc<SignupEvent, SignupState> {
  final AuthRepository authRepo;
  SignupBloc(this.authRepo) : super(const SignupState()) {
    on<SignupEmailChanged>(
        (event, emit) => emit(state.copyWith(email: event.email)));
    on<SignupPasswordChanged>(
        (event, emit) => emit(state.copyWith(password: event.password)));
    on<SignupUsernameChanged>(
        (event, emit) => emit(state.copyWith(username: event.username)));
    on<SignupPressed>((event, emit) async {
      emit(state.copyWith(formStatus: FormSubmitting()));
      try {
        await authRepo.signup();
        emit(state.copyWith(formStatus: SubmissionSuccess()));
      } catch (e) {
        emit(state.copyWith(formStatus: SubmissionFailed(e.toString())));
      }
    });
  }
}
