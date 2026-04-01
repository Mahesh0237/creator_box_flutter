import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../theme.dart';

class IdentityVerificationScreen extends StatelessWidget {
  final VoidCallback onContinue;
  final VoidCallback onBack;

  const IdentityVerificationScreen({
    super.key,
    required this.onContinue,
    required this.onBack,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundLight,
      body: Stack(
        children: [
          // Background Decorative Element
          Positioned(
            top: 340,
            left: 0,
            child: Opacity(
              opacity: 0.4,
              child: Container(
                width: 390,
                height: 390,
                decoration: BoxDecoration(
                  gradient: RadialGradient(
                    colors: [
                      AppColors.primaryRed.withOpacity(0.1),
                      AppColors.primaryRed.withOpacity(0),
                    ],
                  ),
                ),
              ),
            ),
          ),

          // Main Content
          SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0),
              child: Column(
                children: [
                  const SizedBox(height: 140),
                  // Tag
                  Container(
                    padding: const EdgeInsets.symmetric(vertical: 4),
                    child: Text(
                      'VERIFICATION',
                      style: AppTypography.interBold.copyWith(
                        color: AppColors.primaryRed,
                        fontSize: 12,
                        letterSpacing: 1.2,
                      ),
                    ),
                  ),
                  const SizedBox(height: 12),
                  // Title
                  Text(
                    'Verify your\nidentity',
                    style: AppTypography.beVietnamProBold.copyWith(
                      color: AppColors.textDark,
                      fontSize: 36,
                      height: 1.1,
                      letterSpacing: -0.9,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 16),
                  Text(
                    'To work with top brands, we need to verify your account.',
                    style: AppTypography.interRegular.copyWith(
                      color: AppColors.textBrown,
                      fontSize: 14,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 48),

                  // Verification Card
                  Container(
                    width: double.infinity,
                    padding: const EdgeInsets.all(32),
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.8),
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(color: Colors.white.withOpacity(0.4)),
                      boxShadow: [
                        BoxShadow(
                          color: AppColors.textDark.withOpacity(0.08),
                          blurRadius: 64,
                          offset: const Offset(0, 32),
                          spreadRadius: -16,
                        ),
                      ],
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        _buildStep(
                          '1',
                          'Government ID',
                          'Upload a photo of your Passport, ID Card or Driver\'s License.',
                          Icons.badge_outlined,
                        ),
                        const SizedBox(height: 32),
                        _buildDivider(),
                        const SizedBox(height: 32),
                        _buildStep(
                          '2',
                          'Liveness Check',
                          'A quick 3D face scan to ensure you are really you.',
                          Icons.face_unlock_outlined,
                        ),
                        const SizedBox(height: 32),
                        _buildDivider(),
                        const SizedBox(height: 32),
                        _buildStep(
                          '3',
                          'Proof of Address',
                          'A utility bill or bank statement (not older than 3 months).',
                          Icons.home_outlined,
                        ),
                        const SizedBox(height: 48),

                        // Start Verification Button
                        GestureDetector(
                          onTap: onContinue,
                          child: Container(
                            width: double.infinity,
                            padding: const EdgeInsets.symmetric(vertical: 20),
                            decoration: BoxDecoration(
                              gradient: const LinearGradient(
                                colors: [Color(0xFFBC0100), Color(0xFFBC000C)],
                                begin: Alignment(-1, -1),
                                end: Alignment(1, 1),
                              ),
                              borderRadius: BorderRadius.circular(2),
                              boxShadow: [
                                BoxShadow(
                                  color: AppColors.primaryRed.withOpacity(0.2),
                                  blurRadius: 15,
                                  offset: const Offset(0, 10),
                                  spreadRadius: -3,
                                ),
                              ],
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  'START VERIFICATION',
                                  style: AppTypography.interSemiBold.copyWith(
                                    color: Colors.white,
                                    fontSize: 14,
                                    letterSpacing: 1.4,
                                  ),
                                ),
                                const SizedBox(width: 8),
                                const Icon(Icons.arrow_forward, color: Colors.white, size: 16),
                              ],
                            ),
                          ),
                        ),
                        const SizedBox(height: 16),
                        Center(
                          child: Text(
                            'Estimated time: 2-3 minutes',
                            style: AppTypography.interMedium.copyWith(
                              color: AppColors.textBrown.withOpacity(0.6),
                              fontSize: 12,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 160),
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
              padding: const EdgeInsets.only(bottom: 2),
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.9),
                border: const Border(
                  bottom: BorderSide(color: Color(0xFFF5F5F4), width: 2),
                ),
              ),
              child: ClipRRect(
                child: BackdropFilter(
                  filter: ColorFilter.mode(
                    Colors.white.withOpacity(0.9),
                    BlendMode.srcIn,
                  ),
                  child: SafeArea(
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 12),
                          child: Row(
                            children: [
                              GestureDetector(
                                onTap: onBack,
                                child: SvgPicture.asset('assets/back_arrow.svg', width: 16),
                              ),
                              const SizedBox(width: 16),
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
                        // Progress Bar Overlay
                        Stack(
                          children: [
                            Container(
                              height: 2,
                              width: double.infinity,
                              color: const Color(0xFFF5F5F4),
                            ),
                            Container(
                              height: 2,
                              width: MediaQuery.of(context).size.width * 0.75, // Step 3 of 4
                              color: AppColors.primaryRed,
                            ),
                          ],
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
                    color: AppColors.textDark.withOpacity(0.04),
                    blurRadius: 40,
                    offset: const Offset(0, -12),
                  ),
                ],
              ),
              child: SizedBox(
                width: double.infinity,
                child: TextButton(
                  onPressed: onContinue, // Skip or Continue
                  child: Text(
                    'DO THIS LATER',
                    style: AppTypography.interSemiBold.copyWith(
                      color: AppColors.textBrown,
                      fontSize: 14,
                      letterSpacing: 1.4,
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

  Widget _buildStep(String number, String title, String subtitle, IconData icon) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          width: 48,
          height: 48,
          decoration: BoxDecoration(
            color: const Color(0xFFF5F5F4),
            borderRadius: BorderRadius.circular(4),
          ),
          child: Icon(icon, color: AppColors.primaryRed, size: 24),
        ),
        const SizedBox(width: 16),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'STEP $number',
                style: AppTypography.interBold.copyWith(
                  color: AppColors.primaryRed,
                  fontSize: 10,
                  letterSpacing: 1.0,
                ),
              ),
              const SizedBox(height: 4),
              Text(
                title,
                style: AppTypography.beVietnamProBold.copyWith(
                  color: AppColors.textDark,
                  fontSize: 18,
                ),
              ),
              const SizedBox(height: 4),
              Text(
                subtitle,
                style: AppTypography.interRegular.copyWith(
                  color: AppColors.textBrown,
                  fontSize: 13,
                  height: 1.4,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildDivider() {
    return Container(
      height: 1,
      width: double.infinity,
      color: const Color(0xFFF5F5F4),
    );
  }
}
