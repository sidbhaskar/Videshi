import 'package:flutter/material.dart';

import '../agent chat screen/agent_chat.dart';

class AgentHome extends StatelessWidget {
  const AgentHome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: Row(
          children: [
            Container(
              width: 40,
              height: 40,
              decoration: const BoxDecoration(
                color: Color(0xFF1A3E6D),
                shape: BoxShape.circle,
              ),
              child: const Center(
                child: Icon(
                  Icons.flight_takeoff,
                  color: Colors.white,
                  size: 20,
                ),
              ),
            ),
            const SizedBox(width: 12),
            const Text(
              'WELCOME, JOSEPH',
              style: TextStyle(
                color: Colors.black,
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.notifications_none, color: Colors.black),
            onPressed: () {},
          ),
          IconButton(
            icon: const Icon(Icons.language, color: Colors.black),
            onPressed: () {},
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Location
              Row(
                children: const [
                  Icon(Icons.location_on_outlined,
                      size: 18, color: Colors.black54),
                  SizedBox(width: 4),
                  Text(
                    'Canada',
                    style: TextStyle(
                      color: Colors.black54,
                      fontSize: 14,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 16),

              // Status Cards
              Row(
                children: [
                  Expanded(
                    child: _buildStatusCard(
                      title: 'Active Applications',
                      count: '12 ongoing cases',
                      icon: Icons.folder_open,
                      color: Colors.teal[100]!,
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: _buildStatusCard(
                      title: 'Pending Actions',
                      count: '3 need attention',
                      icon: Icons.access_time,
                      color: Colors.blue[100]!,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 24),

              // Client & Application Management
              const Text(
                'Client & Application Management',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 16),

              // Tasks Card
              Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.1),
                      spreadRadius: 1,
                      blurRadius: 5,
                    ),
                  ],
                ),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: const [
                          Text(
                            'Your Tasks & Updates',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const Divider(height: 1),
                    _buildTaskItem(
                      icon: Icons.people,
                      title: 'Client Applications',
                      subtitle:
                          'Manage Clients - View all student applications',
                      trailing: '6 In Progress | 2 Pending',
                      trailingColor: Colors.orange,
                    ),
                    const Divider(height: 1),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => ChatList(),
                            ));
                      },
                      child: _buildTaskItem(
                        icon: Icons.chat_bubble_outline,
                        title: 'Chat with Clients',
                        subtitle:
                            'Messages & Inquiries - Respond to student queries',
                        trailing: '2 New Messages',
                        trailingColor: Colors.green,
                      ),
                    ),
                    const Divider(height: 1),
                    _buildTaskItem(
                      icon: Icons.description_outlined,
                      title: 'Document Requests',
                      subtitle:
                          'Pending Documents - Track missing or required files',
                      trailing: 'Upload pending for 3 clients',
                      trailingColor: Colors.blue,
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 24),

              // Application Tracking
              const Text(
                'Application Tracking',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 16),

              // Client Cards
              Row(
                children: [
                  Expanded(
                    child: ClientCard(
                      name: "John Doe",
                      visaType: "Study Visa",
                      status: "In Progress",
                      statusColor: Colors.yellow,
                      nextStep: "Document review",
                      avatarUrl: "https://example.com/avatar.jpg",
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: ClientCard(
                      name: 'Sarah',
                      visaType: 'Work Permit',
                      status: 'Approved',
                      statusColor: Colors.green,
                      nextStep: 'Send Confirmation',
                      avatarUrl: 'https://i.pravatar.cc/100?img=5',
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

  Widget _buildStatusCard({
    required String title,
    required String count,
    required IconData icon,
    required Color color,
  }) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(icon, color: Colors.black87),
          const SizedBox(height: 8),
          Text(
            title,
            style: const TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            count,
            style: const TextStyle(
              fontSize: 12,
              color: Colors.black87,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTaskItem({
    required IconData icon,
    required String title,
    required String subtitle,
    required String trailing,
    required Color trailingColor,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      child: Row(
        children: [
          Icon(icon, size: 24, color: Colors.black87),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 14,
                  ),
                ),
                const SizedBox(height: 2),
                Text(
                  subtitle,
                  style: TextStyle(
                    fontSize: 12,
                    color: Colors.grey[600],
                  ),
                ),
              ],
            ),
          ),
          Text(
            trailing,
            style: TextStyle(
              fontSize: 12,
              color: trailingColor,
              fontWeight: FontWeight.w500,
            ),
          ),
          const Icon(Icons.chevron_right, color: Colors.black45),
        ],
      ),
    );
  }
}

class ClientCard extends StatelessWidget {
  final String name;
  final String visaType;
  final String status;
  final Color statusColor;
  final String nextStep;
  final String avatarUrl;

  const ClientCard({
    Key? key,
    required this.name,
    required this.visaType,
    required this.status,
    required this.statusColor,
    required this.nextStep,
    required this.avatarUrl,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: Colors.blueGrey.shade100,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              CircleAvatar(
                backgroundImage: NetworkImage(avatarUrl),
                radius: 30,
              ),
              const SizedBox(width: 10),
              Text(
                name,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.blueGrey,
                ),
              ),
            ],
          ),
          const SizedBox(height: 10),
          Text(
            "Visa Type: $visaType",
            style: const TextStyle(fontSize: 14),
          ),
          const SizedBox(height: 5),
          Row(
            children: [
              Icon(Icons.circle, color: statusColor, size: 14),
              const SizedBox(width: 5),
              Text(
                "Status: $status",
                style: const TextStyle(fontSize: 14),
              ),
            ],
          ),
          const SizedBox(height: 5),
          Text(
            "Next Step: $nextStep",
            style: const TextStyle(fontSize: 14),
          ),
          const SizedBox(height: 10),
          Center(
            child: ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blueGrey,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              child: const Text(
                "View Details",
                style: TextStyle(color: Colors.white),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
