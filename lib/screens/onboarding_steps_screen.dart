import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../theme.dart';
import '../widgets/primary_button.dart';
import '../widgets/pagination_indicator.dart';

class OnboardingStepsScreen extends StatelessWidget {
  final VoidCallback onContinue;
  final VoidCallback onSkip;
  final VoidCallback onBack;

  const OnboardingStepsScreen({
    super.key,
    required this.onContinue,
    required this.onSkip,
    required this.onBack,
  });

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle.dark,
      child: Scaffold(
        backgroundColor: AppColors.backgroundLight,
        body: Stack(
          children: [
            // Background Glows
            Positioned(
              top: -100,
              right: -50,
              child: Container(
                width: 300,
                height: 300,
                decoration: BoxDecoration(
                  color: AppColors.primaryRed.withOpacity(0.08),
                  shape: BoxShape.circle,
                ),
                child: BackdropFilter(
                  filter: ImageFilter.blur(sigmaX: 80, sigmaY: 80),
                  child: Container(color: Colors.transparent),
                ),
              ),
            ),
            SafeArea(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  // Header
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 24,
                      vertical: 16,
                    ),
                    child: SizedBox(
                      height: 60,
                      child: Stack(
                        alignment: Alignment.center,
                        children: [
                          Align(
                            alignment: Alignment.centerLeft,
                            child: IconButton(
                              onPressed: onBack,
                              icon: SvgPicture.asset(
                                'assets/back_arrow.svg',
                                width: 16,
                                height: 16,
                                colorFilter: const ColorFilter.mode(
                                  AppColors.primaryRed,
                                  BlendMode.srcIn,
                                ),
                              ),
                            ),
                          ),
                          Image.asset(
                            'assets/Creator-Box-logo.png',
                            height: 48,
                          ),
                          Align(
                            alignment: Alignment.centerRight,
                            child: TextButton(
                              onPressed: onSkip,
                              child: Text(
                                'SKIP',
                                style: AppTextStyles.headingBold(
                                  14,
                                  color: AppColors.primaryRed,
                                ).copyWith(letterSpacing: 1.4),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const Spacer(),
                  // Stacked Cards Container
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 24.0),
                    child: AspectRatio(
                      aspectRatio: 0.82,
                      child: Stack(
                        alignment: Alignment.center,
                        children: [
                          // Card 3: Deepest Layer (Get Paid)
                          Transform.translate(
                            offset: const Offset(0, 48),
                            child: Transform.scale(
                              scale: 0.82,
                              child: _buildCard(
                                title: 'Get paid',
                                subtitle:
                                    'Instant settlements for your\ncreativity.',
                                iconPath: 'assets/payment_icon.svg',
                                opacity: 0.3,
                              ),
                            ),
                          ),
                          // Card 2: Middle Layer (Collaborate)
                          Transform.translate(
                            offset: const Offset(0, 24),
                            child: Transform.scale(
                              scale: 0.91,
                              child: _buildCard(
                                title: 'Collaborate',
                                subtitle:
                                    'Connect with world-class brands\ndirectly.',
                                iconPath: 'assets/collaboration_icon.svg',
                                opacity: 0.6,
                              ),
                            ),
                          ),
                          // Card 1: Top Layer (Discover)
                          _buildCard(
                            title: 'Discover\ncampaigns',
                            subtitle:
                                'Access exclusive briefs tailored\nto your unique visual style.',
                            iconPath: 'assets/discover_icon.svg',
                            opacity: 1.0,
                            showBadge: true,
                          ),
                        ],
                      ),
                    ),
                  ),
                  const Spacer(),
                  // CTA Area
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 24.0),
                    child: Column(
                      children: [
                        PrimaryButton(
                          text: 'Continue',
                          onPressed: onContinue,
                          width: 240,
                          iconPath: 'assets/forward_arrow.svg',
                        ),
                        const SizedBox(height: 32),
                        Column(
                          children: [
                            Text(
                              'SWIPE TO EXPLORE',
                              style:
                                  AppTextStyles.bodySemiBold(
                                    12,
                                    color: AppColors.textBrown,
                                  ).copyWith(
                                    letterSpacing: 2.4,
                                    color: AppColors.textBrown.withOpacity(0.4),
                                  ),
                            ),
                            const SizedBox(height: 12),
                            Container(
                              width: 1.5,
                              height: 40,
                              decoration: BoxDecoration(
                                gradient: LinearGradient(
                                  colors: [
                                    AppColors.primaryRed,
                                    AppColors.primaryRed.withOpacity(0),
                                  ],
                                  begin: Alignment.topCenter,
                                  end: Alignment.bottomCenter,
                                ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 32),
                        const PaginationIndicator(
                          activeIndex: 1,
                          activeColor: AppColors.primaryRed,
                          inactiveColor: Color(0xFFE5E5E5),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 40),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCard({
    required String title,
    required String subtitle,
    required String iconPath,
    required double opacity,
    bool showBadge = false,
  }) {
    return Opacity(
      opacity: opacity,
      child: Container(
        padding: const EdgeInsets.all(28),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color: const Color(0x0F000000)),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.06 * opacity),
              offset: const Offset(0, 10),
              blurRadius: 30,
            ),
            BoxShadow(
              color: AppColors.primaryRed.withOpacity(0.12 * opacity),
              offset: const Offset(0, 24),
              blurRadius: 48,
              spreadRadius: -12,
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: AppColors.primaryRed.withOpacity(0.08),
                    shape: BoxShape.circle,
                  ),
                  child: SvgPicture.asset(
                    iconPath,
                    width: 24,
                    height: 24,
                    colorFilter: const ColorFilter.mode(
                      AppColors.primaryRed,
                      BlendMode.srcIn,
                    ),
                  ),
                ),
                if (showBadge)
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 12,
                      vertical: 6,
                    ),
                    decoration: BoxDecoration(
                      color: const Color(0xFFFFECEB),
                      borderRadius: BorderRadius.circular(100),
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Container(
                          width: 6,
                          height: 6,
                          decoration: const BoxDecoration(
                            color: AppColors.primaryRed,
                            shape: BoxShape.circle,
                          ),
                        ),
                        const SizedBox(width: 8),
                        Text(
                          'LIVE NOW',
                          style: AppTextStyles.bodyBold(
                            10,
                            color: AppColors.primaryRed,
                          ).copyWith(letterSpacing: 0.5),
                        ),
                      ],
                    ),
                  ),
              ],
            ),
            const SizedBox(height: 32),
            Text(
              title,
              style: AppTextStyles.headingBold(
                32,
                color: AppColors.textDark,
              ).copyWith(height: 1.1),
            ),
            const SizedBox(height: 14),
            Text(
              subtitle,
              style: AppTextStyles.bodyRegular(
                16,
                color: AppColors.textBrown,
              ).copyWith(height: 1.5),
            ),
          ],
        ),
      ),
    );
  }
}
