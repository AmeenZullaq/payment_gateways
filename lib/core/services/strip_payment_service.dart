import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:payments/core/network/dio/api_service.dart';
import 'package:payments/features/payment/Data/models/payment_intent_model/payment_intent_model.dart';
import 'package:payments/features/payment/Data/models/payment_intent_model/request_payment_intent_model.dart';

class StripPaymentService {
  final ApiService apiService;

  StripPaymentService({required this.apiService});

  Future<PaymentIntentModel> createPaymentIntent({
    required RequestPaymentIntentModel requestPaymentIntentModel,
  }) async {
    final result = await apiService.post(
      endpoint: "https://api.stripe.com/v1/payment_intents",
      data: requestPaymentIntentModel.toJson(),
    );
    return result;
  }

  Future<void> initPaymentSheet({
    required String paymentIntentClientSecret,
  }) async {
    await Stripe.instance.initPaymentSheet(
      paymentSheetParameters: SetupPaymentSheetParameters(
        // Main params
        merchantDisplayName: 'ameen zullaq',
        paymentIntentClientSecret: paymentIntentClientSecret,
        // style: ThemeMode.dark,
      ),
    );
  }

  Future displayPaymentSheet({
    required String paymentIntentClientSecret,
  }) async {
    await initPaymentSheet(
      paymentIntentClientSecret: paymentIntentClientSecret,
    );
    await Stripe.instance.presentPaymentSheet();
  }
}
