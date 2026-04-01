import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../theme.dart';
import '../widgets/primary_button.dart';
import '../widgets/pagination_indicator.dart';

class OnboardingGrowthScreen extends StatelessWidget {
  final VoidCallback onGetStarted;
  final VoidCallback onLogin;
  final VoidCallback onSkip;
  final VoidCallback onBack;

  const OnboardingGrowthScreen({
    super.key,
    required this.onGetStarted,
    required this.onLogin,
    required this.onSkip,
    required this.onBack,
  });

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle.light,
      child: Scaffold(
        backgroundColor: AppColors.backgroundLight,
        body: Stack(
          children: [
            // Background Texture
            Positioned.fill(
              child: Opacity(
                opacity: 0.1, // or 0.03 as per Figma
                child: Image.asset(
                  'assets/onboarding_texture.png',
                  repeat: ImageRepeat.repeat,
                  width: 512,
                  height: 512,
                ),
              ),
            ),
            Column(
              children: [
                // Top Cinematic Illustration Section
                Expanded(
                  flex: 43,
                  child: Stack(
                    children: [
                      Positioned.fill(
                        child: Image.asset(
                          'assets/onboarding_illustration.png',
                          fit: BoxFit.cover,
                        ),
                      ),
                      // Tonal layering overlay
                      Positioned.fill(
                        child: Container(
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              begin: Alignment.topCenter,
                              end: Alignment.bottomCenter,
                              colors: [
                                Colors.transparent,
                                AppColors.backgroundLight.withOpacity(0.9),
                              ],
                              stops: const [0.5, 1.0],
                            ),
                          ),
                        ),
                      ),
                      // Achievement Badge
                      Positioned(
                        bottom: 32,
                        right: 32,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(4),
                          child: BackdropFilter(
                            filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                            child: Container(
                              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
                              decoration: BoxDecoration(
                                color: Colors.white.withOpacity(0.8),
                                border: const Border(
                                  left: BorderSide(color: AppColors.primaryRed, width: 4),
                                ),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.black.withOpacity(0.25),
                                    offset: const Offset(0, 25),
                                    blurRadius: 50,
                                    spreadRadius: -12,
                                  ),
                                ],
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'GROWTH METRIC',
                                    style: AppTextStyles.bodySemiBold(10, color: AppColors.textBrown)
                                        .copyWith(letterSpacing: 1.0),
                                  ),
                                  const SizedBox(height: 4),
                                  Text(
                                    '+124%\nEngagement',
                                    style: AppTextStyles.headingBold(20, color: AppColors.primaryRed),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                // Content Section
                Expanded(
                  flex: 57,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 32.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(height: 48),
                        Text(
                          'Ready to\ngrow?',
                          style: AppTextStyles.headingBlack(56).copyWith(color: AppColors.textDark),
                        ),
                        const SizedBox(height: 16),
                        Opacity(
                          opacity: 0.8,
                          child: Text(
                            "Let’s build your creator journey with tools designed for impact.",
                            style: AppTextStyles.bodyRegular(18, color: AppColors.textBrown),
                          ),
                        ),
                        const Spacer(),
                        // Actions Section
                        PrimaryButton(
                          text: 'Get Started',
                          onPressed: onGetStarted,
                          width: 240,
                          iconPath: 'assets/forward_arrow.svg',
                        ),
                        const SizedBox(height: 24),
                        Center(
                          child: GestureDetector(
                            onTap: onLogin,
                            child: RichText(
                              text: TextSpan(
                                style: AppTextStyles.bodySemiBold(16, color: AppColors.textDark),
                                children: const [
                                  TextSpan(text: 'Already have an account? '),
                                  TextSpan(
                                    text: 'Login',
                                    style: TextStyle(color: AppColors.primaryRed),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(height: 32),
                        const PaginationIndicator(
                          activeIndex: 2,
                          activeColor: Color(0xFFDC2626),
                          inactiveColor: Color(0xFFD4D4D4),
                        ),
                        const SizedBox(height: 48),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            // Header Overlay
            SafeArea(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(
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
                    TextButton(
                      onPressed: onSkip,
                      child: Text(
                        'SKIP',
                        style: AppTextStyles.headingBold(14, color: AppColors.primaryRed)
                            .copyWith(letterSpacing: 1.4),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
