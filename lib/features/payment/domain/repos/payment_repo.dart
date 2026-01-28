import 'package:dartz/dartz.dart';
import 'package:payments/features/payment/Data/models/payment_intent_model/request_payment_intent_model.dart';
import 'package:payments/features/payment/domain/entitis/strip_payment_entity.dart';

abstract class PaymentRepo {
  Future<Either<String, StripPaymentEntity>> paymentByStrip({
    required RequestPaymentIntentModel requestPaymentIntentModel,
  });
}
