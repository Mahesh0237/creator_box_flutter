import 'package:flutter/material.dart';
import '../widgets/home_widgets.dart';
import '../theme.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFBFBFB),
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        toolbarHeight: 80,
        title: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Row(
            children: [
              Container(
                width: 48,
                height: 48,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  image: DecorationImage(
                    image: AssetImage('assets/profile_placeholder.png'),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              const Expanded(child: SizedBox()),
              IconButton(
                icon: const Icon(
                  Icons.notifications_none,
                  color: AppColors.textMain,
                ),
                onPressed: () {},
              ),
              const SizedBox(width: 8),
              IconButton(
                icon: const Icon(Icons.search, color: AppColors.textMain),
                onPressed: () {},
              ),
            ],
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 24),
            // Campaigns Section
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'CAMPAIGNS FOR YOU',
                    style: AppTypography.labelLarge.copyWith(
                      color: AppColors.textMain,
                      fontWeight: FontWeight.w900,
                      letterSpacing: 1.2,
                    ),
                  ),
                  Text(
                    'VIEW ALL',
                    style: AppTypography.labelLarge.copyWith(
                      color: AppColors.primaryRed,
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 16),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Row(
                children: [
                  CampaignCard(
                    title: 'ELENA VORKOVA FOR WINTER COLLECTION',
                    price: r'$1,200',
                    matchPercentage: '98',
                    description:
                        'Explore our latest winter collection with Elena Vorkova.',
                    onApply: () {},
                  ),
                  CampaignCard(
                    title: 'TECH UNBOXING SERIES 2024',
                    price: r'$850',
                    matchPercentage: '92',
                    description: 'A deep dive into upcoming tech gadgets.',
                    onApply: () {},
                  ),
                ],
              ),
            ),

            const SizedBox(height: 48),
            // Brands Section
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Text(
                'COLLECTIONS BY BRANDS',
                style: AppTypography.labelLarge.copyWith(
                  color: AppColors.textMain,
                  fontWeight: FontWeight.w900,
                  letterSpacing: 1.2,
                ),
              ),
            ),
            const SizedBox(height: 16),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: GridView.count(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                crossAxisCount: 2,
                mainAxisSpacing: 16,
                crossAxisSpacing: 16,
                childAspectRatio: 156 / 150,
                children: const [
                  BrandCard(
                    name: 'Velo Sport',
                    activeBriefs: 12,
                    logoPath: 'assets/velo_sport_logo.png',
                  ),
                  BrandCard(
                    name: 'Temporal',
                    activeBriefs: 8,
                    logoPath: 'assets/temporal_logo.png',
                  ),
                  BrandCard(
                    name: 'Haus Design',
                    activeBriefs: 5,
                    logoPath: 'assets/haus_design_logo.png',
                  ),
                  BrandCard(
                    name: 'Sonic Aura',
                    activeBriefs: 10,
                    logoPath: 'assets/sonic_aura_logo.png',
                  ),
                ],
              ),
            ),

            const SizedBox(height: 48),
            // Trending Section
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Text(
                'TRENDING IN YOUR NICHE',
                style: AppTypography.labelLarge.copyWith(
                  color: AppColors.textMain,
                  fontWeight: FontWeight.w900,
                  letterSpacing: 1.2,
                ),
              ),
            ),
            const SizedBox(height: 16),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 24),
              child: TrendingVideoCard(
                title: 'MASTERING LIFESTYLE PHOTOGRAPHY',
                insight: 'High Engagement Rate',
                description:
                    'Discover how to capture stunning lifestyle moments that resonate with your audience.',
                reach: '150K',
                category: 'Photography',
                thumbnailPath: 'assets/trending_video_1.png',
              ),
            ),
            const SizedBox(height: 40),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 24),
              child: TrendingVideoCard(
                title: 'THE FUTURE OF SMART HOMES',
                insight: 'Viral Potential',
                description:
                    'A look at the latest smart home technologies transforming our daily lives.',
                reach: '210K',
                category: 'Tech',
                thumbnailPath: 'assets/trending_video_2.png',
              ),
            ),
            const SizedBox(height: 32),
          ],
        ),
      ),
    );
  }
}
