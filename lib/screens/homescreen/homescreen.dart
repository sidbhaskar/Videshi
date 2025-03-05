import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:videshi/screens/homescreen/widgets/students/abroad_students.dart';
import 'package:videshi/utils/constants/constant_data.dart';

import '../../common/agent_details.dart';
import 'widgets/university/alluniversity.dart';

class HomePagescreen extends StatelessWidget {
  const HomePagescreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.white,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Image.asset(
              "assets/images/logo/logo.png",
              width: 50,
              fit: BoxFit.cover,
            ),
            Row(
              children: [
                Text(
                  "WELCOME, ",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22),
                ),
                Text(
                  "ANIL",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22),
                ),
              ],
            ),
            Row(
              children: [
                Icon(Icons.notifications_none_outlined, size: 30),
                const SizedBox(width: 5),
                Icon(Icons.webhook_sharp, size: 30),
              ],
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 16.0),
          child: Column(
            children: [
              Stack(
                children: [
                  Image.asset(
                    'assets/images/logo/hero.png',
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                  ClipPath(
                    clipper: DiagonalClipper(),
                    child: Container(color: Colors.white),
                  ),
                  Positioned(
                    top: 70,
                    left: 30,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        RichText(
                          text: const TextSpan(
                            children: [
                              TextSpan(
                                text: "Navigate life with\n",
                                style: TextStyle(
                                  fontSize: 32,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black87,
                                ),
                              ),
                              TextSpan(
                                text: "Confidence",
                                style: TextStyle(
                                  fontSize: 32,
                                  fontWeight: FontWeight.bold,
                                  color: Color(0xFF1A4670),
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(height: 30),
                        ElevatedButton(
                          onPressed: () {},
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Color(0xFF1A4670),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30),
                            ),
                            padding: const EdgeInsets.symmetric(
                              horizontal: 20,
                              vertical: 12,
                            ),
                          ),
                          child: const Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text(
                                "Discover more",
                                style: TextStyle(
                                  fontSize: 16,
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              SizedBox(width: 8),
                              Icon(Icons.arrow_forward, color: Colors.white),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 10),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Application Tracker",
                      style: TextStyle(
                        fontSize: 22,
                        color: Color(0xFF001B4B),
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    OutlinedButton(
                      style: ButtonStyle(),
                      onPressed: () {},
                      child: Text("View Details"),
                    ),
                  ],
                ),
              ),
              SizedBox(
                width: 400,
                height: 200,
                child: Stack(
                  clipBehavior: Clip.none,
                  children: [
                    Positioned(
                      left: 0,
                      top: 30,
                      child: StepCircle(
                        "1",
                        // "Application\nsubmitted",
                        Color(0XFF809FB9),
                      ),
                    ),
                    Positioned(
                      left: 90,
                      top: 100,
                      child: StepCircle(
                        "2",
                        // "Document\nVerification",
                        Color(0XFF006CBB),
                        // Icons.verified,
                      ),
                    ),
                    Positioned(
                      left: 170,
                      top: 20,
                      child: StepCircle(
                        "3",
                        // "Visa interview\nscheduled",
                        Color(0XFF4CA5A2),
                        // Icons.event,
                      ),
                    ),
                    Positioned(
                      left: 240,
                      top: 110,
                      child: StepCircle(
                        "4",
                        // "Approval\nprocess",
                        Color(0XFF52D5BA),
                        // Icons.approval,
                      ),
                    ),
                    Positioned(
                      left: 300,
                      top: 20,
                      child: StepCircle(
                        "5",
                        // "Final\nConfirmation",
                        Color(0XFF95DFA2),
                        // Icons.check_circle,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              Stack(
                children: [
                  Container(
                    width: double.infinity,
                    height: 280,
                    decoration: BoxDecoration(
                      color: Color.fromARGB(255, 184, 206, 225),
                    ),
                  ),
                  Positioned(
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          const Text(
                            "Meet our Expert and qualified Agents",
                            style: TextStyle(
                              fontSize: 22,
                              fontWeight: FontWeight.bold,
                              color: Color(0xFF0F2851),
                            ),
                            textAlign: TextAlign.center,
                          ),
                          const SizedBox(height: 20),
                          SizedBox(
                            height: 190,
                            child: ListView.builder(
                              scrollDirection: Axis.horizontal,
                              itemCount: agentData.length,
                              itemBuilder: (context, index) {
                                final agent = agentData[index];
                                return GestureDetector(
                                  onTap: () {
                                    Get.to(() => AgentProfileScreen());
                                  },
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                      horizontal: 8,
                                    ),
                                    child: AgentCard(agent),
                                  ),
                                );
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 10),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Find the Right University",
                      style: TextStyle(
                        fontSize: 22,
                        color: Color(0xFF001B4B),
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        Get.to(() => AlluniversityScreen());
                      },
                      child: Icon(Icons.arrow_forward, size: 30),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              SizedBox(
                height: 300,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: ListView.separated(
                    itemCount: universityData.length,
                    scrollDirection: Axis.horizontal,
                    separatorBuilder:
                        (context, index) => const SizedBox(width: 20),
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        onTap: () {
                          Get.to(() => AlluniversityScreen());
                        },
                        child: UniversityCards(
                          image: universityData[index]["image"]!,
                          name: universityData[index]["name"]!,
                          location: universityData[index]["Location"]!,
                          ranking: universityData[index]["ranking"]!,
                        ),
                      );
                    },
                  ),
                ),
              ),
              const SizedBox(height: 20),
              Stack(
                children: [
                  Container(
                    width: double.infinity,
                    height: 280,
                    decoration: BoxDecoration(
                      color: Color.fromARGB(255, 184, 206, 225),
                    ),
                  ),
                  Positioned(
                    top: 20,
                    left: 25,
                    child: Text(
                      "Go through the profiles of Students Abroad",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                  Positioned(
                    top: 60,
                    left: 10,
                    child: Container(
                      width: 390,
                      height: 150,
                      decoration: BoxDecoration(
                        color: Color(0XFF8CAECA),
                        borderRadius: BorderRadius.circular(15),
                      ),
                    ),
                  ),
                  Positioned(
                    top: 80,
                    left: 8,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 18.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          AbroadStudentCards(),
                          const SizedBox(width: 20),
                          AbroadStudentCards(),
                          const SizedBox(width: 20),
                          AbroadStudentCards(),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class AbroadStudentCards extends StatelessWidget {
  const AbroadStudentCards({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(width: .8),
        borderRadius: BorderRadius.circular(15),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            ClipRRect(
              child: Image.asset("assets/images/students/student-1.png"),
            ),
            Text(
              "Jenna Samson",
              style: TextStyle(fontSize: 12, fontWeight: FontWeight.w700),
            ),
            Text("Student", style: TextStyle(fontSize: 10)),
            Text(
              "Harvard University",
              style: TextStyle(fontSize: 10, fontWeight: FontWeight.w700),
            ),
            const SizedBox(height: 5),
            Container(
              decoration: BoxDecoration(
                color: Color(0XFF001B4B),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Padding(
                padding: const EdgeInsets.all(5.0),
                child: GestureDetector(
                  onTap: () {
                    Get.to(() => AbroadStudentsScreen());
                  },
                  child: Text(
                    "Look Now",
                    style: TextStyle(color: Colors.white, fontSize: 12),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class UniversityCards extends StatelessWidget {
  const UniversityCards({
    super.key,
    required this.image,
    required this.name,
    required this.location,
    required this.ranking,
  });
  final String image, name, location, ranking;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 250,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          ClipRRect(
            borderRadius: const BorderRadius.vertical(top: Radius.circular(16)),
            child: Image.asset(image, height: 150, fit: BoxFit.cover),
          ),
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: const Color.fromARGB(255, 122, 206, 201),
              borderRadius: const BorderRadius.vertical(
                bottom: Radius.circular(16),
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name,
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                Row(
                  children: [
                    const Text(
                      "Location: ",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: Colors.white,
                      ),
                    ),
                    Text(
                      location,
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    const Text(
                      "Ranking:",
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                        color: Colors.white,
                      ),
                    ),
                    Text(
                      ranking,
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
                Center(
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.black,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      padding: const EdgeInsets.symmetric(
                        horizontal: 24,
                        vertical: 10,
                      ),
                    ),
                    onPressed: () {},
                    child: const Text(
                      "View Details",
                      style: TextStyle(color: Colors.white, fontSize: 14),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class AgentCard extends StatelessWidget {
  final Map<String, String> agent;

  const AgentCard(this.agent, {super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          _buildProfileImage(),
          const SizedBox(height: 10),
          _buildName(),
          const SizedBox(height: 5),
          _buildSpecialization(),
          const SizedBox(height: 5),
          _buildSeeButton(),
        ],
      ),
    );
  }

  Widget _buildProfileImage() {
    return ClipRRect(
      borderRadius: BorderRadius.circular(50),
      child: Image.asset(
        agent["image"]!,
        width: 50,
        height: 50,
        fit: BoxFit.cover,
      ),
    );
  }

  Widget _buildName() {
    return Text(
      agent["name"]!,
      textAlign: TextAlign.center,
      style: const TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.w700,
        color: Colors.black,
      ),
    );
  }

  Widget _buildSpecialization() {
    return Text(
      "Specialization:\n${agent["specialization"]!}",
      textAlign: TextAlign.center,
      style: const TextStyle(
        fontSize: 10,
        fontWeight: FontWeight.w500,
        color: Colors.black54,
      ),
    );
  }

  Widget _buildSeeButton() {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: const Color(0xFF0F2851),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
        minimumSize: const Size(60, 30),
      ),
      onPressed: () {},
      child: const Text(
        "See",
        style: TextStyle(color: Colors.white, fontSize: 8),
      ),
    );
  }
}

class DiagonalClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();
    path.lineTo(size.width * 0.01, 0);
    path.lineTo(size.width * .6, size.height * 0.9);
    path.lineTo(size.width * 1, size.height);
    path.lineTo(0, size.height);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(DiagonalClipper oldClipper) => false;
}

class StepCircle extends StatelessWidget {
  final String stepNumber;
  // final String title;
  final Color color;

  const StepCircle(this.stepNumber, this.color, {super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: 100,
          height: 100,
          decoration: BoxDecoration(color: color, shape: BoxShape.circle),
          child: Column(
            children: [
              Row(
                children: [
                  Stack(
                    children: [
                      Text(
                        stepNumber,
                        style: const TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                    ],
                  ),
                  // Image.asset(
                  //   "assets/images/application_tracker/app-track-1.png",
                  //   width: 100,
                  //   height: 100,
                  //   fit: BoxFit.contain,
                  // ),
                ],
              ),
              // const SizedBox(height: 4),
            ],
          ),
        ),
        // const SizedBox(height: 8),
        // SizedBox(
        //   width: 100,
        //   child: Text(
        //     title,
        //     textAlign: TextAlign.center,
        //     style: const TextStyle(
        //       fontSize: 14,
        //       fontWeight: FontWeight.w600,
        //       color: Colors.black,
        //     ),
        //   ),
        // ),
      ],
    );
  }
}
