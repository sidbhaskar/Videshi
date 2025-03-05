import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

// Chat List Screen
class ChatList extends StatelessWidget {
  const ChatList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF1F3E5F),
        title: const Text(
          'CHAT WITH THE STUDENTS',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(16),
            color: const Color(0xFF1F3E5F),
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.9),
                borderRadius: BorderRadius.circular(8),
              ),
              padding: const EdgeInsets.symmetric(horizontal: 12),
              child: Row(
                children: [
                  const Icon(Icons.menu, color: Colors.grey),
                  const SizedBox(width: 8),
                  const Expanded(
                    child: TextField(
                      decoration: InputDecoration(
                        hintText: 'Search chat',
                        hintStyle: TextStyle(color: Colors.grey),
                        border: InputBorder.none,
                        contentPadding: EdgeInsets.symmetric(vertical: 12),
                      ),
                    ),
                  ),
                  const Icon(Icons.search, color: Colors.grey),
                ],
              ),
            ),
          ),
          Expanded(
            child: ListView(
              children: const [
                ChatListItem(
                  name: 'Metal Exchange',
                  message:
                      'Lorem ipsum dolor sit amet, consectetur adipiscing elit.',
                  time: '10 min',
                  unreadCount: 2,
                  avatarImagePath: 'assets/avatar1.png',
                ),
                Divider(height: 1),
                ChatListItem(
                  name: 'Michael tony',
                  message:
                      'Lorem ipsum dolor sit amet, consectetur adipiscing elit.',
                  time: '10 min',
                  unreadCount: 2,
                  avatarImagePath: 'assets/avatar2.png',
                ),
                Divider(height: 1),
                ChatListItem(
                  name: 'Joseph ray',
                  message:
                      'Lorem ipsum dolor sit amet, consectetur adipiscing elit.',
                  time: '10 min',
                  unreadCount: 2,
                  avatarImagePath: 'assets/avatar3.png',
                ),
                Divider(height: 1),
                ChatListItem(
                  name: 'Thomas adison',
                  message:
                      'Lorem ipsum dolor sit amet, consectetur adipiscing elit.',
                  time: '10 min',
                  unreadCount: 2,
                  avatarImagePath: 'assets/avatar4.png',
                ),
                Divider(height: 1),
                ChatListItem(
                  name: 'Jira',
                  message:
                      'Lorem ipsum dolor sit amet, consectetur adipiscing elit.',
                  time: '10 min',
                  unreadCount: 2,
                  avatarImagePath: 'assets/avatar5.png',
                ),
                Divider(height: 1),
                ChatListItem(
                  name: 'Michael tony',
                  message:
                      'Lorem ipsum dolor sit amet, consectetur adipiscing elit.',
                  time: '10 min',
                  unreadCount: 2,
                  avatarImagePath: 'assets/avatar2.png',
                ),
                Divider(height: 1),
                ChatListItem(
                  name: 'Joseph ray',
                  message:
                      'Lorem ipsum dolor sit amet, consectetur adipiscing elit.',
                  time: '10 min',
                  unreadCount: 2,
                  avatarImagePath: 'assets/avatar3.png',
                ),
                Divider(height: 1),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

// Chat List Item Widget
class ChatListItem extends StatelessWidget {
  final String name;
  final String message;
  final String time;
  final int unreadCount;
  final String avatarImagePath;

  const ChatListItem({
    Key? key,
    required this.name,
    required this.message,
    required this.time,
    required this.unreadCount,
    required this.avatarImagePath,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ChatDetail(name: name),
          ),
        );
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CircleAvatar(
              radius: 24,
              backgroundImage: AssetImage(avatarImagePath),
              onBackgroundImageError: (exception, stackTrace) {
                // Fallback for missing assets
                // Use a placeholder icon instead
              },
              // child: Image.asset(avatarImagePath).image.resolve(const ImageConfiguration()).addListener(
              //       ImageStreamListener((info, call) {}, onError: (error, stackTrace) {
              //         // This will catch any errors loading the image
              //         // and display initials instead
              //         return Text(name.substring(0, 1));
              //       }),
              //     ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    name,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    message,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      color: Colors.grey[700],
                      fontSize: 14,
                    ),
                  ),
                ],
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  time,
                  style: TextStyle(
                    color: Colors.grey[500],
                    fontSize: 12,
                  ),
                ),
                const SizedBox(height: 4),
                Container(
                  padding: const EdgeInsets.all(6),
                  decoration: BoxDecoration(
                    color: const Color(0xFF1F3E5F),
                    borderRadius: BorderRadius.circular(4),
                  ),
                  child: Text(
                    unreadCount.toString(),
                    style: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 12,
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

// Chat Detail Screen
class ChatDetail extends StatelessWidget {
  final String name;

  const ChatDetail({Key? key, required this.name}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF1F3E5F),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text(
          name == 'Michael tony' ? 'Micheal Tony' : name,
          style: const TextStyle(color: Colors.white),
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
          Expanded(
            child: ListView(
              padding: const EdgeInsets.all(16),
              children: [
                // First message from the other person
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const CircleAvatar(
                      radius: 16,
                      backgroundImage: AssetImage('assets/avatar6.png'),
                    ),
                    const SizedBox(width: 8),
                    Flexible(
                      child: Container(
                        padding: const EdgeInsets.all(12),
                        decoration: BoxDecoration(
                          color: const Color(0xFFA4B0BE),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: const Text(
                          'Lorem ipsum Dolor Sit Amet, Consectetur Adipiscing Elit, Sed Do Eiusmod Tempor Incididunt Ut Labore Et Dolore.',
                          style: TextStyle(color: Colors.white, fontSize: 14),
                        ),
                      ),
                    ),
                    const SizedBox(width: 50), // Space on the right side
                  ],
                ),
                const Padding(
                  padding: EdgeInsets.only(left: 40),
                  child: Text(
                    '10 AM',
                    style: TextStyle(
                      color: Colors.grey,
                      fontSize: 12,
                    ),
                  ),
                ),
                const SizedBox(height: 16),

                // Second message from the other person
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const CircleAvatar(
                      radius: 16,
                      backgroundImage: AssetImage('assets/avatar6.png'),
                    ),
                    const SizedBox(width: 8),
                    Flexible(
                      child: Container(
                        padding: const EdgeInsets.all(12),
                        decoration: BoxDecoration(
                          color: const Color(0xFFA4B0BE),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: const Text(
                          'Sed Do Eiusmod Tempor Incididunt Ut Labore Et Magna Aliqua. Ut Enim Ad Minim Veniam, Quis Nostrud Exercitation Ullamco Laboris Nisi Ut Aliqui.',
                          style: TextStyle(color: Colors.white, fontSize: 14),
                        ),
                      ),
                    ),
                    const SizedBox(width: 50), // Space on the right side
                  ],
                ),
                const Padding(
                  padding: EdgeInsets.only(left: 40),
                  child: Text(
                    '10 AM',
                    style: TextStyle(
                      color: Colors.grey,
                      fontSize: 12,
                    ),
                  ),
                ),
              ],
            ),
          ),

          // Message input area
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            decoration: const BoxDecoration(
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: Colors.black12,
                  offset: Offset(0, -1),
                  blurRadius: 4,
                ),
              ],
            ),
            child: Row(
              children: [
                const CircleAvatar(
                  backgroundColor: Colors.transparent,
                  radius: 18,
                  child:
                      Icon(Icons.emoji_emotions_outlined, color: Colors.grey),
                ),
                const SizedBox(width: 8),
                const Expanded(
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: 'Type message here...',
                      hintStyle: TextStyle(color: Colors.grey),
                      border: InputBorder.none,
                    ),
                  ),
                ),
                Container(
                  width: 40,
                  height: 40,
                  decoration: const BoxDecoration(
                    color: Color(0xFF1F3E5F),
                    shape: BoxShape.circle,
                  ),
                  child: const Icon(Icons.send, color: Colors.white, size: 20),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
