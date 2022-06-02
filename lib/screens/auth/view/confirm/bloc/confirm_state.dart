// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'confirm_bloc.dart';

class ConfirmState extends Equatable {
  final String otp;
    bool get isvalidOtp=>otp.length<5;
      final FormSubmissionStatus formStatus;
      final OtpStatus otpStatus;
  const ConfirmState({
    this.otp="",
    this.formStatus = const InitialFormStatus(),
    this.otpStatus=const InitialOtpStatus(),
  });
  
  @override
  List<Object> get props => [otp,formStatus];

  ConfirmState copyWith({
    String? otp,
    FormSubmissionStatus? formStatus,
    OtpStatus? otpStatus,
  }) {
    return ConfirmState(
      otp: otp ?? this.otp,
      formStatus: formStatus ?? this.formStatus,
      otpStatus: otpStatus??this.otpStatus,
    );
  }
}

