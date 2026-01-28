import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:payments/features/payment/Data/models/payment_intent_model/request_payment_intent_model.dart';
import 'package:payments/features/payment/domain/entitis/strip_payment_entity.dart';
import 'package:payments/features/payment/domain/use_cases/payment_by_strip_use_case.dart';
part 'strip_payment_state.dart';

class StripPaymentCubit extends Cubit<StripPaymentState> {
  StripPaymentCubit(this.paymentByStripUseCase) : super(StripPaymentInitial());

  final PaymentByStripUseCase paymentByStripUseCase;

  Future<void> paymentByStrip({
    required RequestPaymentIntentModel requestPaymentIntentModel,
  }) async {
    emit(StripPaymentLoading());
    final result = await paymentByStripUseCase.call(
      params: requestPaymentIntentModel,
    );
    result.fold(
      (errMessage) {
        emit(StripPaymentFailed(errMessage: errMessage));
      },
      (stripPaymentEntity) {
        emit(StripPaymentSuccess(stripPaymentEntity: stripPaymentEntity));
      },
    );
  }
}
