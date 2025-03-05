import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(home: UniversityDetailsScreen()));
}

class UniversityDetailsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Image.asset(
              "assets/images/logo/logo.png",
              width: 60,
              fit: BoxFit.cover,
            ),
            Row(
              children: [
                const Text(
                  "WELCOME, ",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22),
                ),
                const Text(
                  "ANIL",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22),
                ),
              ],
            ),
            Row(
              children: const [
                Icon(Icons.notifications_none_outlined, size: 30),
                SizedBox(width: 5),
                Icon(Icons.webhook_sharp, size: 30),
              ],
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: TextField(
                decoration: InputDecoration(
                  hintText: 'Search here',
                  prefixIcon: const Icon(Icons.menu),
                  suffixIcon: const Icon(Icons.search),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30.0),
                    borderSide: BorderSide.none,
                  ),
                  filled: true,
                  fillColor: Colors.grey[200],
                  contentPadding: const EdgeInsets.symmetric(vertical: 0),
                ),
              ),
            ),

            SizedBox(
              width: double.infinity,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: Image.asset(
                  "assets/images/university/university-1.png",
                  fit: BoxFit.cover,
                ),
              ),
            ),
            const SizedBox(height: 20),
            Text(
              "University of Toronto",
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 5),

            Row(
              children: [
                Icon(Icons.location_on, color: Colors.blueAccent),
                SizedBox(width: 5),
                Text(
                  "Toronto, Ontario, Canada",
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                ),
              ],
            ),
            SizedBox(height: 5),

            Row(
              children: [
                Icon(Icons.star, color: Colors.amber),
                SizedBox(width: 5),
                Text(
                  "Ranking: Ranked #25 globally",
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                ),
              ],
            ),
            SizedBox(height: 10),

            Text(
              "The University of Toronto (UofT) is a public research university in Toronto, Canada, located on the grounds that surround Queen’s Park. "
              "It was founded in 1827 as King’s College, the first institution of higher learning in Upper Canada.",
              style: TextStyle(fontSize: 14, color: Colors.black87),
            ),
            SizedBox(height: 15),

            Row(
              children: [
                Icon(Icons.monetization_on, color: Colors.black54),
                SizedBox(width: 5),
                Text(
                  "Charges",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ],
            ),
            SizedBox(height: 5),
            Text(
              "The application fee for a Canadian student visa is C\$150, and the University of Toronto charges an additional C\$155 processing fee.",
              style: TextStyle(fontSize: 14, color: Colors.black87),
            ),
            SizedBox(height: 15),

            Row(
              children: [
                Icon(Icons.check_box, color: Colors.green),
                SizedBox(width: 5),
                Text(
                  "How to Apply",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ],
            ),
            SizedBox(height: 5),
            Text(
              "To apply to the University of Toronto, use the Ontario Universities' Application Centre (OUAC) platform, selecting your desired program(s), "
              "meeting admission requirements, and submitting necessary documents like transcripts and test scores.",
              style: TextStyle(fontSize: 14, color: Colors.black87),
            ),
            SizedBox(height: 20),

            Text(
              "Ratings & Reviews ⭐",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: _reviewCard(
                    "Ananya Gupta",
                    "Canada Student Visa",
                    "Michael made my visa process so easy!",
                    4.9,
                  ),
                ),
                SizedBox(width: 10),
                Expanded(
                  child: _reviewCard(
                    "Vikram Reddy",
                    "USA F1 Visa",
                    "Professional. Highly recommended!",
                    4.6,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _reviewCard(
    String name,
    String visaType,
    String review,
    double rating,
  ) {
    return Container(
      padding: EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.blueAccent.shade100,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            name,
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
          Text(visaType, style: TextStyle(fontSize: 14, color: Colors.black54)),
          SizedBox(height: 5),
          Text(review, style: TextStyle(fontSize: 12, color: Colors.black87)),
          SizedBox(height: 5),
          Row(
            children: [
              Icon(Icons.star, color: Colors.amber, size: 18),
              Text(
                rating.toString(),
                style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
