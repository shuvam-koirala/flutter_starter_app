class OtpStatus{
  const OtpStatus();
}

class InitialOtpStatus extends OtpStatus{
  const InitialOtpStatus();
}
class OtpSendingStatus extends OtpStatus{}
class OtpSentStatus extends OtpStatus{}
class OtpFailed extends OtpStatus{
  final String exception;
OtpFailed(this.exception);
}