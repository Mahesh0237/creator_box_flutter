import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../theme.dart';
import '../widgets/campaign_widgets.dart';

class CampaignDetailScreen extends StatelessWidget {
  const CampaignDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundLight,
      body: Stack(
        children: [
          // 1. Scrollable Content
          SingleChildScrollView(
            padding: const EdgeInsets.only(bottom: 160), // Space for sticky CTA & Nav
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildHeader(context),
                _buildMainTitle(),
                _buildHeroImage(),
                _buildBriefSection(),
                _buildRequirementProfile(),
                _buildDeliverablesSection(),
                _buildBenefitsSection(),
                const SizedBox(height: 48),
              ],
            ),
          ),

          // 2. Anchored Bottom Navigation (Mobile Only design)
          _buildBottomNav(),

          // 3. Anchored Apply CTA
          _buildApplyCTA(),
        ],
      ),
    );
  }

  Widget _buildHeader(BuildContext context) {
    return SafeArea(
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 20),
        decoration: BoxDecoration(
          color: Colors.white.withValues(alpha: 0.8),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.04),
              blurRadius: 40,
              offset: const Offset(0, 12),
            ),
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                IconButton(
                  icon: SvgPicture.asset('assets/menu_icon.svg', width: 18),
                  onPressed: () {},
                ),
                const SizedBox(width: 16),
                Text(
                  "CREATOR BOX",
                  style: AppTypography.beVietnamProBlackItalic.copyWith(
                    fontSize: 24,
                    color: AppColors.primaryRed,
                    letterSpacing: -1.2,
                  ),
                ),
              ],
            ),
            Container(
              width: 40,
              height: 40,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                image: const DecorationImage(
                  image: AssetImage('assets/influencer_avatar_tech.png'),
                  fit: BoxFit.cover,
                ),
                border: Border.all(color: const Color(0x33EBBBB4)),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildMainTitle() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(32, 48, 32, 0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 13, vertical: 5),
                decoration: BoxDecoration(
                  color: const Color(0xFFF3F3F3),
                  borderRadius: BorderRadius.circular(2),
                  border: Border.all(color: const Color(0x1AEBBBB4)),
                ),
                child: Text(
                  "ID: TV-APG2-2024",
                  style: AppTypography.interBold.copyWith(
                    fontSize: 10,
                    color: AppColors.textDark,
                    letterSpacing: 1,
                  ),
                ),
              ),
              const SizedBox(width: 12),
              Container(
                width: 8,
                height: 8,
                decoration: const BoxDecoration(
                  color: AppColors.primaryRed,
                  shape: BoxShape.circle,
                ),
              ),
              const SizedBox(width: 4),
              Text(
                "ACTIVE NOW",
                style: AppTypography.interBold.copyWith(
                  fontSize: 10,
                  color: AppColors.primaryRed,
                  letterSpacing: 1,
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          Text(
            "ACOUSTIC PRO\nGEN 2 LAUNCH",
            style: AppTypography.beVietnamProBlack.copyWith(
              fontSize: 48,
              height: 0.9,
              color: AppColors.textDark,
              letterSpacing: -2.4,
            ),
          ),
          const SizedBox(height: 32),
          Text(
            "TOTAL BUDGET",
            style: AppTypography.interRegular.copyWith(
              fontSize: 12,
              color: AppColors.textBrown,
              letterSpacing: 2.4,
            ),
          ),
          Text(
            "₹45,000-60,000",
            style: AppTypography.beVietnamProBlack.copyWith(
              fontSize: 36,
              color: AppColors.textDark,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildHeroImage() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 32, horizontal: 32),
      child: Stack(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(4),
            child: Image.asset(
              'assets/campaign_acoustic_hero.png',
              width: double.infinity,
              height: 400,
              fit: BoxFit.cover,
            ),
          ),
          // Brand Overlay
          Positioned(
            left: 32,
            bottom: 32,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
              decoration: BoxDecoration(
                color: Colors.white.withValues(alpha: 0.9),
                borderRadius: BorderRadius.circular(2),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withValues(alpha: 0.1),
                    blurRadius: 25,
                    offset: const Offset(0, 8),
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "BRAND",
                    style: AppTypography.interRegular.copyWith(
                      fontSize: 10,
                      color: AppColors.textBrown,
                      letterSpacing: 1,
                    ),
                  ),
                  Text(
                    "TECHVIBE",
                    style: AppTypography.beVietnamProBold.copyWith(
                      fontSize: 20,
                      color: AppColors.textDark,
                      letterSpacing: -1,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildBriefSection() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 32),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(width: 32, height: 2, color: AppColors.primaryRed),
              const SizedBox(width: 16),
              Text(
                "CAMPAIGN BRIEF",
                style: AppTypography.beVietnamProBold.copyWith(
                  fontSize: 24,
                  letterSpacing: -0.6,
                  color: AppColors.textDark,
                ),
              ),
            ],
          ),
          const SizedBox(height: 24),
          Text(
            "We are launching the next generation of sound. TechVibe is looking for tech enthusiasts and audiophiles to showcase the revolutionary noise-cancellation and spatial audio features of the Acoustic Pro Gen 2. We want authentic storytelling that emphasizes premium build and uncompromised audio quality.",
            style: AppTypography.interRegular.copyWith(
              fontSize: 18,
              color: AppColors.textBrown,
              height: 1.6,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildRequirementProfile() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 48),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(width: 32, height: 2, color: AppColors.primaryRed),
              const SizedBox(width: 16),
              Text(
                "REQUIREMENT PROFILE",
                style: AppTypography.beVietnamProBold.copyWith(
                  fontSize: 24,
                  letterSpacing: -0.6,
                  color: AppColors.textDark,
                ),
              ),
            ],
          ),
          const SizedBox(height: 24),
          // Bento Grid (simplified for Mobile)
          const CampaignRequirementCard(
            title: "Audience Size",
            description: "Minimum 50k+ highly engaged followers across tech/lifestyle niches.",
            iconPath: 'assets/compass_icon.svg', // Reusing matching available SVG
          ),
          const SizedBox(height: 16),
          const CampaignRequirementCard(
            title: "Content Quality",
            description: "High-fidelity 4K production standards required for video content.",
            iconPath: 'assets/forward_arrow.svg', // Placeholder
          ),
          const SizedBox(height: 16),
          const CampaignRequirementCard(
            title: "Region",
            description: "Based in Tier 1 cities for product dispatch and event access.",
            iconPath: 'assets/back_arrow.svg', // Placeholder
          ),
          const SizedBox(height: 16),
          const CampaignRequirementCard(
            title: "Affinity",
            description: "Previous history of reviewing audio or high-end tech hardware.",
            iconPath: 'assets/google_logo.svg', // Placeholder
          ),
        ],
      ),
    );
  }

  Widget _buildDeliverablesSection() {
    return Container(
      width: double.infinity,
      color: const Color(0xFFF3F3F3),
      padding: const EdgeInsets.all(32),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(width: 32, height: 2, color: AppColors.primaryRed),
              const SizedBox(width: 16),
              Text(
                "DELIVERABLES",
                style: AppTypography.beVietnamProBold.copyWith(
                  fontSize: 24,
                  letterSpacing: -0.6,
                  color: AppColors.textDark,
                ),
              ),
            ],
          ),
          const SizedBox(height: 32),
          const CampaignDeliverableTile(
            title: "1x Dedicated YouTube Review",
            description: "Minimum 8 minutes, highlighting 3 key features.",
          ),
          const SizedBox(height: 24),
          const CampaignDeliverableTile(
            title: "2x Instagram Reels",
            description: "Cinematic B-roll focus with trending audio.",
          ),
          const SizedBox(height: 24),
          const CampaignDeliverableTile(
            title: "3x Twitter Threads",
            description: "Technical deep-dive on battery and ANC specs.",
          ),
        ],
      ),
    );
  }

  Widget _buildBenefitsSection() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 48),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(width: 32, height: 2, color: AppColors.primaryRed),
              const SizedBox(width: 16),
              Text(
                "BENEFITS",
                style: AppTypography.beVietnamProBold.copyWith(
                  fontSize: 24,
                  letterSpacing: -0.6,
                  color: AppColors.textDark,
                ),
              ),
            ],
          ),
          const SizedBox(height: 24),
          const CampaignBenefitCard(
            title: "Acoustic Pro Gen 2 Unit",
            subtitle: "(Keep)",
            value: "₹24,999",
          ),
          const SizedBox(height: 12),
          const CampaignBenefitCard(
            title: "Early Access to Firmware Beta",
            subtitle: "",
            trailing: Icon(Icons.check_circle, color: AppColors.primaryRed, size: 24),
          ),
          const SizedBox(height: 12),
          const CampaignBenefitCard(
            title: "Invitation to TechVibe Summit",
            subtitle: "",
            trailing: Icon(Icons.flash_on, color: AppColors.primaryRed, size: 24),
          ),
        ],
      ),
    );
  }

  Widget _buildApplyCTA() {
    return Positioned(
      bottom: 0,
      left: 0,
      right: 0,
      child: Container(
        padding: const EdgeInsets.fromLTRB(32, 25, 32, 24),
        decoration: BoxDecoration(
          color: Colors.white.withValues(alpha: 0.95),
          border: const Border(top: BorderSide(color: Color(0x33EBBBB4))),
          boxShadow: const [
            BoxShadow(
              color: Color(0x141A1C1C),
              blurRadius: 40,
              offset: Offset(0, -12),
            ),
          ],
        ),
        child: Container(
          height: 56,
          decoration: BoxDecoration(
            gradient: const LinearGradient(
              colors: [Color(0xFFBC0100), Color(0xFFBC000C)],
            ),
            borderRadius: BorderRadius.circular(2),
          ),
          child: Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "APPLY NOW",
                  style: AppTypography.beVietnamProBold.copyWith(
                    fontSize: 14,
                    color: Colors.white,
                    letterSpacing: 1.4,
                  ),
                ),
                const SizedBox(width: 12),
                const Icon(Icons.arrow_forward, color: Colors.white, size: 16),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildBottomNav() {
    return Positioned(
      bottom: 80, // Above Apply CTA
      left: 0,
      right: 0,
      child: Container(
        width: 390,
        padding: const EdgeInsets.symmetric(horizontal: 34, vertical: 14),
        decoration: BoxDecoration(
          color: Colors.white.withValues(alpha: 0.95),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.05),
              blurRadius: 10,
              offset: const Offset(0, -2),
            ),
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            _buildNavItem(Icons.feed_outlined, "FEED", false),
            _buildNavItem(Icons.campaign, "CAMPAIGNS", true),
            _buildNavItem(Icons.analytics_outlined, "ANALYTICS", false),
            _buildNavItem(Icons.mail_outline, "INBOX", false),
            _buildNavItem(Icons.person_outline, "PROFILE", false),
          ],
        ),
      ),
    );
  }

  Widget _buildNavItem(IconData icon, String label, bool isActive) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(
          icon,
          size: 18,
          color: isActive ? AppColors.primaryRed : const Color(0xFFA3A3A3),
        ),
        const SizedBox(height: 4),
        Text(
          label,
          style: AppTypography.interBold.copyWith(
            fontSize: 10,
            color: isActive ? AppColors.primaryRed : const Color(0xFFA3A3A3),
            letterSpacing: 1,
          ),
        ),
      ],
    );
  }
}
