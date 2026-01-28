import 'package:dartz/dartz.dart';
import 'package:payments/core/usecase/use_case.dart';
import 'package:payments/features/payment/Data/models/payment_intent_model/request_payment_intent_model.dart';
import 'package:payments/features/payment/domain/entitis/strip_payment_entity.dart';
import 'package:payments/features/payment/domain/repos/payment_repo.dart';

class PaymentByStripUseCase
    extends UseCase<StripPaymentEntity, RequestPaymentIntentModel> {
  final PaymentRepo paymentRepo;

  PaymentByStripUseCase({required this.paymentRepo});
  @override
  Future<Either<String, StripPaymentEntity>> call({
    required RequestPaymentIntentModel params,
  }) async {
    return await paymentRepo.paymentByStrip(requestPaymentIntentModel: params);
  }
}
