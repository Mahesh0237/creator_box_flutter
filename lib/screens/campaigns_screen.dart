import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../theme.dart';

class CampaignsScreen extends StatefulWidget {
  const CampaignsScreen({super.key});

  @override
  State<CampaignsScreen> createState() => _CampaignsScreenState();
}

class _CampaignsScreenState extends State<CampaignsScreen> {
  String _selectedPlatform = 'ALL';

  final List<Map<String, dynamic>> _campaigns = [
    {
      'imagePath': 'assets/campaign_razer.png',
      'title': 'RAZER GAMING ACCESSORIES COLLECTION',
      'brand': 'RAZER',
      'price': r'$1,500 - $3,000',
      'tag': 'NEW',
      'platform': 'YOUTUBE',
    },
    {
      'imagePath': 'assets/campaign_nike.png',
      'title': 'NIKE AIR MAX 2024 CAMPAIGN',
      'brand': 'NIKE',
      'price': r'$2,200 - $4,500',
      'tag': 'LIVE',
      'platform': 'INSTAGRAM',
    },
    {
      'imagePath': 'assets/campaign_dyson.png',
      'title': 'DYSON AIRWRAP STYLER REVIEW',
      'brand': 'DYSON',
      'price': r'$1,200 - $2,500',
      'tag': 'NEW',
      'platform': 'TIKTOK',
    },
    {
      'imagePath': 'assets/campaign_sony.png',
      'title': 'SONY ZV-E10 VLOGGING CAMERA',
      'brand': 'SONY',
      'price': r'$3,000 - $5,000',
      'tag': 'LIVE',
      'platform': 'YOUTUBE',
    },
    {
      'imagePath': 'assets/campaign_ordinary.png',
      'title': 'THE ORDINARY SKINCARE DUO',
      'brand': 'THE ORDINARY',
      'price': r'$800 - $1,500',
      'tag': 'LIVE',
      'platform': 'INSTAGRAM',
    },
    {
      'imagePath': 'assets/campaign_tesla.png',
      'title': 'TESLA MODEL 3 TECH REVIEW',
      'brand': 'TESLA',
      'price': r'$5,000 - $10,000',
      'tag': 'NEW',
      'platform': 'YOUTUBE',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(
          'CAMPAIGNS',
          style: AppTypography.labelLarge.copyWith(
            color: AppColors.textMain,
            fontWeight: FontWeight.w900,
            letterSpacing: 1.2,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0,
        leading: const Padding(
          padding: EdgeInsets.all(12.0),
          child: CircleAvatar(
            backgroundImage: AssetImage('assets/user_avatar_small.png'),
            radius: 16,
          ),
        ),
        actions: [
          IconButton(
            icon: SvgPicture.asset(
              'assets/back_arrow.svg', // Wait, Figma had a saved icon here, I'll use a placeholder or check
              width: 20,
              height: 20,
              colorFilter: const ColorFilter.mode(AppColors.textMain, BlendMode.srcIn),
            ),
            onPressed: () {},
          ),
        ],
      ),
      body: Column(
        children: [
          // Search Bar
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
            child: Row(
              children: [
                Expanded(
                  child: Container(
                    height: 48,
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    decoration: BoxDecoration(
                      color: const Color(0xFFF7F7F7),
                      borderRadius: BorderRadius.circular(24),
                    ),
                    child: Row(
                      children: [
                        const Icon(Icons.search, color: Color(0xFF956D67), size: 20),
                        const SizedBox(width: 8),
                        Text(
                          'Search campaigns...',
                          style: AppTypography.interMedium.copyWith(
                            color: const Color(0xFF956D67),
                            fontSize: 14,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(width: 12),
                Container(
                  height: 48,
                  width: 48,
                  decoration: const BoxDecoration(
                    color: AppColors.primaryRed,
                    shape: BoxShape.circle,
                  ),
                  child: const Icon(Icons.tune, color: Colors.white, size: 20),
                ),
              ],
            ),
          ),
          
          // Platform Chips
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 8),
            child: Row(
              children: [
                PlatformFilterChip(
                  label: 'ALL',
                  isSelected: _selectedPlatform == 'ALL',
                  onTap: () => setState(() => _selectedPlatform = 'ALL'),
                ),
                PlatformFilterChip(
                  label: 'YOUTUBE',
                  isSelected: _selectedPlatform == 'YOUTUBE',
                  onTap: () => setState(() => _selectedPlatform = 'YOUTUBE'),
                ),
                PlatformFilterChip(
                  label: 'INSTAGRAM',
                  isSelected: _selectedPlatform == 'INSTAGRAM',
                  onTap: () => setState(() => _selectedPlatform = 'INSTAGRAM'),
                ),
                PlatformFilterChip(
                  label: 'TIKTOK',
                  isSelected: _selectedPlatform == 'TIKTOK',
                  onTap: () => setState(() => _selectedPlatform = 'TIKTOK'),
                ),
              ],
            ),
          ),
          
          const SizedBox(height: 16),
          
          // Campaigns List
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              itemCount: _campaigns.length,
              itemBuilder: (context, index) {
                final campaign = _campaigns[index];
                if (_selectedPlatform != 'ALL' && campaign['platform'] != _selectedPlatform) {
                  return const SizedBox.shrink();
                }
                return CampaignMarketplaceCard(
                  imagePath: campaign['imagePath'],
                  title: campaign['title'],
                  brand: campaign['brand'],
                  price: campaign['price'],
                  tag: campaign['tag'],
                  onTap: () {},
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

class PlatformFilterChip extends StatelessWidget {
  final String label;
  final bool isSelected;
  final VoidCallback onTap;

  const PlatformFilterChip({
    super.key,
    required this.label,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.only(right: 12),
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
        decoration: BoxDecoration(
          color: isSelected ? const Color(0xFF1A1C1C) : Colors.white,
          borderRadius: BorderRadius.circular(24),
          border: Border.all(
            color: isSelected ? const Color(0xFF1A1C1C) : const Color(0xFFE5E5E5),
          ),
        ),
        child: Text(
          label,
          style: AppTypography.interBold.copyWith(
            color: isSelected ? Colors.white : const Color(0xFF603E39),
            fontSize: 10,
            letterSpacing: 1,
          ),
        ),
      ),
    );
  }
}

class CampaignMarketplaceCard extends StatelessWidget {
  final String imagePath;
  final String title;
  final String brand;
  final String price;
  final String tag;
  final VoidCallback onTap;

  const CampaignMarketplaceCard({
    super.key,
    required this.imagePath,
    required this.title,
    required this.brand,
    required this.price,
    required this.tag,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.only(bottom: 24),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(4),
          border: Border.all(color: const Color(0xFFF3F3F3)),
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
            Stack(
              children: [
                ClipRRect(
                  borderRadius: const BorderRadius.vertical(top: Radius.circular(4)),
                  child: Image.asset(
                    imagePath,
                    height: 200,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                ),
                Positioned(
                  top: 16,
                  right: 16,
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                    decoration: const BoxDecoration(
                      color: Color(0xFFBC0100),
                    ),
                    child: Text(
                      tag,
                      style: AppTypography.interBold.copyWith(
                        color: Colors.white,
                        fontSize: 10,
                        letterSpacing: 1,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    brand.toUpperCase(),
                    style: AppTypography.interBold.copyWith(
                      color: const Color(0xFFBC0100),
                      fontSize: 10,
                      letterSpacing: 1.5,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    title,
                    style: AppTypography.headlineSmall.copyWith(
                      color: const Color(0xFF1A1C1C),
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      letterSpacing: -0.4,
                    ),
                  ),
                  const SizedBox(height: 16),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'ESTIMATED VALUE',
                            style: AppTypography.interMedium.copyWith(
                              color: const Color(0xFF603E39),
                              fontSize: 10,
                            ),
                          ),
                          Text(
                            price,
                            style: AppTypography.interBold.copyWith(
                              color: const Color(0xFF1A1C1C),
                              fontSize: 14,
                            ),
                          ),
                        ],
                      ),
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                        decoration: BoxDecoration(
                          color: const Color(0xFF1A1C1C),
                          borderRadius: BorderRadius.circular(4),
                        ),
                        child: Text(
                          'VIEW NARRATIVE',
                          style: AppTypography.interBold.copyWith(
                            color: Colors.white,
                            fontSize: 10,
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
      ),
    );
  }
}
