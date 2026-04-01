import 'package:flutter/material.dart';
import '../theme.dart';
import '../widgets/analysis_widgets.dart';

class VideoAnalysisScreen extends StatelessWidget {
  const VideoAnalysisScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundLight,
      body: SafeArea(
        child: Column(
          children: [
            // Header
            _buildHeader(context),
            
            Expanded(
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 32.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Video Player Placeholder
                      _buildVideoPlayer(),
                      
                      const SizedBox(height: 32),
                      
                      // Case Study Label & Title
                      _buildTitleSection(),
                      
                      const SizedBox(height: 24),
                      
                      // Metrics Grid
                      _buildMetricsGrid(),
                      
                      const SizedBox(height: 32),
                      
                      // Why This Video Works
                      _buildInsightsSection(),
                      
                      const SizedBox(height: 32),
                      
                      // CTA Card
                      _buildCTACard(),
                      
                      const SizedBox(height: 32),
                      
                      // Similar Analysis
                      _buildSimilarAnalysis(),
                      
                      // Bottom Spacer
                      const SizedBox(height: 100),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildHeader(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
      decoration: BoxDecoration(
        color: Colors.white.withValues(alpha: 0.95),
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
                icon: const Icon(Icons.arrow_back),
                onPressed: () => Navigator.pop(context),
                padding: EdgeInsets.zero,
                constraints: const BoxConstraints(),
              ),
              const SizedBox(width: 16),
              Text(
                "CREATOR BOX",
                style: AppTypography.headlineLarge.copyWith(
                  fontSize: 24,
                  letterSpacing: -1.2,
                  color: AppColors.primaryRed,
                ),
              ),
            ],
          ),
          Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(
              color: const Color(0xFFE8E8E8),
              borderRadius: BorderRadius.circular(12),
              border: Border.all(color: const Color(0x33EBBBB4)),
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Image.asset(
                'assets/influencer_profile_avatar.png',
                fit: BoxFit.cover,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildVideoPlayer() {
    return Container(
      width: double.infinity,
      height: 200,
      decoration: BoxDecoration(
        color: Colors.black,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.25),
            blurRadius: 50,
            spreadRadius: -12,
            offset: const Offset(0, 25),
          ),
        ],
      ),
      child: Stack(
        alignment: Alignment.center,
        children: [
          Opacity(
            opacity: 0.8,
            child: Image.asset(
              'assets/case_study_thumbnail.png',
              width: double.infinity,
              height: double.infinity,
              fit: BoxFit.cover,
            ),
          ),
          // Play Button Overlay
          Container(
            width: 80,
            height: 80,
            color: AppColors.primaryRed,
            child: const Icon(Icons.play_arrow, color: Colors.white, size: 40),
          ),
          // Seekbar
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
              height: 6,
              color: const Color(0xFF262626),
              child: Row(
                children: [
                  Expanded(
                    flex: 1,
                    child: Container(
                      height: 6,
                      decoration: const BoxDecoration(
                        color: AppColors.primaryRed,
                        boxShadow: [
                          BoxShadow(color: AppColors.primaryRed, blurRadius: 15),
                        ],
                      ),
                    ),
                  ),
                  const Expanded(flex: 2, child: SizedBox()),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTitleSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
          color: const Color(0xFFE8E8E8),
          child: Text(
            "Case Study #222".toUpperCase(),
            style: AppTypography.interBold.copyWith(
              fontSize: 10,
              color: AppColors.textBrown,
              letterSpacing: 1,
            ),
          ),
        ),
        const SizedBox(height: 12),
        Text(
          "Mastering the Art of\nDigital Storytelling",
          style: AppTypography.beVietnamProBlack.copyWith(
            fontSize: 36,
            color: AppColors.textDark,
            height: 1.1,
            letterSpacing: -1.8,
          ),
        ),
        const SizedBox(height: 16),
        // Creator Row
        Row(
          children: [
            Container(
              width: 48,
              height: 48,
              color: const Color(0xFFF3F3F3),
              child: Image.asset('assets/arjun_mehta_avatar.png', fit: BoxFit.cover),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Arjun Mehta",
                    style: AppTypography.interBold.copyWith(fontSize: 16, color: AppColors.textDark),
                  ),
                  Text(
                    "Creative Director • Pro Creator".toUpperCase(),
                    style: AppTypography.interMedium.copyWith(
                      fontSize: 10,
                      color: AppColors.textBrown,
                      letterSpacing: 1.2,
                    ),
                  ),
                ],
              ),
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
              color: const Color(0xFFE8E8E8),
              child: Text(
                "Follow".toUpperCase(),
                style: AppTypography.interBold.copyWith(
                  fontSize: 12,
                  color: AppColors.textDark,
                  letterSpacing: 1.2,
                ),
              ),
            ),
          ],
        ),
        const SizedBox(height: 24),
        // Share/Save buttons
        Row(
          children: [
            _buildIconButton(Icons.share_outlined),
            const SizedBox(width: 8),
            _buildIconButton(Icons.bookmark_border),
          ],
        ),
      ],
    );
  }

  Widget _buildIconButton(IconData icon) {
    return Container(
      width: 48,
      height: 48,
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: const Color(0x1AEBBBB4)),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.05),
            blurRadius: 2,
            offset: const Offset(0, 1),
          ),
        ],
      ),
      child: Icon(icon, color: AppColors.textDark, size: 20),
    );
  }

  Widget _buildMetricsGrid() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        GridView.count(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          crossAxisCount: 2,
          mainAxisSpacing: 16,
          crossAxisSpacing: 16,
          childAspectRatio: 1.2,
          children: const [
            AnalysisMetricCard(label: "Views", value: "124K", trend: "+12%", isPrimary: true),
            AnalysisMetricCard(label: "Retention", value: "68%"),
            AnalysisMetricCard(label: "CTR", value: "8.4%"),
            AnalysisMetricCard(label: "Engagement", value: "12K"),
          ],
        ),
      ],
    );
  }

  Widget _buildInsightsSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Why This Video Works",
          style: AppTypography.beVietnamProBlack.copyWith(
            fontSize: 24,
            color: AppColors.textDark,
            letterSpacing: -0.6,
          ),
        ),
        const SizedBox(height: 24),
        const InsightCard(
          title: "The Hook Strategy",
          description: 'Arjun utilizes a "reversal of expectation" within the first 3 seconds, resulting in a 15% higher initial retention.',
          icon: Icons.lightbulb_outline,
        ),
        const SizedBox(height: 24),
        const InsightCard(
          title: "Visual Pacing",
          description: "Dynamic scene transitions every 4.2 seconds maintain high cognitive engagement without fatiguing the viewer.",
          icon: Icons.auto_awesome,
        ),
      ],
    );
  }

  Widget _buildCTACard() {
    return Container(
      width: double.infinity,
      color: AppColors.primaryRed,
      padding: const EdgeInsets.all(32),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "READY TO\nELEVATE?".toUpperCase(),
            style: AppTypography.beVietnamProBlack.copyWith(
              fontSize: 30,
              color: Colors.white,
              height: 1,
              letterSpacing: -1.5,
            ),
          ),
          const SizedBox(height: 16),
          Text(
            "Download the exact storyboard and color grading LUTs used in this production.",
            style: AppTypography.interMedium.copyWith(
              fontSize: 14,
              color: Colors.white.withValues(alpha: 0.9),
              height: 1.6,
            ),
          ),
          const SizedBox(height: 24),
          Container(
            width: double.infinity,
            padding: const EdgeInsets.symmetric(vertical: 16),
            color: Colors.white,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Apply This Style".toUpperCase(),
                  style: AppTypography.beVietnamProBlack.copyWith(
                    fontSize: 16,
                    color: AppColors.primaryRed,
                    letterSpacing: 1.6,
                  ),
                ),
                const SizedBox(width: 8),
                const Icon(Icons.arrow_forward_ios, size: 16, color: AppColors.primaryRed),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSimilarAnalysis() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "Similar Analysis".toUpperCase(),
              style: AppTypography.beVietnamProBlack.copyWith(
                fontSize: 20,
                color: AppColors.textDark,
                letterSpacing: -0.5,
              ),
            ),
            Text(
              "View All".toUpperCase(),
              style: AppTypography.interBold.copyWith(
                fontSize: 12,
                color: AppColors.primaryRed,
                letterSpacing: 1.2,
              ),
            ),
          ],
        ),
        const SizedBox(height: 24),
        const SimilarAnalysisTile(
          thumbnail: 'assets/similar_analysis_1.png',
          title: "Dynamic Lighting for Interviews",
          metadata: "86K • 12:40",
        ),
        const SizedBox(height: 16),
        const SimilarAnalysisTile(
          thumbnail: 'assets/similar_analysis_2.png',
          title: "Product B-Roll Masterclass",
          metadata: "52K • 08:15",
        ),
        const SizedBox(height: 16),
        const SimilarAnalysisTile(
          thumbnail: 'assets/similar_analysis_3.png',
          title: "Color Theory in Visual Arts",
          metadata: "91K • 15:00",
        ),
      ],
    );
  }
}
