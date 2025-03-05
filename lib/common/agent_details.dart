import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(home: AgentProfileScreen(), debugShowCheckedModeBanner: false),
  );
}

class AgentProfileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: IconButton(icon: Icon(Icons.arrow_back), onPressed: () {}),
        title: Text("Description"),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                CircleAvatar(
                  radius: 55,
                  // backgroundImage: AssetImage('assets/profile.jpg'),
                ),
                SizedBox(width: 16),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.blue.shade100,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Michael Tony",
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Row(
                              children: [
                                Icon(
                                  Icons.location_on,
                                  size: 16,
                                  color: Colors.blue,
                                ),
                                Text(" USA"),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(height: 10),
                    Text(
                      "Certified Immigration Consultant,\nVisa Specialist",
                      style: TextStyle(fontSize: 14, color: Colors.grey),
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(height: 16),
            Container(
              width: double.infinity,
              padding: EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: Colors.blue.shade100,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Text(
                "Consultation Fee: \$300",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
            ),
            SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                AgentExpCard(exp1: "Years of", exp2: "Experience", number: "5"),
                AgentExpCard(exp1: "Success", exp2: " Rate", number: "96%"),
              ],
            ),
            SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                AgentExpCard(
                  exp1: "Top Applications",
                  exp2: "Processed",
                  number: "500+",
                ),
                AgentExpCard(exp1: "Ratings &", exp2: "Reviews", number: "4.6"),
              ],
            ),
            SizedBox(height: 20),
            Text(
              "Overview",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            Text(
              "We are a team of registered and certified immigration professionals with a proven track record of success.We possess in-depth knowledge of immigration laws and procedures and are committed to providing ethical and transparent services.  Your immigration journey is in safe hands with us",
              style: TextStyle(fontSize: 16, color: Colors.grey),
            ),
            SizedBox(height: 16),
            _buildInfoSection("Services", [
              "SOP & LOR Assistance",
              "Visa Interview Prep",
              "Scholarship/Loan Guidance",
              "Application Filling Assistance",
            ]),
            SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _buildVisaSection("Countries of Expertise", [
                  "🇺🇸 USA",
                  "🇩🇪 Germany",
                  "🇬🇧 UK",
                  "🇨🇦 Canada",
                ]),
                _buildVisaSection("Visa Types Handled", [
                  "Student Visa",
                  "Work Permit",
                  "Dependent Visa",
                  "PR",
                ]),
              ],
            ),
            SizedBox(height: 16),

            SizedBox(height: 16),
            Text(
              "Ratings & Reviews ⭐",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            _buildReviewCard(
              "Ananya Gupta",
              "Canada Student Visa",
              "Michael made my process easy and hassle-free!",
              4.9,
            ),
            SizedBox(height: 10),
            _buildReviewCard(
              "Vikram Reddy",
              "USA F1 Visa",
              "Professional and knowledgeable!",
              4.6,
            ),
            SizedBox(height: 16),
            Row(
              children: [
                Expanded(
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blueAccent,
                    ),
                    onPressed: () {},
                    child: Text(
                      "Compare Agent",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
                SizedBox(width: 10),
                Expanded(
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blueAccent,
                    ),
                    onPressed: () {},
                    child: Text(
                      "Contact",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildInfoSection(String title, List<String> items) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.blue.shade100,
        borderRadius: BorderRadius.circular(30),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            Column(
              children:
                  items
                      .map(
                        (item) => Padding(
                          padding: const EdgeInsets.symmetric(vertical: 4.0),
                          child: Row(
                            children: [
                              Icon(Icons.circle, color: Colors.black, size: 8),
                              SizedBox(width: 8),
                              Text(item, style: TextStyle(fontSize: 14)),
                            ],
                          ),
                        ),
                      )
                      .toList(),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildVisaSection(String title, List<String> items) {
    return Container(
      width: 180,
      decoration: BoxDecoration(
        color: Colors.blue.shade100,
        borderRadius: BorderRadius.circular(30),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            Column(
              children:
                  items
                      .map(
                        (item) => Padding(
                          padding: const EdgeInsets.symmetric(vertical: 4.0),
                          child: Row(
                            children: [
                              Icon(Icons.circle, color: Colors.black, size: 8),
                              SizedBox(width: 8),
                              Text(item, style: TextStyle(fontSize: 14)),
                            ],
                          ),
                        ),
                      )
                      .toList(),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildReviewCard(
    String name,
    String visaType,
    String review,
    double rating,
  ) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.blue.shade100,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              name,
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            Text(visaType, style: TextStyle(fontSize: 14, color: Colors.grey)),
            SizedBox(height: 4),
            Text(review, style: TextStyle(fontSize: 14)),
            SizedBox(height: 4),
            Row(
              children: [
                Icon(Icons.star, color: Colors.amber, size: 16),
                Text(" $rating", style: TextStyle(fontSize: 14)),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class AgentExpCard extends StatelessWidget {
  const AgentExpCard({
    super.key,
    required this.number,
    required this.exp1,
    required this.exp2,
  });
  final String exp1, exp2, number;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          width: 150,
          padding: EdgeInsets.symmetric(horizontal: 16, vertical: 10),
          decoration: BoxDecoration(
            color: Colors.blue.shade100,
            borderRadius: BorderRadius.circular(30),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    exp1,
                    style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    exp2,
                    style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ],
          ),
        ),
        Positioned(
          left: 92,
          child: Container(
            width: 55,

            padding: EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: Colors.blue.shade900,
              shape: BoxShape.circle,
            ),
            child: Text(
              number,
              style: TextStyle(
                fontSize: 26,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
              textAlign: TextAlign.center,
            ),
          ),
        ),
      ],
    );
  }
}
