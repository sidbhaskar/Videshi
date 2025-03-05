import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class TaskManagerScreen extends StatefulWidget {
  const TaskManagerScreen({Key? key}) : super(key: key);

  @override
  State<TaskManagerScreen> createState() => _TaskManagerScreenState();
}

class _TaskManagerScreenState extends State<TaskManagerScreen> {
  final String userName = "JOSEPH";
  final DateTime currentDate = DateTime(2025, 2, 14);
  String activeTab = "Pending Tasks";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        backgroundColor: const Color(0xFF1A3A63),
        child: const Icon(Icons.add),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildHeader(),
              const SizedBox(height: 16),
              _buildTaskInfo(),
              const SizedBox(height: 16),
              _buildSearchBar(),
              const SizedBox(height: 12),
              _buildTabButtons(),
              const SizedBox(height: 8),
              _buildTaskListHeader(),
              // Using Expanded here to allow the ListView to take only the space it needs
              Expanded(
                flex: 3, // Give task list more space
                child: _buildTasksList(),
              ),
              // Using Expanded for notes to prevent overflow
              Expanded(
                flex: 2, // Give notes section less space
                child: _buildQuickNotesSection(),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildHeader() {
    return Padding(
      padding: const EdgeInsets.only(top: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              CircleAvatar(
                backgroundColor: const Color(0xFF1A3A63),
                radius: 14,
                child: Image.asset('assets/company_logo.png', height: 18),
              ),
              const SizedBox(width: 8),
              Text(
                "WELCOME, $userName",
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 14,
                ),
              ),
            ],
          ),
          Row(
            children: [
              IconButton(
                icon: const Icon(Icons.notifications_outlined, size: 20),
                onPressed: () {},
                constraints: const BoxConstraints(),
                padding: const EdgeInsets.all(8),
              ),
              IconButton(
                icon: const Icon(Icons.language, size: 20),
                onPressed: () {},
                constraints: const BoxConstraints(),
                padding: const EdgeInsets.all(8),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildTaskInfo() {
    final dateFormat = DateFormat('dd MMM yyyy');
    final formattedDate = dateFormat.format(currentDate);

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const Text(
          "You have 3 tasks to\ncomplete today",
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
          decoration: BoxDecoration(
            border: Border.all(color: Colors.grey),
            borderRadius: BorderRadius.circular(4),
          ),
          child: Row(
            children: [
              Text(
                formattedDate,
                style: const TextStyle(fontSize: 10),
              ),
              const SizedBox(width: 2),
              const Icon(Icons.calendar_today_outlined, size: 14),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildSearchBar() {
    return Container(
      height: 40,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: Colors.grey.shade300),
      ),
      child: TextField(
        decoration: InputDecoration(
          hintText: "Search",
          hintStyle: TextStyle(color: Colors.grey.shade400, fontSize: 14),
          prefixIcon: Icon(Icons.search, color: Colors.grey.shade400, size: 20),
          border: InputBorder.none,
          contentPadding: const EdgeInsets.symmetric(vertical: 8),
        ),
      ),
    );
  }

  Widget _buildTabButtons() {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          _buildTabButton("Pending Tasks", isActive: true),
          const SizedBox(width: 8),
          _buildTabButton("Upcoming Tasks"),
        ],
      ),
    );
  }

  Widget _buildTabButton(String title, {bool isActive = false}) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      constraints: const BoxConstraints(minHeight: 30),
      decoration: BoxDecoration(
        color: isActive ? const Color(0xFF1A3A63) : Colors.white,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: Colors.grey.shade300),
      ),
      child: Text(
        title,
        style: TextStyle(
          color: isActive ? Colors.white : Colors.black,
          fontWeight: FontWeight.w500,
          fontSize: 12,
        ),
      ),
    );
  }

  Widget _buildTaskListHeader() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const Text(
          "Task List",
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
        Row(
          children: [
            IconButton(
              icon: const Icon(Icons.filter_list, size: 16),
              onPressed: () {},
              constraints: const BoxConstraints(),
              padding: EdgeInsets.zero,
            ),
            const SizedBox(width: 2),
            const Text(
              "Filter",
              style: TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 12,
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildTasksList() {
    return ListView(
      scrollDirection: Axis.horizontal,
      children: [
        _buildTaskCard(
          "John Doe",
          "Interview",
          "Application Review",
          "Today, 9:00 PM",
          Colors.teal.shade200,
          actionText: "Request meeting",
        ),
        _buildTaskCard(
          "Tourist Work Permit Application",
          "Sarah Johnson",
          "Tourist Application",
          "Tomorrow, 10:00 AM",
          Colors.blue.shade200,
          actionText: "Review and update",
        ),
      ],
    );
  }

  Widget _buildTaskCard(String title, String personName, String taskType,
      String dueDate, Color cardColor,
      {required String actionText}) {
    return Container(
      width: 160,
      margin: const EdgeInsets.only(right: 10),
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: cardColor,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            children: [
              const CircleAvatar(
                radius: 14,
                backgroundColor: Colors.white,
                child: Icon(Icons.person, size: 16),
              ),
              const SizedBox(width: 6),
              Expanded(
                child: Text(
                  personName,
                  style: const TextStyle(
                      fontWeight: FontWeight.bold, fontSize: 12),
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),
          Text(
            title,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 12,
            ),
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
          const SizedBox(height: 6),
          Text(
            "Task Type: \"$taskType\"",
            style: const TextStyle(
              fontSize: 10,
              color: Colors.black87,
            ),
          ),
          Text(
            "Due Date: $dueDate",
            style: const TextStyle(
              fontSize: 10,
              color: Colors.black87,
            ),
          ),
          // const Spacer(),
          Text(
            "Action Required: $actionText",
            style: const TextStyle(
              fontSize: 10,
              fontWeight: FontWeight.w500,
            ),
          ),
          const SizedBox(height: 6),
          Row(
            children: [
              Expanded(
                child: ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    padding: EdgeInsets.zero,
                    minimumSize: const Size(0, 30),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                  ),
                  child: const Text("Accept", style: TextStyle(fontSize: 10)),
                ),
              ),
              const SizedBox(width: 4),
              Expanded(
                child: ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    padding: EdgeInsets.zero,
                    minimumSize: const Size(0, 30),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                  ),
                  child: const Text("Reject", style: TextStyle(fontSize: 10)),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildQuickNotesSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          "Quick Notes",
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 8),
        // Use Expanded here to allow Wrap to take available space
        Expanded(
          child: SingleChildScrollView(
            child: Wrap(
              spacing: 8,
              runSpacing: 8,
              children: [
                _buildNoteCard(
                  "Remind John Doe to submit missing documents by Friday.",
                  Colors.grey.shade200,
                ),
                _buildNoteCard(
                  "Confirm Sarah Ahmed work permit submission.",
                  Colors.grey.shade200,
                ),
                _buildNoteCard(
                  "Check visa appointment slots for next week.",
                  Colors.grey.shade200,
                ),
                _buildNoteCard(
                  "Follow up with the embassy regarding delayed approvals.",
                  Colors.grey.shade200,
                ),
                _buildNoteCard(
                  "Send a reminder about upcoming visa interviews.",
                  Colors.grey.shade200,
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildNoteCard(String content, Color color) {
    return Container(
      width: 100,
      height: 100,
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: Colors.grey.shade300),
      ),
      child: Text(
        content,
        style: const TextStyle(fontSize: 10),
        overflow: TextOverflow.ellipsis,
        maxLines: 7,
      ),
    );
  }
}
