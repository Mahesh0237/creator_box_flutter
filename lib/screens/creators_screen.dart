import 'package:flutter/material.dart';
import '../widgets/creators_widgets.dart';
import '../theme.dart';

class CreatorsScreen extends StatelessWidget {
  final VoidCallback onBack;

  const CreatorsScreen({
    super.key,
    required this.onBack,
  });

  @override
  Widget build(BuildContext context) {
    // Mock Data based on Figma Design
    final List<Map<String, dynamic>> topCreators = [
      {'name': 'Tania Svit', 'category': 'LIFESTYLE', 'engagement': '4.8%', 'avatar': 'assets/profile_avatar_large.png', 'rank': 1},
      {'name': 'Leo Kosta', 'category': 'TECH', 'engagement': '4.2%', 'avatar': 'assets/user_avatar_small.png', 'rank': 2},
      {'name': 'Maya Elly', 'category': 'BEAUTY', 'engagement': '3.9%', 'avatar': 'assets/profile_placeholder.png', 'rank': 3},
      {'name': 'Elias Thorne', 'category': 'GAMING', 'engagement': '3.5%', 'avatar': 'assets/profile_placeholder.png', 'rank': 4},
      {'name': 'Dara Lynn', 'category': 'VLOGS', 'engagement': '3.1%', 'avatar': 'assets/profile_placeholder.png', 'rank': 5},
    ];

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Custom Header
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 20),
                child: Row(
                  children: [
                    GestureDetector(
                      onTap: onBack,
                      child: Container(
                        padding: const EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(color: AppColors.grayBorder, width: 1),
                        ),
                        child: const Icon(Icons.arrow_back, color: AppColors.textMain, size: 20),
                      ),
                    ),
                    const SizedBox(width: 16),
                    Text(
                      'WEEKLY GIANTS',
                      style: AppTypography.interBold.copyWith(
                        color: AppColors.textMain,
                        fontSize: 24,
                        letterSpacing: -0.5,
                        fontWeight: FontWeight.w900,
                      ),
                    ),
                    const Spacer(),
                    IconButton(
                      icon: const Icon(Icons.share_outlined, color: AppColors.textMain, size: 24),
                      onPressed: () {},
                    ),
                  ],
                ),
              ),

              // Podium Section
              Container(
                width: double.infinity,
                padding: const EdgeInsets.symmetric(vertical: 20),
                child: CreatorPodium(
                  first: topCreators[0],
                  second: topCreators[1],
                  third: topCreators[2],
                ),
              ),

              const SizedBox(height: 32),

              // List Section
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'MOST ENGAGING CREATORS',
                      style: AppTypography.interBold.copyWith(
                        color: AppColors.textMain,
                        fontSize: 12,
                        letterSpacing: 1.2,
                        fontWeight: FontWeight.w900,
                      ),
                    ),
                    const SizedBox(height: 20),
                    ...List.generate(topCreators.length, (index) {
                      return CreatorListTile(
                        creator: topCreators[index],
                        rank: index + 1,
                      );
                    }),
                  ],
                ),
              ),

              const SizedBox(height: 40),
            ],
          ),
        ),
      ),
    );
  }
}
