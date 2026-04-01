import 'package:flutter/material.dart';
import '../theme.dart';
import 'my_campaigns_screen.dart';

class EditProfileScreen extends StatelessWidget {
  const EditProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF9F9F9),
      bottomNavigationBar: Container(
        padding: EdgeInsets.only(
          left: 24,
          right: 24,
          top: 16,
          bottom: MediaQuery.of(context).padding.bottom == 0 ? 16 : MediaQuery.of(context).padding.bottom,
        ),
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.05),
              blurRadius: 10,
              offset: const Offset(0, -4),
            ),
          ],
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Expanded(
              child: GestureDetector(
                onTap: () => Navigator.pop(context),
                child: Container(
                  height: 48,
                  decoration: const BoxDecoration(
                    color: Color(0xFFEBEBEB),
                  ),
                  alignment: Alignment.center,
                  child: Text(
                    'DISCARD',
                    style: AppTypography.interBold.copyWith(
                      color: const Color(0xFF1A1C1C),
                      fontSize: 12,
                      letterSpacing: 1,
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: GestureDetector(
                onTap: () {},
                child: Container(
                  height: 48,
                  decoration: const BoxDecoration(
                    color: AppColors.primaryRed,
                  ),
                  alignment: Alignment.center,
                  child: Text(
                    'SAVE CHANGES',
                    style: AppTypography.interBold.copyWith(
                      color: Colors.white,
                      fontSize: 12,
                      letterSpacing: 1,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      body: Stack(
        children: [
          // Scrollable Content
          SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: MediaQuery.of(context).padding.top + 64), // Space for sticky header
                
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

                      // Core Expertise Section
                      Container(
                        width: double.infinity,
                        padding: const EdgeInsets.all(24),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(4),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withValues(alpha: 0.02),
                              blurRadius: 10,
                              offset: const Offset(0, 4),
                            ),
                          ],
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'CORE EXPERTISE',
                              style: AppTypography.beVietnamProBlack.copyWith(
                                color: const Color(0xFF1A1C1C),
                                fontSize: 18,
                                fontStyle: FontStyle.italic,
                                letterSpacing: -0.5,
                              ),
                            ),
                            const SizedBox(height: 24),
                            Wrap(
                              spacing: 8,
                              runSpacing: 12,
                              children: [
                                const _ExpertiseChip(label: 'VISUAL ART', isSelected: true),
                                const _ExpertiseChip(label: 'CINEMATOGRAPHY', isSelected: false),
                                const _ExpertiseChip(label: 'CREATIVE DIR.', isSelected: false),
                                const _ExpertiseChip(label: 'STORYTELLING', isSelected: false),
                                Container(
                                  padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    border: Border.all(color: AppColors.primaryRed.withValues(alpha: 0.15)),
                                    borderRadius: BorderRadius.circular(2),
                                  ),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      const Icon(Icons.add, color: AppColors.primaryRed, size: 14),
                                      const SizedBox(width: 4),
                                      Text(
                                        'ADD NEW',
                                        style: AppTypography.interBold.copyWith(
                                          color: AppColors.primaryRed,
                                          fontSize: 10,
                                          letterSpacing: 1,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 32),
                            Text(
                              'Select up to 5 categories that define your visual brand voice.',
                              style: AppTypography.interMedium.copyWith(
                                color: const Color(0xFF603E39),
                                fontSize: 11,
                                height: 1.4,
                              ),
                            ),
                          ],
                        ),
                      ),
                      
                      const SizedBox(height: 24),
                      
                      const _SocialToggleCard(
                        icon: Icons.video_library_outlined,
                        title: 'YOUTUBE',
                        subtitle: 'VIDEO PORTFOLIO',
                        isActive: true,
                      ),
                      const _SocialToggleCard(
                        icon: Icons.camera_alt_outlined,
                        title: 'INSTAGRAM',
                        subtitle: 'VISUAL FEED',
                        isActive: true,
                      ),

                      const SizedBox(height: 80), // Bottom padding
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
              padding: EdgeInsets.only(top: MediaQuery.of(context).padding.top),
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.8),
                border: Border(bottom: BorderSide(color: Colors.white.withOpacity(0.3))),
              ),
              child: ClipRRect(
                child: BackdropFilter(
                  filter: ColorFilter.mode(Colors.white.withOpacity(0.8), BlendMode.srcOver),
                  child: SizedBox(
                    height: 64,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 24),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              GestureDetector(
                                onTap: () => Navigator.pop(context),
                                child: const Icon(Icons.arrow_back, color: Color(0xFF1A1C1C), size: 24),
                              ),
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
        ),
        ],
      ),
    );
  }
}

class _ExpertiseChip extends StatelessWidget {
  final String label;
  final bool isSelected;
  const _ExpertiseChip({required this.label, this.isSelected = false});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      decoration: BoxDecoration(
        color: isSelected ? AppColors.primaryRed : const Color(0xFFEBEBEB),
        borderRadius: BorderRadius.circular(2),
      ),
      child: Text(
        label,
        style: AppTypography.interBold.copyWith(
          color: isSelected ? Colors.white : const Color(0xFF1A1C1C),
          fontSize: 10,
          letterSpacing: 1,
        ),
      ),
    );
  }
}

class _SocialToggleCard extends StatelessWidget {
  final IconData icon;
  final String title;
  final String subtitle;
  final bool isActive;

  const _SocialToggleCard({
    required this.icon,
    required this.title,
    required this.subtitle,
    required this.isActive,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.only(bottom: 16),
      padding: const EdgeInsets.symmetric(vertical: 32, horizontal: 24),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(4),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.02),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: const Color(0xFFFFF4F4),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Icon(icon, color: AppColors.primaryRed, size: 24),
          ),
          const SizedBox(height: 16),
          Text(
            title,
            style: AppTypography.beVietnamProBlack.copyWith(
              color: const Color(0xFF1A1C1C),
              fontSize: 18,
              letterSpacing: -0.5,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            subtitle,
            style: AppTypography.interBold.copyWith(
              color: const Color(0xFF8A7470),
              fontSize: 10,
              letterSpacing: 1.5,
            ),
          ),
          const SizedBox(height: 24),
          Switch(
            value: isActive,
            onChanged: (val) {},
            activeColor: Colors.white,
            activeTrackColor: AppColors.primaryRed,
            inactiveThumbColor: Colors.white,
            inactiveTrackColor: const Color(0xFFE8E8E8),
          ),
        ],
      ),
    );
  }
}
