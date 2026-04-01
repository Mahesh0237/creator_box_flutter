import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../theme.dart';

class AddressSetupScreen extends StatelessWidget {
  final VoidCallback onContinue;
  final VoidCallback onBack;

  const AddressSetupScreen({
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
                  // Onboarding Tag
                  Container(
                    padding: const EdgeInsets.symmetric(vertical: 4),
                    child: Text(
                      'ONBOARDING',
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
                    'Where are you\nbased?',
                    style: AppTypography.beVietnamProBold.copyWith(
                      color: AppColors.textDark,
                      fontSize: 36,
                      height: 1.1,
                      letterSpacing: -0.9,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 48),

                  // Glass Card
                  Container(
                    width: double.infinity,
                    padding: const EdgeInsets.symmetric(horizontal: 33, vertical: 40),
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
                        Text(
                          'Your Location',
                          style: AppTypography.beVietnamProBold.copyWith(
                            color: AppColors.textDark,
                            fontSize: 24,
                          ),
                        ),
                        const SizedBox(height: 8),
                        Text(
                          'We use this to tailor your experience and find local creator opportunities.',
                          style: AppTypography.interRegular.copyWith(
                            color: AppColors.textBrown,
                            fontSize: 14,
                            height: 1.4,
                          ),
                        ),
                        const SizedBox(height: 40),

                        // Form Fields
                        _buildLabel('COUNTRY'),
                        _buildDropdownPlaceholder('Select your country'),
                        const SizedBox(height: 32),

                        _buildLabel('STATE / REGION'),
                        _buildInputField('e.g. California'),
                        const SizedBox(height: 32),

                        Row(
                          children: [
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  _buildLabel('CITY'),
                                  _buildInputField('e.g. Los Angeles'),
                                ],
                              ),
                            ),
                            const SizedBox(width: 32),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  _buildLabel('PINCODE / ZIP'),
                                  _buildInputField('90210'),
                                ],
                              ),
                            ),
                          ],
                        ),

                        const SizedBox(height: 40),

                        // Card Continue Button
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
                                  width: 12,
                                  height: 12,
                                  colorFilter: const ColorFilter.mode(Colors.white, BlendMode.srcIn),
                                ),
                              ],
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
                color: Colors.white.withOpacity(0.8),
                border: const Border(
                  bottom: BorderSide(color: Color(0xFFF5F5F4), width: 2),
                ),
              ),
              child: ClipRRect(
                child: BackdropFilter(
                  filter: ColorFilter.mode(
                    Colors.white.withOpacity(0.8),
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
              child: Row(
                children: [
                  Expanded(
                    child: GestureDetector(
                      onTap: onBack,
                      child: Container(
                        padding: const EdgeInsets.symmetric(vertical: 12),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SvgPicture.asset(
                              'assets/back_arrow.svg',
                              width: 12,
                              colorFilter: const ColorFilter.mode(AppColors.textDark, BlendMode.srcIn),
                            ),
                            const SizedBox(width: 8),
                            Text(
                              'BACK',
                              style: AppTypography.interSemiBold.copyWith(
                                color: AppColors.textDark,
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
                            begin: Alignment(-1, -1),
                            end: Alignment(1, 1),
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
                              width: 12,
                              height: 12,
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

  Widget _buildLabel(String label) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 4.0),
      child: Text(
        label,
        style: AppTypography.interBold.copyWith(
          color: AppColors.textBrown,
          fontSize: 12,
          letterSpacing: 1.2,
        ),
      ),
    );
  }

  Widget _buildInputField(String hint) {
    return Container(
      decoration: const BoxDecoration(
        border: Border(
          bottom: BorderSide(
            color: Color(0x4D956D67),
          ),
        ),
      ),
      child: TextField(
        style: AppTypography.interRegular.copyWith(
          color: AppColors.textDark,
          fontSize: 16,
        ),
        decoration: InputDecoration(
          hintText: hint,
          hintStyle: AppTypography.interRegular.copyWith(
            color: const Color(0xFFD6D3D1),
            fontSize: 16,
          ),
          border: InputBorder.none,
          isDense: true,
          contentPadding: const EdgeInsets.symmetric(vertical: 14),
        ),
      ),
    );
  }

  Widget _buildDropdownPlaceholder(String selectedValue) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 14),
      decoration: const BoxDecoration(
        border: Border(
          bottom: BorderSide(
            color: Color(0x4D956D67),
          ),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            selectedValue,
            style: AppTypography.interRegular.copyWith(
              color: AppColors.textDark,
              fontSize: 16,
            ),
          ),
          const Icon(Icons.keyboard_arrow_down, color: AppColors.textBrown, size: 24),
        ],
      ),
    );
  }
}
