import 'package:flutter/material.dart';
import 'package:videshi/screens/homescreen/widgets/students/widgets/debit_credit.dart';
import 'package:videshi/screens/homescreen/widgets/students/widgets/upi_payment.dart';

class PaymentMethodsPage extends StatelessWidget {
  const PaymentMethodsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0XFF001B4B),
        title: const Text(
          "Payment Methods",
          style: TextStyle(color: Colors.white),
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Center(
              child: Text(
                "Mode of Payment",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ),
            const SizedBox(height: 20),

            _buildPaymentOption(
              context,
              "UPI Payment",
              "assets/images/logo/upi.png",
              const UpiPaymentPage(),
            ),

            _buildPaymentOption(
              context,
              "Debit Card",
              "assets/images/logo/Debit.jpg",
              const DebitCreditPage(),
            ),

            _buildPaymentOption(
              context,
              "Credit Card",
              "assets/images/logo/credit.png",
              const DebitCreditPage(),
            ),

            _buildPaymentOption(
              context,
              "Net Banking",
              "assets/images/logo/net.png",
              null,
            ),

            const SizedBox(height: 20),

            /// **Cancel Button**
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.red,
                  padding: const EdgeInsets.symmetric(vertical: 14),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                onPressed: () => Navigator.pop(context),
                child: const Text(
                  "Cancel",
                  style: TextStyle(color: Colors.white, fontSize: 16),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildPaymentOption(
    BuildContext context,
    String text,
    String imagePath,
    Widget? page,
  ) {
    return GestureDetector(
      onTap:
          page != null
              ? () => Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => page),
              )
              : null,
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 6),
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          border: Border.all(color: Colors.grey.shade300),
          borderRadius: BorderRadius.circular(8),
          color: Colors.white,
        ),
        child: Row(
          children: [
            Image.asset(imagePath, width: 40, height: 40),
            const SizedBox(width: 16),
            Text(
              text,
              style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
            ),
          ],
        ),
      ),
    );
  }
}
