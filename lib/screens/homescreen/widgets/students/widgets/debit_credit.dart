import 'package:flutter/material.dart';
import 'package:videshi/screens/homescreen/widgets/students/widgets/card_details.dart';

class DebitCreditPage extends StatelessWidget {
  const DebitCreditPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0XFF001B4B),
        title: const Text(
          "Debit/Credit Card",
          style: TextStyle(color: Colors.white),
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Image.asset("assets/images/logo/Debit.jpg", height: 200),
            ),
            const SizedBox(height: 30),

            const Text(
              "Total Summary",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.black87,
              ),
            ),
            const Divider(thickness: 1.5),
            const SizedBox(height: 10),

            _buildSummaryRow("Price of the Wall per month", "₹1080"),
            _buildSummaryRow("GST", "₹35"),
            _buildSummaryRow("SGST", "₹35"),
            const Divider(thickness: 1.5),
            const SizedBox(height: 10),

            _buildSummaryRow("Total", "₹1150", isTotal: true),
            const SizedBox(height: 30),

            Center(
              child: SizedBox(
                width: 180,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0XFF001B4B),
                    padding: const EdgeInsets.symmetric(vertical: 14),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  onPressed:
                      () => Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => const CardDetailsPage(),
                        ),
                      ),
                  child: const Text(
                    "Pay Now",
                    style: TextStyle(color: Colors.white, fontSize: 16),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSummaryRow(String label, String value, {bool isTotal = false}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            label,
            style: TextStyle(
              fontSize: 16,
              fontWeight: isTotal ? FontWeight.bold : FontWeight.normal,
              color: Colors.black87,
            ),
          ),
          Text(
            value,
            style: TextStyle(
              fontSize: 16,
              fontWeight: isTotal ? FontWeight.bold : FontWeight.normal,
              color: isTotal ? Colors.red.shade900 : Colors.black87,
            ),
          ),
        ],
      ),
    );
  }
}
