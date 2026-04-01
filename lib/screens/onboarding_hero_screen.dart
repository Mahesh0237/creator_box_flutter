import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../theme.dart';
import '../widgets/primary_button.dart';
import '../widgets/pagination_indicator.dart';

class OnboardingHeroScreen extends StatelessWidget {
  final VoidCallback onContinue;
  final VoidCallback onSkip;

  const OnboardingHeroScreen({
    super.key,
    required this.onContinue,
    required this.onSkip,
  });

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle.light,
      child: Scaffold(
        backgroundColor: AppColors.backgroundLight,
        body: Stack(
          children: [
            // Background Image
            Positioned.fill(
              child: Image.asset(
                'assets/onboarding_hero.png',
                fit: BoxFit.cover,
              ),
            ),
            // Deep Red Gradient Overlay
            Positioned.fill(
              child: Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      Colors.black.withOpacity(0.4),
                      const Color(0x99BC000C), // Deep red with opacity
                      const Color(0xFF1A1C1C), // Darker at bottom
                    ],
                    stops: const [0.0, 0.5, 1.0],
                  ),
                ),
              ),
            ),
            // Content Area
            SafeArea(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  // Header
                  Padding(
                    padding: const EdgeInsets.all(24.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        TextButton(
                          onPressed: onSkip,
                          child: Text(
                            'SKIP',
                            style: AppTextStyles.headingBold(
                              14,
                            ).copyWith(letterSpacing: 1.4),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const Spacer(),
                  // Glassmorphic Container
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 32.0),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(4),
                      child: BackdropFilter(
                        filter: ImageFilter.blur(sigmaX: 12, sigmaY: 12),
                        child: Container(
                          padding: const EdgeInsets.all(33),
                          decoration: BoxDecoration(
                            color: AppColors.glassWhite,
                            border: Border.all(color: AppColors.glassBorder),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text(
                                'Create.\nInfluence.\nEarn.',
                                style: AppTextStyles.headingBlack(48).copyWith(
                                  shadows: [
                                    const Shadow(
                                      offset: Offset(0, 4),
                                      blurRadius: 12,
                                      color: Color(0x4D000000),
                                    ),
                                  ],
                                ),
                              ),
                              const SizedBox(height: 24),
                              Text(
                                "Turn your audience into income with the world's most powerful editorial tools.",
                                style: AppTextStyles.bodyMedium(
                                  18,
                                ).copyWith(
                                  color: Colors.white.withOpacity(0.9),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 48),
                  // Actions Area
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 32.0),
                    child: Column(
                      children: [
                        PrimaryButton(
                          text: 'Continue',
                          onPressed: onContinue,
                          width: 240,
                          iconPath: 'assets/forward_arrow.svg',
                        ),
                        const SizedBox(height: 40),
                        const PaginationIndicator(activeIndex: 0),
                      ],
                    ),
                  ),
                  const SizedBox(height: 64),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
