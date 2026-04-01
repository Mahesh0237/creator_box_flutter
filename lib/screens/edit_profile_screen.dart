import 'package:flutter/material.dart';
import '../theme.dart';
import 'my_campaigns_screen.dart';

class EditProfileScreen extends StatelessWidget {
  const EditProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF9F9F9),
      body: Stack(
        children: [
          // Scrollable Content
          SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 64), // Space for sticky header
                
                // Cinematic Hero Section
                Container(
                  height: 530,
                  width: double.infinity,
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('assets/958a2ad3c3bb83f4c0dc07abae4041cf19a63f93.png'), // julian_hero
                      fit: BoxFit.cover,
                    ),
                  ),
                  child: Container(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [
                          Colors.transparent,
                          const Color(0xFF1A1C1C).withOpacity(0.8),
                        ],
                        stops: const [0.5, 1.0],
                      ),
                    ),
                    padding: const EdgeInsets.all(32),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                          decoration: const BoxDecoration(
                            color: Color(0xFFBC0100),
                          ),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Container(
                                width: 6,
                                height: 6,
                                decoration: const BoxDecoration(
                                  color: Colors.white,
                                  shape: BoxShape.circle,
                                ),
                              ),
                              const SizedBox(width: 8),
                              Text(
                                'EDITORIAL CHOICE',
                                style: AppTypography.interBold.copyWith(
                                  color: Colors.white,
                                  fontSize: 10,
                                  letterSpacing: 2,
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(height: 24),
                        Text(
                          "JULIAN'S STORY:\nCRAFTING NARRATIVES",
                          style: AppTypography.headlineMedium.copyWith(
                            color: Colors.white,
                            fontSize: 40,
                            fontWeight: FontWeight.w900,
                            height: 0.9,
                            letterSpacing: -2.0,
                          ),
                        ),
                        const SizedBox(height: 16),
                        Text(
                          'Focusing on the intersection of\ntechnology and human experience.',
                          style: AppTypography.interMedium.copyWith(
                            color: Colors.white.withOpacity(0.8),
                            fontSize: 14,
                            height: 1.4,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),

                // Main Content
                Padding(
                  padding: const EdgeInsets.all(24),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Profile Identity Section
                      Row(
                        children: [
                          Container(
                            width: 80,
                            height: 80,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              border: Border.all(color: const Color(0xFFBC0100).withOpacity(0.1), width: 4),
                              image: const DecorationImage(
                                image: AssetImage('assets/6b7e299092c24885dc600a8208b47bf7dcd2e995.png'), // user_avatar_edit
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          const SizedBox(width: 24),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'JULIAN MARTINEZ',
                                  style: AppTypography.headlineSmall.copyWith(
                                    color: const Color(0xFF1A1C1C),
                                    fontWeight: FontWeight.w900,
                                    letterSpacing: -0.5,
                                  ),
                                ),
                                const SizedBox(height: 4),
                                Row(
                                  children: [
                                    const Icon(Icons.verified, color: Color(0xFFBC0100), size: 16),
                                    const SizedBox(width: 4),
                                    Text(
                                      'VERIFIED CREATOR',
                                      style: AppTypography.interBold.copyWith(
                                        color: const Color(0xFFBC0100),
                                        fontSize: 10,
                                        letterSpacing: 1,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      
                      const SizedBox(height: 48),

                      // Navigation Button: My Campaigns
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => const MyCampaignsScreen()),
                          );
                        },
                        child: Container(
                          width: double.infinity,
                          padding: const EdgeInsets.all(24),
                          decoration: BoxDecoration(
                            color: const Color(0xFF1A1C1C),
                            borderRadius: BorderRadius.circular(4),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'MY CAMPAIGNS',
                                    style: AppTypography.interBold.copyWith(
                                      color: Colors.white,
                                      fontSize: 12,
                                      letterSpacing: 2,
                                    ),
                                  ),
                                  const SizedBox(height: 4),
                                  Text(
                                    'Manage active & past narratives',
                                    style: AppTypography.interMedium.copyWith(
                                      color: Colors.white.withOpacity(0.6),
                                      fontSize: 12,
                                    ),
                                  ),
                                ],
                              ),
                              const Icon(Icons.arrow_forward_ios, color: Colors.white, size: 16),
                            ],
                          ),
                        ),
                      ),

                      const SizedBox(height: 32),

                      // Bento Grid: Stats
                      const Text(
                        'PERFORMANCE NARRATIVE',
                        style: TextStyle(
                          fontFamily: 'Inter',
                          fontWeight: FontWeight.w700,
                          fontSize: 12,
                          color: Color(0xFF603E39),
                          letterSpacing: 2.4,
                        ),
                      ),
                      const SizedBox(height: 16),
                      const _BentoGridStats(),

                      const SizedBox(height: 48),

                      // Section: Social Channels
                      const Text(
                        'CONNECTED CHANNELS',
                        style: TextStyle(
                          fontFamily: 'Inter',
                          fontWeight: FontWeight.w700,
                          fontSize: 12,
                          color: Color(0xFF603E39),
                          letterSpacing: 2.4,
                        ),
                      ),
                      const SizedBox(height: 16),
                      const _SocialChannelTile(
                        platform: 'YouTube',
                        handle: '@julian_cine',
                        stats: '224K SUBS',
                        icon: Icons.play_circle_fill,
                      ),
                      const _SocialChannelTile(
                        platform: 'Instagram',
                        handle: '@j_martinez',
                        stats: '84K FOLLOWERS',
                        icon: Icons.camera_alt,
                      ),
                      const _SocialChannelTile(
                        platform: 'TikTok',
                        handle: '@julian.raw',
                        stats: '412K FOLLOWERS',
                        icon: Icons.music_note,
                      ),

                      const SizedBox(height: 120), // Bottom padding
                    ],
                  ),
                ),
              ],
            ),
          ),

          // Sticky Top Header
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: Container(
              height: 64,
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.8),
                border: Border(bottom: BorderSide(color: Colors.white.withOpacity(0.3))),
              ),
              child: ClipRRect(
                child: BackdropFilter(
                  filter: ColorFilter.mode(Colors.white.withOpacity(0.8), BlendMode.srcOver),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 24),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            const Icon(Icons.menu, color: Color(0xFF1A1C1C), size: 16),
                            const SizedBox(width: 16),
                            Text(
                              'CREATOR BOX',
                              style: AppTypography.interBold.copyWith(
                                color: const Color(0xFFDC2626),
                                fontSize: 20,
                                letterSpacing: -1,
                              ),
                            ),
                          ],
                        ),
                        Container(
                          width: 40,
                          height: 40,
                          padding: const EdgeInsets.all(2),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12),
                            border: Border.all(color: const Color(0xFFBC0100).withOpacity(0.1), width: 2),
                          ),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(10),
                            child: Image.asset(
                              'assets/6b7e299092c24885dc600a8208b47bf7dcd2e995.png', // user_avatar_edit
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _BentoGridStats extends StatelessWidget {
  const _BentoGridStats();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Expanded(
              child: _StatTile(
                label: 'FOLLOWERS',
                value: '1.2M',
                trend: '+12.5%',
                color: const Color(0xFFF3F3F3),
              ),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: _StatTile(
                label: 'ENGAGEMENT',
                value: '4.2%',
                trend: '+8.2%',
                color: const Color(0xFFF3F3F3),
              ),
            ),
          ],
        ),
        const SizedBox(height: 16),
        _StatTile(
          label: 'TOTAL REACH',
          value: '15.4M',
          trend: '+15.8%',
          color: const Color(0xFFF3F3F3),
          isFullWidth: true,
        ),
      ],
    );
  }
}

