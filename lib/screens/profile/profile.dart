import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:videshi/screens/profile/widgets/edit_profile.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios, color: Colors.black),
          onPressed: () {},
        ),
        title: const Text(
          'Profile',
          style: TextStyle(
            color: Colors.black,
            fontSize: 22,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        children: [
          _buildSectionHeader('Account'),
          _buildMenuGroup([
            GestureDetector(
              onTap: () {
                Get.to(() => EditProfileScreen());
              },
              child: _buildMenuItem(Icons.person_outline, 'Edit profile'),
            ),
            _buildMenuItem(Icons.security_outlined, 'security'),
            _buildMenuItem(Icons.notifications_none, 'Notifications'),
            _buildMenuItem(Icons.lock_outline, 'Privacy'),
          ]),

          const SizedBox(height: 16),

          _buildSectionHeader('Support & About'),
          _buildMenuGroup([
            _buildMenuItem(Icons.credit_card_outlined, 'My payments'),
            _buildMenuItem(Icons.help_outline, 'Help & Support'),
            _buildMenuItem(Icons.info_outline, 'Terms and Policies'),
          ]),

          const SizedBox(height: 16),

          _buildSectionHeader('Cache & cellular'),
          _buildMenuGroup([
            _buildMenuItem(Icons.delete_outline, 'Free up space'),
            _buildMenuItem(Icons.data_saver_off_outlined, 'Data Saver'),
          ]),

          const SizedBox(height: 16),

          _buildSectionHeader('Actions'),
          _buildMenuGroup([
            _buildMenuItem(Icons.flag_outlined, 'Report a problem'),
            _buildMenuItem(Icons.people_outline, 'Talk tyo supports'),
            _buildMenuItem(Icons.logout_outlined, 'Log out'),
          ]),
        ],
      ),
    );
  }

  Widget _buildSectionHeader(String title) {
    return Padding(
      padding: const EdgeInsets.only(left: 4, bottom: 8),
      child: Text(
        title,
        style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
      ),
    );
  }

  Widget _buildMenuGroup(List<Widget> items) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.grey.shade100,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(children: items),
    );
  }

  Widget _buildMenuItem(IconData iconData, String title) {
    return Material(
      color: Colors.transparent,
      child: GestureDetector(
        onTap: () {},
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          child: Row(
            children: [
              Icon(iconData, size: 24, color: Colors.black87),
              const SizedBox(width: 16),
              Text(
                title,
                style: const TextStyle(
                  fontSize: 16,
                  color: Colors.black,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
