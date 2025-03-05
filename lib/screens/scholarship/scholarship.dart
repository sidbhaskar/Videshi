import 'package:flutter/material.dart';
import 'package:videshi/screens/scholarship/widgets/scholarship_details.dart';

class ScholarshipsScreen extends StatelessWidget {
  const ScholarshipsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF1A3A5A),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () {},
        ),
        title: const Text(
          'Scholarships',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.notifications_outlined, color: Colors.white),
            onPressed: () {},
          ),
        ],
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: TextField(
              decoration: InputDecoration(
                hintText: 'search here',
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
          Expanded(
            child: ListView(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ScholarshipDetailsScreen(),
                      ),
                    );
                  },
                  child: ScholarshipCard(
                    title: 'Rhodes Scholarship (UK)',
                    amount: 'UP To ₹100,500',
                    description:
                        'The Rhodes Scholarship (UK) is one of the oldest and most prestigious, offering full funding for postgraduate study at Oxford University.',
                    dueDate: 'Due: Dec 30, 2025',
                  ),
                ),
                SizedBox(height: 16),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ScholarshipDetailsScreen(),
                      ),
                    );
                  },
                  child: ScholarshipCard(
                    title: 'Zolve Global Scholarship',
                    amount: 'UP To ₹100,500',
                    description:
                        'A premier opportunity for Indian students aspiring to study in the United States, designed to support both need-based and merit-based applicants.',
                    dueDate: 'Due: Dec 30, 2025',
                  ),
                ),
                SizedBox(height: 16),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ScholarshipDetailsScreen(),
                      ),
                    );
                  },
                  child: ScholarshipCard(
                    title: 'DAAD Scholarships (Germany)',
                    amount: 'UP To ₹100,500',
                    description:
                        'provide financial support for international students pursuing master\'s and PhD studies in Germany.',
                    dueDate: 'Due: Dec 30, 2025',
                  ),
                ),
                SizedBox(height: 16),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ScholarshipDetailsScreen(),
                      ),
                    );
                  },
                  child: ScholarshipCard(
                    title: 'Fulbright Program (USA)',
                    amount: 'UP To ₹100,500',
                    description:
                        'The Fulbright Program (USA) promotes cultural exchange by funding master\'s, PhD, and research programs for international students.',
                    dueDate: 'Due: Dec 30, 2025',
                  ),
                ),
                SizedBox(height: 16),
              ],
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        backgroundColor: const Color(0xFF1A3A5A),
        child: const Icon(Icons.add, color: Colors.white),
      ),
    );
  }
}

class ScholarshipCard extends StatelessWidget {
  final String title;
  final String amount;
  final String description;
  final String dueDate;

  const ScholarshipCard({
    super.key,
    required this.title,
    required this.amount,
    required this.description,
    required this.dueDate,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15.0),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.3),
            spreadRadius: 1,
            blurRadius: 5,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 12.0,
                    vertical: 6.0,
                  ),
                  decoration: BoxDecoration(
                    color: const Color(0xFF1A3A5A),
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                  child: Text(
                    title,
                    style: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 14.0,
                    ),
                  ),
                ),
                Text(
                  amount,
                  style: const TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 16.0,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 12.0),
            Text(
              description,
              style: TextStyle(color: Colors.grey[700], fontSize: 14.0),
            ),
            const SizedBox(height: 12.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  dueDate,
                  style: const TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.w500,
                    fontSize: 14.0,
                  ),
                ),
                ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF1A3A5A),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                  ),
                  child: const Text(
                    'Apply Now',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
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
}
