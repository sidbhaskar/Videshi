import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:videshi/screens/homescreen/widgets/students/widgets/payment_methods.dart';

class AbroadstudentsdetailsScreen extends StatelessWidget {
  const AbroadstudentsdetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text(
          "Description",
          style: TextStyle(fontSize: 22, fontWeight: FontWeight.w600),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 32.0, vertical: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  CircleAvatar(
                    radius: 50,
                    backgroundImage: AssetImage(
                      "assets/images/students/student-1.png",
                    ),
                  ),
                  const SizedBox(width: 30),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Jenna Samson",
                          style: const TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          "Student, 2nd year",
                          style: TextStyle(
                            fontSize: 13,
                            color: Colors.grey[700],
                          ),
                        ),
                        const SizedBox(height: 4),
                        Row(
                          children: [
                            const Icon(Icons.location_pin, size: 16),
                            const SizedBox(width: 5),
                            Flexible(
                              child: Text(
                                "Harvard University",
                                style: const TextStyle(fontSize: 13),
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              Container(
                decoration: BoxDecoration(
                  color: const Color.fromARGB(255, 232, 232, 232),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Column(
                  children: [
                    _infoCard("Year of Study", "2nd"),
                    _infoCard("Course & Specialization", "Computer Science"),
                    _infoCard("University", "Harvard University"),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image.asset(
                  "assets/images/university/university-1.png",
                  height: 180,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
              ),
              const SizedBox(height: 20),
              Text(
                "About Me",
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w800,
                ),
              ),
              const SizedBox(height: 10),
              Container(
                padding: EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: Color.fromARGB(255, 232, 232, 232),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Text(
                  'Hey,\n'
                  'I am a Sophomore at Harvard University with a specialization in Computer Science, passionate about artificial intelligence and software development. '
                  'Originally from Indonesia, I pursued my dream of studying at a top-tier university through dedication and strategic planning.',
                  style: TextStyle(fontSize: 14, color: Colors.black87),
                ),
              ),
              const SizedBox(height: 20),
              Text(
                "Life at Harvard",
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w800,
                ),
              ),
              const SizedBox(height: 10),
              Text(
                "Studying at Harvard has been an incredible journey. The coursework is challenging, but the opportunity to collaborate with brilliant minds makes it truly rewarding. I’ve joined tech-focused clubs, competed in hackathons, and secured a software development internship. Beyond academics, I enjoy exploring Cambridge, attending networking events, and building meaningful connections.",
              ),
              const SizedBox(height: 20),

              _buildRatingsAndReviews(),
              const SizedBox(height: 10),

              Text(
                "Chat with Jenna",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 8),

              Row(
                children: [
                  Icon(Icons.check, color: Colors.blue, size: 18),
                  SizedBox(width: 6),
                  Text("Get insights on studying at Harvard"),
                ],
              ),
              SizedBox(height: 4),
              Row(
                children: [
                  Icon(Icons.check, color: Colors.blue, size: 18),
                  SizedBox(width: 6),
                  Text("Application tips, student life, scholarships & more"),
                ],
              ),
              SizedBox(height: 16),

              Row(
                children: [
                  Icon(Icons.monetization_on, color: Colors.black87),
                  SizedBox(width: 6),
                  Text(
                    "Charges",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                  ),
                ],
              ),
              SizedBox(height: 12),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  _pricingCard("\$25", "15-mins Chat", Colors.teal),
                  _pricingCard("\$47", "30-mins Chat & Call", Colors.blueGrey),
                ],
              ),
              SizedBox(height: 16),
              //
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  _actionButton("Book Now", Colors.blue.shade900, () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => const PaymentMethodsPage(),
                      ),
                    );
                  }),
                  _actionButton("Save for Later", Colors.blue.shade700, () {}),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

Widget _infoCard(String title, String value) {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(title, style: const TextStyle(fontWeight: FontWeight.bold)),
        Text(value, style: const TextStyle(color: Colors.black)),
      ],
    ),
  );
}

Widget _buildRatingsAndReviews() {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      const Text(
        "Ratings & Reviews ⭐",
        style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
      ),
      const SizedBox(height: 8),
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          _reviewCard(
            "Alex Varghese",
            "Freshman 2023",
            "Talking to Jenna gave me so much clarity about applying to Harvard! She was super patient in answering my questions about the application process and even shared tips on writing a strong personal statement.",
            4.9,
          ),
          _reviewCard(
            "Sarthak Jain",
            "Fall 2024 Aspirant",
            "I had a chat with Jenna about internships, and she gave me amazing advice on how to land a tech internship as an international student. Her guidance was super valuable!",
            4.6,
          ),
        ],
      ),
    ],
  );
}

Widget _pricingCard(String price, String duration, Color color) {
  return Expanded(
    child: Container(
      margin: EdgeInsets.symmetric(horizontal: 6),
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          CircleAvatar(
            backgroundColor: Colors.white,
            radius: 20,
            child: Text(
              price,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
          ),
          SizedBox(width: 10),
          Expanded(
            child: Text(
              duration,
              style: TextStyle(color: Colors.white),
              softWrap: true,
              overflow: TextOverflow.visible,
            ),
          ),
        ],
      ),
    ),
  );
}

Widget _actionButton(String text, Color color, VoidCallback onPressed) {
  return Expanded(
    child: Container(
      margin: const EdgeInsets.symmetric(horizontal: 6),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: color,
          padding: const EdgeInsets.symmetric(vertical: 14),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        ),
        onPressed: onPressed,
        child: Text(
          text,
          style: const TextStyle(color: Colors.white, fontSize: 16),
        ),
      ),
    ),
  );
}

Widget _reviewCard(String name, String role, String review, double rating) {
  return Expanded(
    child: Card(
      color: Color(0XFF1A4670),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: SizedBox(
        height: 180,
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                children: [
                  Text(
                    name,
                    style: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                  ),
                  Text(role, style: const TextStyle(color: Colors.white70)),
                ],
              ),
              Expanded(
                child: Text(
                  review,
                  style: const TextStyle(color: Colors.white, fontSize: 12),
                  textAlign: TextAlign.center,
                  maxLines: 4,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              RatingBarIndicator(
                rating: rating,
                itemBuilder:
                    (context, _) => const Icon(Icons.star, color: Colors.amber),
                itemCount: 5,
                itemSize: 20,
              ),
            ],
          ),
        ),
      ),
    ),
  );
}
