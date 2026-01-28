class RequestPaymentIntentModel {
  final String amount;

  final String currency;

  RequestPaymentIntentModel({required this.amount, required this.currency});

  toJson() => {'amount': amount, 'currency': currency};
}
