import 'package:flutter/material.dart';
import 'package:payments/features/payment/presentation/pages/payment_result.dart';
import 'package:payments/features/payment/presentation/widgets/custom_credit_card.dart';

class PayymentDetails extends StatefulWidget {
  const PayymentDetails({super.key});

  @override
  State<PayymentDetails> createState() => _PayymentDetailsState();
}

GlobalKey<FormState> formKey = GlobalKey<FormState>();
List<String> images = [
  'assets/images/credit_card.png',
  'assets/images/paypal.png',
  'assets/images/apple_pay.png',
];
bool isSelected = false;
int currentIndex = -1;
AutovalidateMode autovalidateMode = AutovalidateMode.disabled;

class _PayymentDetailsState extends State<PayymentDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Payment Details',
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 24),
        ),
        centerTitle: true,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 16),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: List.generate(3, (index) {
                    isSelected = currentIndex == index;
                    return InkWell(
                      onTap: () {
                        currentIndex = index;
                        setState(() {});
                      },
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 16,
                          vertical: 8,
                        ),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(16),
                          border: Border.all(
                            color: isSelected ? Colors.green : Colors.black,
                          ),
                        ),
                        child: Image.asset(images[index]),
                      ),
                    );
                  }),
                ),
                const SizedBox(height: 20),
                CustomCreditCard(
                  formKey: formKey,
                  autovalidateMode: autovalidateMode,
                ),
                const SizedBox(height: 20),
                InkWell(
                  onTap: () {
                    if (formKey.currentState!.validate()) {
                      formKey.currentState!.save();
                    } else {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) {
                            return const PaymentResult();
                          },
                        ),
                      );
                      autovalidateMode = AutovalidateMode.always;
                      setState(() {});
                    }
                  },
                  child: Container(
                    width: double.infinity,
                    alignment: Alignment.center,
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: Colors.green,
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: const Text(
                      'Pay',
                      style: TextStyle(fontSize: 24, color: Colors.white),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
