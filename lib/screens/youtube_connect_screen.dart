import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../theme.dart';

class YoutubeConnectScreen extends StatelessWidget {
  final VoidCallback onConnect;
  final VoidCallback onSkip;
  final VoidCallback onBack;
  final VoidCallback onContinue;

  const YoutubeConnectScreen({
    super.key,
    required this.onConnect,
    required this.onSkip,
    required this.onBack,
    required this.onContinue,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundLight,
      body: Stack(
        children: [
          // Background Decorative Element
          Positioned(
            top: 0,
            right: 0,
            child: Container(
              width: 195,
              height: 1256,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    const Color(0xFFFEF2F2).withValues(alpha: 0.3),
                    const Color(0xFFFEF2F2).withValues(alpha: 0),
                  ],
                  begin: Alignment.centerRight,
                  end: Alignment.centerLeft,
                ),
              ),
            ),
          ),

          // Main Content
          SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 140),
                  // Header
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Connect',
                        style: AppTypography.beVietnamProBlackItalic.copyWith(
                          color: AppColors.textDark,
                          fontSize: 48,
                          height: 1.1,
                          letterSpacing: -2.4,
                        ),
                      ),
                      Text(
                        'YouTube',
                        style: AppTypography.beVietnamProBlackItalic.copyWith(
                          color: AppColors.primaryRed,
                          fontSize: 48,
                          height: 1.1,
                          letterSpacing: -2.4,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                  Text(
                    'Unlock deep insights and exclusive brand campaigns by verifying your channel ownership.',
                    style: AppTypography.interRegular.copyWith(
                      color: AppColors.textBrown,
                      fontSize: 18,
                      height: 1.4,
                    ),
                  ),
                  const SizedBox(height: 48),

                  // Benefit Cards Grid
                  _buildBenefitCard(
                    'Track Performance',
                    'Sync your real-time analytics to showcase your true reach to potential sponsors.',
                    Icons.trending_up_outlined,
                  ),
                  const SizedBox(height: 16),
                  _buildBenefitCard(
                    'Get Campaigns',
                    'Automated matching with premium brands that align with your audience demographics.',
                    Icons.campaign_outlined,
                  ),
                  const SizedBox(height: 16),
                  _buildBenefitCard(
                    'Faster Approval',
                    'Verified creators get prioritized in the Creator Box ecosystem for all upcoming drops.',
                    Icons.speed_outlined,
                  ),
                  const SizedBox(height: 48),

                  // Actions Section
                  GestureDetector(
                    onTap: onConnect,
                    child: Container(
                      width: double.infinity,
                      decoration: BoxDecoration(
                        gradient: const LinearGradient(
                          colors: [Color(0xFFBC0100), Color(0xFFBC000C)],
                          begin: Alignment(-1, -1),
                          end: Alignment(1, 1),
                        ),
                        borderRadius: BorderRadius.circular(2),
                        boxShadow: [
                          BoxShadow(
                            color: const Color(0xFF7F1D1D).withValues(alpha: 0.1),
                            blurRadius: 25,
                            offset: const Offset(0, 20),
                            spreadRadius: -5,
                          ),
                          BoxShadow(
                            color: const Color(0xFF7F1D1D).withValues(alpha: 0.1),
                            blurRadius: 10,
                            offset: const Offset(0, 8),
                            spreadRadius: -6,
                          ),
                        ],
                      ),
                      padding: const EdgeInsets.symmetric(vertical: 20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Icon(Icons.play_circle_filled, color: Colors.white, size: 20),
                          const SizedBox(width: 12),
                          Text(
                            'Connect YouTube',
                            style: AppTypography.beVietnamProBold.copyWith(
                              color: Colors.white,
                              fontSize: 18,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 24),
                  Center(
                    child: TextButton(
                      onPressed: onSkip,
                      style: TextButton.styleFrom(
                        padding: EdgeInsets.zero,
                        minimumSize: const Size(0, 0),
                        tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                      ),
                      child: Text(
                        'SKIP FOR NOW',
                        style: AppTypography.interSemiBold.copyWith(
                          color: const Color(0xFFA8A29E),
                          fontSize: 12,
                          letterSpacing: 1.2,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 48),

                  // Trust Indicator
                  Container(
                    padding: const EdgeInsets.only(top: 17, bottom: 16),
                    decoration: const BoxDecoration(
                      border: Border(
                        top: BorderSide(color: Color(0xFFF5F5F4)),
                      ),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const Icon(Icons.lock_outline, color: Color(0xFFA8A29E), size: 16),
                        const SizedBox(width: 12),
                        Expanded(
                          child: Text(
                            'SECURE OAUTH 2.0 CONNECTION • YOUR DATA IS NEVER SOLD',
                            style: AppTypography.interBold.copyWith(
                              color: const Color(0xFFA8A29E),
                              fontSize: 10,
                              height: 1.5,
                              letterSpacing: 1.0,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 160), // Space for bottom bar
                ],
              ),
            ),
          ),

          // Top App Bar
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: Container(
              color: Colors.white.withValues(alpha: 0.8),
              child: ClipRRect(
                child: BackdropFilter(
                  filter: ColorFilter.mode(
                    Colors.white.withValues(alpha: 0.8),
                    BlendMode.srcATop,
                  ),
                  child: SafeArea(
                    bottom: false,
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 12),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  GestureDetector(
                                    onTap: onBack,
                                    child: SvgPicture.asset(
                                      'assets/back_arrow.svg',
                                      width: 16,
                                      colorFilter: const ColorFilter.mode(Color(0xFF1C1917), BlendMode.srcIn),
                                    ),
                                  ),
                                  const SizedBox(width: 16),
                                  Text(
                                    'Step 7 of 7',
                                    style: AppTypography.beVietnamProBold.copyWith(
                                      color: const Color(0xFF1C1917),
                                      fontSize: 16,
                                      letterSpacing: -0.8,
                                    ),
                                  ),
                                ],
                              ),
                              Text(
                                'Creator Box',
                                style: AppTypography.beVietnamProBlackItalic.copyWith(
                                  color: const Color(0xFFDC2626),
                                  fontSize: 20,
                                  letterSpacing: -1,
                                ),
                              ),
                            ],
                          ),
                        ),
                        // Full Progress Bar
                        Container(
                          height: 2,
                          width: double.infinity,
                          decoration: const BoxDecoration(
                            color: Color(0xFFF5F5F4),
                          ),
                          child: FractionallySizedBox(
                            alignment: Alignment.centerLeft,
                            widthFactor: 1.0,
                            child: Container(
                              color: const Color(0xFFDC2626),
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

          // Bottom Bar
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
              padding: const EdgeInsets.fromLTRB(24, 16, 24, 40),
              decoration: BoxDecoration(
                color: Colors.white,
                border: const Border(
                  top: BorderSide(color: Color(0xFFF5F5F4)),
                ),
                boxShadow: [
                  BoxShadow(
                    color: const Color(0xFF1A1C1C).withValues(alpha: 0.04),
                    blurRadius: 40,
                    offset: const Offset(0, -12),
                  ),
                ],
              ),
              child: Row(
                children: [
                  Expanded(
                    child: GestureDetector(
                      onTap: onBack,
                      child: Container(
                        padding: const EdgeInsets.symmetric(vertical: 12),
                        decoration: BoxDecoration(
                          color: Colors.transparent,
                          borderRadius: BorderRadius.circular(2),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SvgPicture.asset(
                              'assets/back_arrow.svg',
                              width: 8,
                              colorFilter: const ColorFilter.mode(Color(0xFF1C1917), BlendMode.srcIn),
                            ),
                            const SizedBox(width: 8),
                            Text(
                              'BACK',
                              style: AppTypography.interSemiBold.copyWith(
                                color: const Color(0xFF1C1917),
                                fontSize: 14,
                                letterSpacing: 1.4,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: GestureDetector(
                      onTap: onContinue,
                      child: Container(
                        padding: const EdgeInsets.symmetric(vertical: 12),
                        decoration: BoxDecoration(
                          gradient: const LinearGradient(
                            colors: [Color(0xFFBC0100), Color(0xFFBC000C)],
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                          ),
                          borderRadius: BorderRadius.circular(2),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'CONTINUE',
                              style: AppTypography.interSemiBold.copyWith(
                                color: Colors.white,
                                fontSize: 14,
                                letterSpacing: 1.4,
                              ),
                            ),
                            const SizedBox(width: 8),
                            SvgPicture.asset(
                              'assets/forward_arrow.svg',
                              width: 8,
                              colorFilter: const ColorFilter.mode(Colors.white, BlendMode.srcIn),
                            ),
                          ],
                        ),
                      ),
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

  Widget _buildBenefitCard(String title, String subtitle, IconData icon) {
    return Container(
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(2), // Sharp or near-sharp corners
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: const Color(0xFFFEF2F2).withValues(alpha: 0.5),
              borderRadius: BorderRadius.circular(4),
            ),
            child: Icon(icon, color: AppColors.primaryRed, size: 24),
          ),
          const SizedBox(width: 20),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: AppTypography.beVietnamProBold.copyWith(
                    color: AppColors.textDark,
                    fontSize: 20,
                    height: 1.4,
                  ),
                ),
                const SizedBox(height: 3),
                Text(
                  subtitle,
                  style: AppTypography.interRegular.copyWith(
                    color: AppColors.textBrown,
                    fontSize: 14,
                    height: 1.6,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
