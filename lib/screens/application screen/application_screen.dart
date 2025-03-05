import 'package:flutter/material.dart';

class ApplicationScreen extends StatelessWidget {
  const ApplicationScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF2B4B6F),
        title: const Text(
          'Applications',
          style: TextStyle(color: Colors.white),
        ),
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.white,
          ),
          onPressed: () {},
        ),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: [
          ApplicationCard(
            name: 'John Doe',
            visaType: 'Study Visa',
            nextStep: 'Document review',
            status: ApplicationStatus.inProgress,
            avatarUrl: 'https://example.com/avatar1.jpg',
            universityName: 'Howard',
            country: 'UK',
            context: context,
          ),
          const SizedBox(height: 12),
          ApplicationCard(
            name: 'Sarah Khan',
            visaType: 'Work Permit',
            nextStep: 'Send Confirmation',
            status: ApplicationStatus.approved,
            avatarUrl: 'https://example.com/avatar2.jpg',
            universityName: 'N/A',
            country: 'Canada',
            context: context,
          ),
          const SizedBox(height: 12),
          ApplicationCard(
            name: 'David Lee',
            visaType: 'PR Application',
            nextStep: 'Resubmit Documents',
            status: ApplicationStatus.pending,
            avatarUrl: 'https://example.com/avatar3.jpg',
            universityName: 'N/A',
            country: 'Australia',
            context: context,
          ),
          const SizedBox(height: 12),
          ApplicationCard(
            name: 'John Doe',
            visaType: 'Study Visa',
            nextStep: 'Document review',
            status: ApplicationStatus.inProgress,
            avatarUrl: 'https://example.com/avatar1.jpg',
            universityName: 'Oxford',
            country: 'UK',
            context: context,
          ),
        ],
      ),
    );
  }
}

enum ApplicationStatus { approved, inProgress, pending }

class ApplicationCard extends StatelessWidget {
  final String name;
  final String visaType;
  final String nextStep;
  final ApplicationStatus status;
  final String avatarUrl;
  final String universityName;
  final String country;
  final BuildContext context;

  const ApplicationCard({
    Key? key,
    required this.name,
    required this.visaType,
    required this.nextStep,
    required this.status,
    required this.avatarUrl,
    required this.universityName,
    required this.country,
    required this.context,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 4,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          children: [
            // Avatar
            CircleAvatar(
              radius: 25,
              backgroundImage: NetworkImage(avatarUrl),
              onBackgroundImageError: (_, __) {
                // Placeholder in case image fails to load
              },
              child: null,
            ),
            const SizedBox(width: 16),

            // Details section
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    name,
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF1A2E44),
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    'Visa Type: $visaType',
                    style: const TextStyle(
                      fontSize: 14,
                      color: Color(0xFF6B7C8F),
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    'Next Step: $nextStep',
                    style: const TextStyle(
                      fontSize: 14,
                      color: Color(0xFF6B7C8F),
                    ),
                  ),
                  const SizedBox(height: 12),

                  // Status and View Details row
                  Row(
                    children: [
                      // Status indicator
                      Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 12, vertical: 6),
                        decoration: BoxDecoration(
                          color: _getStatusColor().withOpacity(0.15),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Container(
                              width: 8,
                              height: 8,
                              decoration: BoxDecoration(
                                color: _getStatusColor(),
                                shape: BoxShape.circle,
                              ),
                            ),
                            const SizedBox(width: 6),
                            Text(
                              _getStatusText(),
                              style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.w500,
                                color: _getStatusColor(),
                              ),
                            ),
                          ],
                        ),
                      ),

                      const Spacer(),

                      // View Details button with navigation
                      ElevatedButton(
                        onPressed: () {
                          Navigator.push(
                            this.context,
                            MaterialPageRoute(
                              builder: (context) => ApplicationDetailsScreen(
                                name: name,
                                visaType: visaType,
                                nextStep: nextStep,
                                avatarUrl: avatarUrl,
                                status: _getStatusText(),
                                applicationDetails:
                                    'Your application is being processed.',
                                universityName: universityName,
                                country: country,
                              ),
                            ),
                          );
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFF2B4B6F),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                          padding: const EdgeInsets.symmetric(
                              horizontal: 16, vertical: 8),
                        ),
                        child: const Text(
                          'View Details',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 12,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Color _getStatusColor() {
    switch (status) {
      case ApplicationStatus.approved:
        return Colors.green;
      case ApplicationStatus.inProgress:
        return Colors.amber;
      case ApplicationStatus.pending:
        return Colors.red;
    }
  }

  String _getStatusText() {
    switch (status) {
      case ApplicationStatus.approved:
        return 'Approved';
      case ApplicationStatus.inProgress:
        return 'In Progress';
      case ApplicationStatus.pending:
        return 'Pending';
    }
  }
}

class ApplicationDetailsScreen extends StatelessWidget {
  final String name;
  final String visaType;
  final String nextStep;
  final String avatarUrl;
  final String status;
  final String applicationDetails;
  final String universityName;
  final String country;

  const ApplicationDetailsScreen({
    Key? key,
    required this.name,
    required this.visaType,
    required this.nextStep,
    required this.avatarUrl,
    required this.status,
    required this.applicationDetails,
    required this.universityName,
    required this.country,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: const Color(0xFF2B4B6F),
        title: const Text(
          'Application Details',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Status badge at the top
            Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
              color: const Color(0xFFE8F0F7),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Container(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                    decoration: BoxDecoration(
                      color: _getStatusColor().withOpacity(0.15),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Container(
                          width: 8,
                          height: 8,
                          decoration: BoxDecoration(
                            color: _getStatusColor(),
                            shape: BoxShape.circle,
                          ),
                        ),
                        const SizedBox(width: 6),
                        Text(
                          status,
                          style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w500,
                            color: _getStatusColor(),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),

            // Applicant info
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                children: [
                  // Avatar
                  CircleAvatar(
                    radius: 35,
                    backgroundImage: NetworkImage(avatarUrl),
                    onBackgroundImageError: (_, __) {
                      // Placeholder in case image fails to load
                    },
                  ),
                  const SizedBox(width: 16),

                  // Name and visa info
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          name,
                          style: const TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                            color: Color(0xFF1A2E44),
                          ),
                        ),
                        const SizedBox(height: 8),
                        Text(
                          'Visa Type: $visaType',
                          style: const TextStyle(
                            fontSize: 14,
                            color: Color(0xFF6B7C8F),
                          ),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          'Next Step:',
                          style: const TextStyle(
                            fontSize: 14,
                            color: Color(0xFF6B7C8F),
                          ),
                        ),
                        Text(
                          nextStep,
                          style: const TextStyle(
                            fontSize: 14,
                            color: Color(0xFF6B7C8F),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),

            // Details section header
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
              child: Text(
                'Details about the application',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
            ),

            // Application details card
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Container(
                width: double.infinity,
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: const Color(0xFF2B4B6F),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Text(
                  'Your student visa application for $universityName university in $country is currently under review. We\'ve received your student visa application. It\'s currently being processed by the',
                  style: const TextStyle(
                    fontSize: 14,
                    height: 1.5,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Color _getStatusColor() {
    switch (status.toLowerCase()) {
      case 'approved':
        return Colors.green;
      case 'in progress':
        return Colors.amber;
      case 'pending':
        return Colors.red;
      default:
        return Colors.grey;
    }
  }
}
