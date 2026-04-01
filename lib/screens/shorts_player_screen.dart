import 'package:flutter/material.dart';
import 'dart:ui';
import '../theme.dart';

class ShortsPlayerScreen extends StatelessWidget {
  const ShortsPlayerScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        children: [
          // 1. Full-Bleed Immersive Video Background
          _buildVideoBackground(),
          
          // 2. Gradient Overlays for Readability
          _buildGradients(),
          
          // 3. Main Content Layer
          _buildContentLayer(context),
          
          // 4. Floating Actions (Right Side)
          _buildFloatingActions(),
          
          // 5. Header (Top Nav)
          _buildHeader(context),
        ],
      ),
    );
  }

  Widget _buildVideoBackground() {
    return Positioned.fill(
      child: Image.asset(
        'assets/shorts_immersive_bg.png',
        fit: BoxFit.cover,
      ),
    );
  }

  Widget _buildGradients() {
    return Stack(
      children: [
        // Top Gradient
        Positioned(
          top: 0,
          left: 0,
          right: 0,
          height: 200,
          child: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Colors.black.withValues(alpha: 0.7),
                  Colors.transparent,
                ],
              ),
            ),
          ),
        ),
        // Bottom Gradient
        Positioned(
          bottom: 0,
          left: 0,
          right: 0,
          height: 600,
          child: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.bottomCenter,
                end: Alignment.topCenter,
                colors: [
                  Colors.black.withValues(alpha: 0.95),
                  Colors.black.withValues(alpha: 0.6),
                  Colors.transparent,
                ],
                stops: const [0, 0.3, 1],
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildHeader(BuildContext context) {
    return SafeArea(
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                IconButton(
                  icon: const Icon(Icons.arrow_back, color: Colors.white),
                  onPressed: () => Navigator.pop(context),
                ),
                const SizedBox(width: 16),
                Text(
                  "Visual Storytelling".toUpperCase(),
                  style: AppTypography.beVietnamProBold.copyWith(
                    fontSize: 12,
                    color: Colors.white.withValues(alpha: 0.8),
                    letterSpacing: 2.4,
                  ),
                ),
              ],
            ),
            const Icon(Icons.more_vert, color: Colors.white),
          ],
        ),
      ),
    );
  }

  Widget _buildContentLayer(BuildContext context) {
    return Positioned(
      bottom: 40,
      left: 32,
      right: 32,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Creator Info
          Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Container(
                width: 56,
                height: 56,
                padding: const EdgeInsets.all(4),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(color: Colors.white.withValues(alpha: 0.1), width: 2),
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: Image.asset('assets/creative_nexus_avatar.png', fit: BoxFit.cover),
                ),
              ),
              const SizedBox(width: 16),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "@creative_nexus".toUpperCase(),
                    style: AppTypography.beVietnamProBlack.copyWith(
                      fontSize: 24,
                      color: Colors.white,
                      letterSpacing: -1.2,
                    ),
                  ),
                  Text(
                    "840K Subscribers".toUpperCase(),
                    style: AppTypography.interRegular.copyWith(
                      fontSize: 10,
                      color: Colors.white.withValues(alpha: 0.5),
                      letterSpacing: 2,
                    ),
                  ),
                ],
              ),
            ],
          ),
          
          const SizedBox(height: 24),
          
          // Video Description
          SizedBox(
            width: 250,
            child: RichText(
              text: TextSpan(
                style: AppTypography.interMedium.copyWith(
                  fontSize: 16,
                  color: Colors.white,
                  height: 1.6,
                ),
                children: [
                  const TextSpan(text: "This one simple edit hack changed how I view visual storytelling forever. "),
                  TextSpan(
                    text: "Don't skip the last 5 seconds.",
                    style: AppTypography.interBold.copyWith(color: const Color(0xFFEB0000)),
                  ),
                ],
              ),
            ),
          ),
          
          const SizedBox(height: 32),
          
          // Glassmorphism Insight Note
          _buildInsightNote(),
          
          const SizedBox(height: 32),
          
          // Apply This Idea Button
          _buildApplyButton(),
        ],
      ),
    );
  }

  Widget _buildInsightNote() {
    return ClipRect(
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 12, sigmaY: 12),
        child: Container(
          padding: const EdgeInsets.all(24),
          decoration: BoxDecoration(
            color: Colors.white.withValues(alpha: 0.03),
            border: Border.all(color: AppColors.primaryRed.withValues(alpha: 0.5)),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Trending Insight • Editorial Note".toUpperCase(),
                        style: AppTypography.interBold.copyWith(
                          fontSize: 9,
                          color: const Color(0xFFEB0000),
                          letterSpacing: 1.8,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        "Strong Hook detected in\nfirst 2s",
                        style: AppTypography.beVietnamProBold.copyWith(
                          fontSize: 18,
                          color: Colors.white,
                          height: 1.2,
                          letterSpacing: -0.45,
                        ),
                      ),
                    ],
                  ),
                  const Icon(Icons.insights, color: Colors.white, size: 24),
                ],
              ),
              const SizedBox(height: 12),
              Text(
                "High retention spike correlates with rapid\nvisual transitions in the introduction phase.",
                style: AppTypography.interMedium.copyWith(
                  fontSize: 11,
                  color: Colors.white.withValues(alpha: 0.6),
                  height: 1.6,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildApplyButton() {
    return Container(
      width: double.infinity,
      height: 64,
      decoration: BoxDecoration(
        color: AppColors.primaryRed,
        boxShadow: [
          BoxShadow(
            color: AppColors.primaryRed.withValues(alpha: 0.4),
            blurRadius: 30,
            spreadRadius: 5,
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "Apply This Idea".toUpperCase(),
            style: AppTypography.interBold.copyWith(
              fontSize: 12,
              color: Colors.white,
              letterSpacing: 3.6,
            ),
          ),
          const SizedBox(width: 16),
          const Icon(Icons.arrow_forward_ios, color: Colors.white, size: 14),
        ],
      ),
    );
  }

  Widget _buildFloatingActions() {
    return Positioned(
      bottom: 128,
      right: 24,
      child: Column(
        children: [
          _buildActionButton(Icons.favorite, "124K", hasHalo: true),
          const SizedBox(height: 32),
          _buildActionButton(Icons.chat_bubble_outline, "1.2K"),
          const SizedBox(height: 32),
          _buildActionButton(Icons.share_outlined, "Share"),
          const SizedBox(height: 32),
          _buildActionButton(Icons.bookmark_border, "Save"),
        ],
      ),
    );
  }

  Widget _buildActionButton(IconData icon, String label, {bool hasHalo = false}) {
    return Column(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(12),
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 12, sigmaY: 12),
            child: Container(
              width: 52,
              height: 52,
              decoration: BoxDecoration(
                color: Colors.white.withValues(alpha: 0.03),
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: Colors.white.withValues(alpha: 0.1)),
                boxShadow: hasHalo ? [
                  BoxShadow(
                    color: AppColors.primaryRed.withValues(alpha: 0.3),
                    blurRadius: 15,
                  )
                ] : null,
              ),
              child: Icon(icon, color: Colors.white, size: 20),
            ),
          ),
        ),
        const SizedBox(height: 8),
        Text(
          label.toUpperCase(),
          style: AppTypography.interBold.copyWith(
            fontSize: 9,
            color: Colors.white.withValues(alpha: 0.6),
            letterSpacing: 1.8,
          ),
        ),
      ],
    );
  }
}
