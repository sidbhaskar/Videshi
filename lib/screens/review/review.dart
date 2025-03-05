import 'package:flutter/material.dart';
import 'package:videshi/screens/review/widgets/review_details.dart';

class ReviewsScreen extends StatelessWidget {
  const ReviewsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffD2DDE8),
      appBar: AppBar(
        backgroundColor: Color(0xffD2DDE8),
        elevation: 0,
        leading: const BackButton(color: Colors.black),
        title: const Text(
          'Reviews',
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
        actions: [
          Container(
            margin: const EdgeInsets.only(right: 16),
            child: CircleAvatar(
              backgroundColor: Colors.blue[800],
              child: const Icon(Icons.add, color: Colors.white),
            ),
          ),
        ],
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => ReviewDetails()),
              );
            },
            child: ReviewCard(
              name: 'Caroline Shannon',
              timeAgo: '42 mins ago',
              rating: 5,
              reviewTitle: 'Highly Recommended',
              reviewText:
                  'Lorem ipsum dolor sit amet, consectetur adipiscing elit, dolor sit amet, consectetur adipiscing elit...',
              university: 'Cambridge University',
              profession: 'Sophomore',
              imageUrl:
                  'https://images.unsplash.com/20/cambridge.JPG?q=80&w=2047&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
              voteCount: 9,
            ),
          ),
          SizedBox(height: 16),
          GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => ReviewDetails()),
              );
            },
            child: ReviewCard(
              name: 'Samantha Roger',
              timeAgo: '2 hours ago',
              rating: 5,
              reviewTitle: 'Excellent Support',
              reviewText:
                  'Lorem ipsum dolor sit amet, consectetur adipiscing elit, dolor sit amet, consectetur adipiscing elit...',
              university: 'Massachusetts University of Technology',
              profession: 'Junior Year',
              imageUrl:
                  'https://media.istockphoto.com/id/1271611698/photo/maclaurin-building-number-10-and-killian-court.jpg?s=2048x2048&w=is&k=20&c=L02vrcCfSbuTb6Gy9rgq5RWEJwePPaqqlJK3KUQdteo=',
              voteCount: 5,
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Color(0xffD2DDE8),
        onPressed: () {},
        child: const Icon(Icons.chat_bubble_outline),
      ),
    );
  }
}

class ReviewCard extends StatelessWidget {
  final String name;
  final String timeAgo;
  final int rating;
  final String reviewTitle;
  final String reviewText;
  final String university;
  final String profession;
  final String imageUrl;
  final int voteCount;

  const ReviewCard({
    super.key,
    required this.name,
    required this.timeAgo,
    required this.rating,
    required this.reviewTitle,
    required this.reviewText,
    required this.university,
    required this.profession,
    required this.imageUrl,
    required this.voteCount,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      elevation: 1,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Header with profile picture, name, time, and menu
            Row(
              children: [
                CircleAvatar(
                  backgroundImage: NetworkImage(
                    'https://via.placeholder.com/50',
                  ),
                  radius: 16,
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
                      Text(
                        timeAgo,
                        style: TextStyle(color: Colors.grey[600], fontSize: 12),
                      ),
                    ],
                  ),
                ),
                IconButton(
                  icon: const Icon(Icons.more_horiz),
                  onPressed: () {},
                  padding: EdgeInsets.zero,
                  constraints: const BoxConstraints(),
                ),
              ],
            ),
            const SizedBox(height: 12),

            // Rating title and stars
            Text(
              reviewTitle,
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            ),
            const SizedBox(height: 4),
            Row(
              children: List.generate(5, (index) {
                return Icon(
                  Icons.star,
                  color: index < rating ? Colors.amber : Colors.grey[300],
                  size: 18,
                );
              }),
            ),
            const SizedBox(height: 12),

            // Review text
            Text(
              reviewText,
              style: const TextStyle(fontSize: 14),
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
            TextButton(
              onPressed: () {},
              style: TextButton.styleFrom(
                padding: EdgeInsets.zero,
                minimumSize: const Size(50, 20),
                tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                alignment: Alignment.centerLeft,
              ),
              child: Text(
                'See More',
                style: TextStyle(color: Colors.blue[800], fontSize: 12),
              ),
            ),
            const SizedBox(height: 12),

            // Review image
            Container(
              height: 120,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                image: DecorationImage(
                  image: NetworkImage(imageUrl),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            const SizedBox(height: 12),

            // University and profession info
            Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'University',
                        style: TextStyle(color: Colors.grey, fontSize: 12),
                      ),
                      const SizedBox(height: 2),
                      Text(
                        university,
                        style: const TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 13,
                        ),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Current Profession',
                        style: TextStyle(color: Colors.grey, fontSize: 12),
                      ),
                      const SizedBox(height: 2),
                      Text(
                        profession,
                        style: const TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 13,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 12),

            // Action buttons
            Row(
              children: [
                _buildActionButton(Icons.thumb_up_outlined, ''),
                _buildActionButton(Icons.thumb_down_outlined, ''),
                _buildActionButton(Icons.comment_outlined, ''),
                _buildActionButton(Icons.share_outlined, ''),
                const Spacer(),
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 8,
                    vertical: 4,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.grey[200],
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Row(
                    children: [
                      const Icon(Icons.add, size: 16, color: Colors.black),
                      const SizedBox(width: 2),
                      Text(
                        voteCount.toString(),
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 12,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildActionButton(IconData icon, String label) {
    return Padding(
      padding: const EdgeInsets.only(right: 16),
      child: Row(
        children: [
          Icon(icon, size: 20, color: Colors.grey[700]),
          if (label.isNotEmpty) ...[
            const SizedBox(width: 4),
            Text(
              label,
              style: TextStyle(color: Colors.grey[700], fontSize: 14),
            ),
          ],
        ],
      ),
    );
  }
}
