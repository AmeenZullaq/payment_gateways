part of 'strip_payment_cubit.dart';

@immutable
sealed class StripPaymentState {}

final class StripPaymentInitial extends StripPaymentState {}

final class StripPaymentLoading extends StripPaymentState {}

final class StripPaymentSuccess extends StripPaymentState {
  final StripPaymentEntity stripPaymentEntity;

  StripPaymentSuccess({required this.stripPaymentEntity});
}

final class StripPaymentFailed extends StripPaymentState {
  final String errMessage;

  StripPaymentFailed({required this.errMessage});
}
