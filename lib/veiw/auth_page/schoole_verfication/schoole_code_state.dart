part of 'schoole_code_cubit.dart';

@immutable
sealed class SchooleCodeState {}

final class SchooleCodeInitial extends SchooleCodeState {}

final class SchooleCodeLoading extends SchooleCodeState {}

final class SchooleCodeSuccess extends SchooleCodeState {
  final SchooleCodeVerifation verification;

  SchooleCodeSuccess(this.verification);
}

final class SchooleCodeError extends SchooleCodeState {
  final String message;

  SchooleCodeError(this.message);
}
