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
    'Strategy',
    'Editing',
    'Growth',
    'Monetization',
    'Equipment',
    'Scripting',
  ];

  @override
  Widget build(BuildContext context) {
    if (_selectedCategory == 'Trending') {
      return CreatorsScreen(
        onBack: () => setState(() => _selectedCategory = 'All'),
      );
    }

    return Scaffold(
      backgroundColor: const Color(0xFFF9F9F9),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Custom Header
              Container(
                color: Colors.white,
                padding: const EdgeInsets.symmetric(
                  horizontal: 24,
                  vertical: 16,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        IconButton(
                          padding: EdgeInsets.zero,
                          constraints: const BoxConstraints(),
                          icon: const Icon(
                            Icons.menu,
                            color: Color(0xFF1A1C1C),
                            size: 24,
                          ),
                          onPressed: () {},
                        ),
                        const SizedBox(width: 16),
                        Text(
                          'Video Hub',
                          style: AppTypography.interBold.copyWith(
                            color: AppColors.primaryRed,
                            fontSize: 24,
                            letterSpacing: -0.6,
                            fontWeight: FontWeight.w900,
                          ),
                        ),
                      ],
                    ),
                    IconButton(
                      padding: EdgeInsets.zero,
                      constraints: const BoxConstraints(),
                      icon: const Icon(
                        Icons.search,
                        color: Color(0xFF1A1C1C),
                        size: 24,
                      ),
                      onPressed: () {},
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 16),

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

              const SizedBox(height: 24),

              // Hero Section
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: HeroVideoCard(
                  title: 'space using three-point lighting techniques.',
                  thumbnailPath: 'assets/cinematography_hero.png',
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const LandscapePlayerScreen(),
                      ),
                    );
                  },
                ),
              ),

              const SizedBox(height: 32),

              // Recent Masterclasses Section
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      'Recent\nMasterclasses',
                      style: AppTypography.beVietnamProBlack.copyWith(
                        color: const Color(0xFF1A1C1C),
                        fontSize: 30,
                        height: 1.2,
                        letterSpacing: -0.75,
                      ),
                    ),
                    GestureDetector(
                      onTap: () {},
                      child: Padding(
                        padding: const EdgeInsets.only(bottom: 8.0),
                        child: Row(
                          children: [
                            Text(
                              'View\nAll',
                              textAlign: TextAlign.right,
                              style: AppTypography.interBold.copyWith(
                                color: const Color(0xFFBC0100),
                                fontSize: 14,
                                height: 1.2,
                              ),
                            ),
                            const SizedBox(width: 4),
                            const Icon(
                              Icons.chevron_right,
                              color: Color(0xFFBC0100),
                              size: 16,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 24),

              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: Column(
                  children: [
                    MasterclassCard(
                      title: 'The Hidden Psychology of Color Grading in Narrative Film',
                      thumbnailPath: 'assets/short_thumb_1.png', // Mock image
                      duration: '14:20',
                      views: '124K views',
                      timeAgo: '2 days ago',
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const VideoAnalysisScreen(),
                          ),
                        );
                      },
                    ),
                    const SizedBox(height: 32),
                    MasterclassCard(
                      title: 'Speed Up Your Workflow: 10 DaVinci Resolve Hacks',
                      thumbnailPath: 'assets/landscape_cinematic_bg.png', // Mock image
                      duration: '08:45',
                      views: '89K views',
                      timeAgo: '5 days ago',
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const VideoAnalysisScreen(),
                          ),
                        );
                      },
                    ),
                    const SizedBox(height: 32),
                    MasterclassCard(
                      title: 'Sound Design Basics: How to Audio-Mix for Social Media',
                      thumbnailPath: 'assets/cinematography_hero.png', // Mock image
                      duration: '21:10',
                      views: '56K views',
                      timeAgo: '1 week ago',
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const VideoAnalysisScreen(),
                          ),
                        );
                      },
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 48),

              // Shorts Section
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Icon(
                      Icons.bolt,
                      color: AppColors.primaryRed,
                      size: 32,
                    ),
                    const SizedBox(width: 8),
                    Expanded(
                      child: Text(
                        'Quick Insights\n(Shorts)',
                        style: AppTypography.beVietnamProBlack.copyWith(
                          color: const Color(0xFF1A1C1C),
                          fontSize: 30,
                          height: 1.2,
                          letterSpacing: -0.75,
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 24),

              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: GridView.count(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  crossAxisCount: 2,
                  mainAxisSpacing: 16,
                  crossAxisSpacing: 16,
                  childAspectRatio: 0.6, // Aspect ratio approx 167/289
                  children: [
                    ShortCard(
                      title: 'Thumbnail Secret Revealed!',
                      views: '1.2M views',
                      thumbnailPath: 'assets/short_thumb_1.png', // Mock image
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const ShortsPlayerScreen(),
                          ),
                        );
                      },
                    ),
                    ShortCard(
                      title: 'Stop using generic intros!',
                      views: '840K views',
                      thumbnailPath: 'assets/short_thumb_2.png', // Mock image
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const ShortsPlayerScreen(),
                          ),
                        );
                      },
                    ),
                    ShortCard(
                      title: 'The 3-second hook rule',
                      views: '2.5M views',
                      thumbnailPath: 'assets/shorts_immersive_bg.png', // Mock image
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const ShortsPlayerScreen(),
                          ),
                        );
                      },
                    ),
                    ShortCard(
                      title: 'My Desk Setup for 2024',
                      views: '310K views',
                      thumbnailPath: 'assets/landscape_cinematic_bg.png', // Mock image
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const ShortsPlayerScreen(),
                          ),
                        );
                      },
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 48), // Bottom padding for navbar
            ],
          ),
        ),
      ),
    );
  }
}