class _StatTile extends StatelessWidget {
  final String label;
  final String value;
  final String trend;
  final Color color;
  final bool isFullWidth;

  const _StatTile({
    required this.label,
    required this.value,
    required this.trend,
    required this.color,
    this.isFullWidth = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(4),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                label,
                style: AppTypography.interBold.copyWith(
                  color: const Color(0xFF603E39),
                  fontSize: 10,
                  letterSpacing: 1,
                ),
              ),
              Text(
                trend,
                style: AppTypography.interBold.copyWith(
                  color: const Color(0xFF16A34A),
                  fontSize: 10,
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          Text(
            value,
            style: AppTypography.headlineSmall.copyWith(
              color: const Color(0xFF1A1C1C),
              fontWeight: FontWeight.w900,
              fontSize: 24,
            ),
          ),
        ],
      ),
    );
  }
}

class _SocialChannelTile extends StatelessWidget {
  final String platform;
  final String handle;
  final String stats;
  final IconData icon;

  const _SocialChannelTile({
    required this.platform,
    required this.handle,
    required this.stats,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(4),
        border: Border.all(color: const Color(0xFFF3F3F3)),
      ),
      child: Row(
        children: [
          Icon(icon, color: const Color(0xFF1A1C1C), size: 24),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  platform,
                  style: AppTypography.interBold.copyWith(
                    color: const Color(0xFF1A1C1C),
                    fontSize: 14,
                  ),
                ),
                Text(
                  handle,
                  style: AppTypography.interMedium.copyWith(
                    color: const Color(0xFF603E39),
                    fontSize: 12,
                  ),
                ),
              ],
            ),
          ),
          Text(
            stats,
            style: AppTypography.interBold.copyWith(
              color: const Color(0xFFBC0100),
              fontSize: 10,
              letterSpacing: 1,
            ),
          ),
        ],
      ),
    );
  }
}
