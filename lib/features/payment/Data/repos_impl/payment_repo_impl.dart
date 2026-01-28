import 'package:dartz/dartz.dart';
import 'package:payments/core/network/errors/api_error_handler.dart';
import 'package:payments/core/services/strip_payment_service.dart';
import 'package:payments/features/payment/Data/models/payment_intent_model/request_payment_intent_model.dart';
import 'package:payments/features/payment/domain/entitis/strip_payment_entity.dart';
import 'package:payments/features/payment/domain/repos/payment_repo.dart';

class PaymentRepoImpl extends PaymentRepo {
  final StripPaymentService stripPaymentService;

  PaymentRepoImpl({required this.stripPaymentService});

  @override
  Future<Either<String, StripPaymentEntity>> paymentByStrip({
    required RequestPaymentIntentModel requestPaymentIntentModel,
  }) async {
    try {
      final paymentIntentModel = await stripPaymentService.createPaymentIntent(
        requestPaymentIntentModel: requestPaymentIntentModel,
      );
      return right(paymentIntentModel.toEntity());
    } catch (e) {
      return left(ApiErrorHandler().handle(e).errorMessage);
    }
  }
}
