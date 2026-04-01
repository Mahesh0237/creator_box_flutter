import 'package:flutter/material.dart';
import '../theme.dart';

class SharedAppBar extends StatelessWidget implements PreferredSizeWidget {
  const SharedAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.white,
      elevation: 0,
      toolbarHeight: 72,
      titleSpacing: 24, // Matches the horizontal padding of the rest of the screens
      title: Row(
        children: [
          Image.asset('assets/Creator-Box-logo.png', height: 48), // Increased size
          const Expanded(child: SizedBox()),
          IconButton(
            icon: const Icon(
              Icons.notifications_none,
              color: AppColors.textMain,
              size: 28,
            ),
            onPressed: () {},
          ),
          const SizedBox(width: 8),
          IconButton(
            icon: const Icon(
              Icons.search,
              color: AppColors.textMain,
              size: 28,
            ),
            onPressed: () {},
          ),
        ],
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(72);
}
