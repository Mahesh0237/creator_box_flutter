import 'package:flutter/material.dart';
import '../widgets/video_hub_widgets.dart';
import 'creators_screen.dart';
import 'video_analysis_screen.dart';
import 'shorts_player_screen.dart';
import 'landscape_player_screen.dart';
import '../theme.dart';

class VideoHubScreen extends StatefulWidget {
  const VideoHubScreen({super.key});

  @override
  State<VideoHubScreen> createState() => _VideoHubScreenState();
}

class _VideoHubScreenState extends State<VideoHubScreen> {
  String _selectedCategory = 'All';
  final List<String> _categories = [
    'All',
    'Shorts',
    'Trending',
    'Gaming',
    'Tech',
    'Music',
  ];

  @override
  Widget build(BuildContext context) {
    if (_selectedCategory == 'Trending') {
      return CreatorsScreen(
        onBack: () => setState(() => _selectedCategory = 'All'),
      );
    }

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        toolbarHeight: 0, // We'll build a custom header in the body
      ),
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
                    Container(
                      width: 44,
                      height: 44,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(color: AppColors.grayBorder, width: 1.5),
                        image: const DecorationImage(
                          image: AssetImage('assets/profile_placeholder.png'),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    const SizedBox(width: 16),
                    Text(
                      'VIDEO HUB',
                      style: AppTypography.interBold.copyWith(
                        color: AppColors.textMain,
                        fontSize: 24,
                        letterSpacing: -0.5,
                        fontWeight: FontWeight.w900,
                      ),
                    ),
                    const Spacer(),
                    IconButton(
                      icon: const Icon(Icons.notifications_none, color: AppColors.textMain, size: 28),
                      onPressed: () {},
                    ),
                  ],
                ),
              ),

              // Search Bar
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: Container(
                  height: 52,
                  decoration: BoxDecoration(
                    color: AppColors.searchBackground,
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: 'Search for creative ideas...',
                      hintStyle: AppTypography.interMedium.copyWith(
                        color: AppColors.hintText,
                        fontSize: 14,
                      ),
                      prefixIcon: const Icon(
                        Icons.search,
                        color: AppColors.hintText,
                        size: 22,
                      ),
                      border: InputBorder.none,
                      contentPadding: const EdgeInsets.symmetric(vertical: 16),
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 24),

              // Categories
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: Row(
                  children: _categories.map((category) {
                    return CategoryChip(
                      label: category,
                      isSelected: _selectedCategory == category,
                      onTap: () => setState(() => _selectedCategory = category),
                    );
                  }).toList(),
                ),
              ),

              const SizedBox(height: 32),

              // Collections Section
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'COLLECTIONS FOR YOU',
                      style: AppTypography.interBold.copyWith(
                        color: AppColors.textMain,
                        fontSize: 12,
                        letterSpacing: 1.2,
                        fontWeight: FontWeight.w900,
                      ),
                    ),
                    const SizedBox(height: 20),
                    VideoHeroCard(
                      title: 'CINEMATOGRAPHY FOR BEGINNERS MASTERCLASS',
                      thumbnailPath: 'assets/cinematography_hero.png',
                      duration: '15:20',
                      views: '45K VIEWS',
                      timeAgo: '2 DAYS AGO',
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => const VideoAnalysisScreen()),
                        );
                      },
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 40),

              // Trending Section
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: Text(
                  'VIDEO TRENDS',
                  style: AppTypography.interBold.copyWith(
                    color: AppColors.textMain,
                    fontSize: 12,
                    letterSpacing: 1.2,
                    fontWeight: FontWeight.w900,
                  ),
                ),
              ),
              const SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: GridView.count(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  crossAxisCount: 2,
                  mainAxisSpacing: 16,
                  crossAxisSpacing: 16,
                  childAspectRatio: 156 / 210,
                  children: [
                    VideoTrendingCard(
                      title: 'VISUAL STORYTELLING HACKS',
                      views: '840K VIEWS',
                      thumbnailPath: 'assets/shorts_immersive_bg.png', // Reusing background as thumb
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => const ShortsPlayerScreen()),
                        );
                      },
                    ),
                    VideoTrendingCard(
                      title: 'AI EVOLUTION BREAKDOWN',
                      views: '85K VIEWS',
                      thumbnailPath: 'assets/landscape_cinematic_bg.png',
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => const LandscapePlayerScreen()),
                        );
                      },
                    ),
                    VideoTrendingCard(
                      title: 'COLOR GRADE MASTERCLASS',
                      views: '64K VIEWS',
                      thumbnailPath: 'assets/short_thumb_1.png',
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => const VideoAnalysisScreen()),
                        );
                      },
                    ),
                    VideoTrendingCard(
                      title: 'LIGHTING SETUP SECRETS',
                      views: '150K VIEWS',
                      thumbnailPath: 'assets/short_thumb_2.png',
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => const VideoAnalysisScreen()),
                        );
                      },
                    ),
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
