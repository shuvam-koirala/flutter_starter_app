import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../../../services/status/form_submission_status.dart';
import '../../../../../services/status/otp_status.dart';
import '../../../repository/auth_repository.dart';

part 'confirm_event.dart';
part 'confirm_state.dart';

class ConfirmBloc extends Bloc<ConfirmEvent, ConfirmState> {
  final AuthRepository authRepo;
  ConfirmBloc(this.authRepo) : super(const ConfirmState()) {
    on<OtpChanged>((event, emit) =>
      emit(state.copyWith(otp: event.otp))
    );
    on<ConfirmPressed>((event, emit)async {
      emit(state.copyWith(formStatus:FormSubmitting() ));
      try {
        await authRepo.verify();
        emit(state.copyWith(formStatus: SubmissionSuccess()));
      } catch (e) {
        emit(state.copyWith(formStatus: SubmissionFailed(e.toString())));
      }
    },
    );
    on<ResendOtp>((event, emit) async{
      emit(state.copyWith(otpStatus: OtpSendingStatus()));
      try {
        await authRepo.verify();
      emit(state.copyWith(otpStatus: OtpSentStatus()));  
      } catch (e) {
      emit(state.copyWith(otpStatus: OtpFailed(e.toString())));
        
      }
    });
   
  }
}
