import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutter_lucide/flutter_lucide.dart';
import 'screens/agent homescreen/agent_home.dart';
import 'screens/application screen/application_screen.dart';
import 'screens/task screen agent/task_screen_agent.dart';

class AgentNavigation extends StatelessWidget {
  const AgentNavigation({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(NavigationController1());

    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        backgroundColor: const Color(0xFF1A4670),
        shape: const CircleBorder(),
        child: const Icon(Icons.search, color: Colors.white),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: Obx(
        () => BottomAppBar(
          shape: const CircularNotchedRectangle(),
          notchMargin: 10.0,
          color: const Color(0xFFC9D9E7),
          child: SizedBox(
            height: 70,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                NavItem(
                  icon: FontAwesomeIcons.house,
                  label: 'Home',
                  isSelected: controller.selectedIndex.value == 0,
                  onTap: () => controller.selectedIndex.value = 0,
                ),
                NavItem(
                  icon: FontAwesomeIcons.folder,
                  label: 'Applications',
                  isSelected: controller.selectedIndex.value == 1,
                  onTap: () => controller.selectedIndex.value = 1,
                ),
                const SizedBox(width: 40),
                NavItem(
                  icon: LucideIcons.message_square,
                  label: 'Tasks',
                  isSelected: controller.selectedIndex.value == 2,
                  onTap: () => controller.selectedIndex.value = 2,
                ),
                NavItem(
                  icon: LucideIcons.user,
                  label: 'Profile',
                  isSelected: controller.selectedIndex.value == 3,
                  onTap: () => controller.selectedIndex.value = 3,
                ),
              ],
            ),
          ),
        ),
      ),
      body: Obx(() => controller.screens[controller.selectedIndex.value]),
    );
  }
}

class NavigationController1 extends GetxController {
  final Rx<int> selectedIndex = 0.obs;

  final screens = [
    const AgentHome(),
    const ApplicationScreen(),
    const TaskManagerScreen(),
  ];
}

class NavItem extends StatelessWidget {
  final IconData icon;
  final String label;
  final bool isSelected;
  final VoidCallback onTap;

  const NavItem({
    super.key,
    required this.icon,
    required this.label,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            icon,
            color: isSelected ? Colors.black : Colors.black54,
            size: 24,
          ),
          const SizedBox(height: 2),
          Text(
            label,
            style: TextStyle(
              fontSize: 12,
              color: isSelected ? Colors.black : Colors.black54,
              fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
            ),
          ),
        ],
      ),
    );
  }
}
