part of 'confirm_bloc.dart';

class ConfirmEvent extends Equatable {
  const ConfirmEvent();

  @override
  List<Object> get props => [];
}
class OtpChanged extends ConfirmEvent{
  final String otp;
  const OtpChanged({required this.otp});
}
class ConfirmPressed extends ConfirmEvent{
}
class ResendOtp extends ConfirmEvent{}