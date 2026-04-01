import 'package:flutter/material.dart';
import 'dart:ui';
import '../theme.dart';

class CampaignsScreen extends StatefulWidget {
  const CampaignsScreen({super.key});

  @override
  State<CampaignsScreen> createState() => _CampaignsScreenState();
}

class _CampaignsScreenState extends State<CampaignsScreen> {
  String _selectedPlatform = 'All Platforms';

  final List<Map<String, dynamic>> _campaigns = [
    {
      'imagePath': 'assets/campaign_razer.png',
      'category': 'TECH & LIFESTYLE',
      'match': '98% Match',
      'title': 'Razer: Stealth Series\nLaunch',
      'brand': 'Razer Global',
      'budget': r'$5,000 - $8,500',
      'deadline': 'Oct 24, 2024',
    },
    {
      'imagePath': 'assets/campaign_nike.png',
      'category': 'SPORTS & FITNESS',
      'match': '92% Match',
      'title': 'Nike: HyperSpeed\nCampaign',
      'brand': 'Nike Europe',
      'budget': r'$3,200 - $5,000',
      'deadline': 'Nov 12, 2024',
    },
    {
      'imagePath': 'assets/campaign_dyson.png',
      'category': 'HOME & DESIGN',
      'match': '85% Match',
      'title': 'Dyson: Pure Air Series',
      'brand': 'Dyson LTD',
      'budget': r'$8,000 - $12,000',
      'deadline': 'Oct 30, 2024',
    },
    {
      'imagePath': 'assets/campaign_sony.png',
      'category': 'AUDIO & TECH',
      'match': '81% Match',
      'title': 'Sony: XM5 Masterclass',
      'brand': 'Sony Electronics',
      'budget': r'$4,500 - $6,500',
      'deadline': 'Nov 05, 2024',
    },
    {
      'imagePath': 'assets/campaign_ordinary.png',
      'category': 'SKINCARE & HEALTH',
      'match': '79% Match',
      'title': 'The Ordinary: Science\nof Glow',
      'brand': 'DECIEM',
      'budget': r'$1,500 - $3,000',
      'deadline': 'Dec 01, 2024',
    },
    {
      'imagePath': 'assets/campaign_tesla.png',
      'category': 'AUTOMOTIVE & FUTURE',
      'match': '74% Match',
      'title': 'Tesla: Model 3 Refresh',
      'brand': 'Tesla Inc.',
      'budget': r'$15,000 - $25,000',
      'deadline': 'Nov 15, 2024',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF9F9F9),
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: AppColors.primaryRed),
          onPressed: () {},
        ),
        title: Text(
          'Creator Box',
          style: AppTypography.beVietnamProBlack.copyWith(
            color: AppColors.primaryRed,
            fontSize: 24,
            letterSpacing: -1.2,
          ),
        ),
        titleSpacing: 0,
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 32.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Header & Hero Title
              Text(
                'Campaigns\nMarketplace',
                style: AppTypography.beVietnamProBlack.copyWith(
                  color: AppColors.textMain,
                  fontSize: 36,
                  height: 1.1,
                  letterSpacing: -0.9,
                ),
              ),
              const SizedBox(height: 8),
              Text(
                'Discover 124 opportunities matched to your\naudience metrics.',
                style: AppTypography.interMedium.copyWith(
                  color: const Color(0xFF603E39),
                  fontSize: 16,
                  height: 1.5,
                ),
              ),
              const SizedBox(height: 32),

              // Saved Searches & Create Brief Buttons
              Row(
                children: [
                  Expanded(
                    child: Container(
                      height: 48,
                      decoration: BoxDecoration(
                        color: const Color(0xFFE8E8E8),
                        borderRadius: BorderRadius.circular(4),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Icon(Icons.bookmark_border, size: 16, color: AppColors.textMain),
                          const SizedBox(width: 8),
                          Text(
                            'Saved\nSearches',
                            textAlign: TextAlign.center,
                            style: AppTypography.interBold.copyWith(
                              color: AppColors.textMain,
                              fontSize: 14,
                              height: 1.2,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Container(
                      height: 48,
                      decoration: BoxDecoration(
                        color: AppColors.primaryRed,
                        borderRadius: BorderRadius.circular(4),
                        boxShadow: [
                          BoxShadow(
                            color: AppColors.primaryRed.withValues(alpha: 0.2),
                            blurRadius: 15,
                            offset: const Offset(0, 10),
                          ),
                        ],
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Icon(Icons.add, size: 16, color: Colors.white),
                          const SizedBox(width: 8),
                          Text(
                            'Create\nBrief',
                            textAlign: TextAlign.center,
                            style: AppTypography.interBold.copyWith(
                              color: Colors.white,
                              fontSize: 14,
                              height: 1.2,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 32),

              // Search Bar
              Container(
                height: 56,
                padding: const EdgeInsets.symmetric(horizontal: 16),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Row(
                  children: [
                    const Icon(Icons.search, color: Color(0xFF6B7280), size: 18),
                    const SizedBox(width: 12),
                    Expanded(
                      child: Text(
                        'Search brands, products, or niches...',
                        style: AppTypography.interRegular.copyWith(
                          color: const Color(0xFF6B7280),
                          fontSize: 16,
                        ),
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 16),

              // Platform Filters
              Wrap(
                spacing: 12,
                runSpacing: 12,
                children: [
                  _PlatformFilterChip(
                    label: 'All Platforms',
                    isSelected: _selectedPlatform == 'All Platforms',
                    onTap: () => setState(() => _selectedPlatform = 'All Platforms'),
                  ),
                  _PlatformFilterChip(
                    label: 'YouTube',
                    icon: Icons.play_circle_outline,
                    isSelected: _selectedPlatform == 'YouTube',
                    onTap: () => setState(() => _selectedPlatform = 'YouTube'),
                  ),
                  _PlatformFilterChip(
                    label: 'Instagram',
                    icon: Icons.camera_alt_outlined,
                    isSelected: _selectedPlatform == 'Instagram',
                    onTap: () => setState(() => _selectedPlatform = 'Instagram'),
                  ),
                  _PlatformFilterChip(
                    label: 'TikTok',
                    icon: Icons.music_note_outlined,
                    isSelected: _selectedPlatform == 'TikTok',
                    onTap: () => setState(() => _selectedPlatform = 'TikTok'),
                  ),
                ],
              ),
              const SizedBox(height: 32),

              // Campaign Cards
              ..._campaigns.map((campaign) {
                return _CampaignCard(
                  imagePath: campaign['imagePath'],
                  category: campaign['category'],
                  matchPercentage: campaign['match'],
                  title: campaign['title'],
                  brand: campaign['brand'],
                  budget: campaign['budget'],
                  deadline: campaign['deadline'],
                );
              }),
            ],
          ),
        ),
      ),
    );
  }
}

class _PlatformFilterChip extends StatelessWidget {
  final String label;
  final IconData? icon;
  final bool isSelected;
  final VoidCallback onTap;

  const _PlatformFilterChip({
    required this.label,
    this.icon,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 56,
        padding: const EdgeInsets.symmetric(horizontal: 24),
        decoration: BoxDecoration(
          color: isSelected ? AppColors.primaryRed : Colors.white,
          borderRadius: BorderRadius.circular(4),
          border: isSelected ? null : Border.all(color: const Color(0xFF956D67).withValues(alpha: 0.1)),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            if (icon != null) ...[
              Icon(
                icon,
                size: 18,
                color: isSelected ? Colors.white : const Color(0xFF603E39),
              ),
              const SizedBox(width: 8),
            ],
            Text(
              label,
              style: AppTypography.interBold.copyWith(
                color: isSelected ? Colors.white : const Color(0xFF603E39),
                fontSize: 16,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _CampaignCard extends StatelessWidget {
  final String imagePath;
  final String category;
  final String matchPercentage;
  final String title;
  final String brand;
  final String budget;
  final String deadline;

  const _CampaignCard({
    required this.imagePath,
    required this.category,
    required this.matchPercentage,
    required this.title,
    required this.brand,
    required this.budget,
    required this.deadline,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 32),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
        boxShadow: [
          BoxShadow(
            color: const Color(0xFF1A1C1C).withValues(alpha: 0.04),
            blurRadius: 40,
            offset: const Offset(0, 12),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Header Image & Overlay
          Stack(
            children: [
              ClipRRect(
                borderRadius: const BorderRadius.vertical(top: Radius.circular(8)),
                child: Image.asset(
                  imagePath,
                  height: 224,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
              ),
              Positioned(
                top: 16,
                right: 16,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(4),
                  child: BackdropFilter(
                    filter: ImageFilter.blur(sigmaX: 6, sigmaY: 6),
                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                      decoration: BoxDecoration(
                        color: Colors.white.withValues(alpha: 0.9),
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          const Icon(Icons.local_fire_department, size: 14, color: AppColors.primaryRed),
                          const SizedBox(width: 4),
                          Text(
                            matchPercentage,
                            style: AppTypography.interBold.copyWith(
                              color: AppColors.primaryRed,
                              fontSize: 14,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),

          // Content section
          Padding(
            padding: const EdgeInsets.all(24.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Category & Bookmark
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      category,
                      style: AppTypography.interBold.copyWith(
                        color: AppColors.primaryRed,
                        fontSize: 10,
                        letterSpacing: 1.0,
                      ),
                    ),
                    const Icon(Icons.bookmark_border, size: 18, color: AppColors.textMain),
                  ],
                ),
                const SizedBox(height: 8),

                // Title
                Text(
                  title,
                  style: AppTypography.beVietnamProBlack.copyWith(
                    color: AppColors.textMain,
                    fontSize: 24,
                    height: 1.25,
                  ),
                ),
                const SizedBox(height: 8),

                // Brand
                Row(
                  children: [
                    const Icon(Icons.campaign_outlined, size: 16, color: Color(0xFF603E39)),
                    const SizedBox(width: 8),
                    Text(
                      brand,
                      style: AppTypography.interMedium.copyWith(
                        color: const Color(0xFF603E39),
                        fontSize: 14,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 24),

                // Specs Container
                Container(
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  decoration: BoxDecoration(
                    border: Border.symmetric(
                      horizontal: BorderSide(
                        color: const Color(0xFFEBBBB4).withValues(alpha: 0.1),
                      ),
                    ),
                  ),
                  child: Row(
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'BUDGET RANGE',
                              style: AppTypography.interBold.copyWith(
                                color: const Color(0xFF603E39),
                                fontSize: 11,
                                letterSpacing: -0.55,
                              ),
                            ),
                            const SizedBox(height: 4),
                            Text(
                              budget,
                              style: AppTypography.interBold.copyWith(
                                color: AppColors.textMain,
                                fontSize: 18,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'DEADLINE',
                              style: AppTypography.interBold.copyWith(
                                color: const Color(0xFF603E39),
                                fontSize: 11,
                                letterSpacing: -0.55,
                              ),
                            ),
                            const SizedBox(height: 4),
                            Text(
                              deadline,
                              style: AppTypography.interBold.copyWith(
                                color: AppColors.primaryRed,
                                fontSize: 18,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 24),

                // Footer Row
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        const Icon(Icons.ondemand_video_outlined, size: 20, color: Color(0xFF603E39)),
                        const SizedBox(width: 12),
                        const Icon(Icons.image_outlined, size: 20, color: Color(0xFF603E39)),
                      ],
                    ),
                    ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.primaryRed,
                        foregroundColor: Colors.white,
                        elevation: 0,
                        padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 12),
                        minimumSize: const Size(0, 48),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(4),
                        ),
                      ),
                      child: Text(
                        'Apply Now',
                        style: AppTypography.interBold.copyWith(
                          fontSize: 16,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
