import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../theme.dart';



class OtpScreen extends StatefulWidget {
  final VoidCallback onVerify;
  final VoidCallback onBack;

  const OtpScreen({
    super.key,
    required this.onVerify,
    required this.onBack,
  });

  @override
  State<OtpScreen> createState() => _OtpScreenState();
}

class _OtpScreenState extends State<OtpScreen> {
  final List<TextEditingController> _controllers = List.generate(6, (index) => TextEditingController());
  final List<FocusNode> _focusNodes = List.generate(6, (index) => FocusNode());

  @override
  void dispose() {
    for (var controller in _controllers) {
      controller.dispose();
    }
    for (var node in _focusNodes) {
      node.dispose();
    }
    super.dispose();
  }

  void _onChanged(String value, int index) {
    if (value.isNotEmpty && index < 5) {
      _focusNodes[index + 1].requestFocus();
    } else if (value.isEmpty && index > 0) {
      _focusNodes[index - 1].requestFocus();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF9F9F9),
      body: Stack(
        children: [
          // Content
          SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const SizedBox(height: 100),

                  Text(
                    'Almost there.',
                    style: AppTypography.beVietnamProExtraBold.copyWith(
                      color: AppColors.primaryDark,
                      fontSize: 36,
                      letterSpacing: -1.8,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 12),
                  Text(
                    'Verify your email.',
                    style: AppTypography.interBold.copyWith(
                      color: const Color(0xFFBC0100),
                      fontSize: 10,
                      letterSpacing: 2,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 48),
                  Text(
                    'We sent a 6-digit code to name@creatorbox.com\nEnter it below to verify your account.',
                    style: AppTypography.interRegular.copyWith(
                      color: const Color(0xFF603E39),
                      fontSize: 14,
                      height: 1.6,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 48),

                  // OTP Input Grid
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: List.generate(6, (index) {
                      return Container(
                        width: 48,
                        height: 56,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          border: Border.all(
                            color: const Color(0xFFF5F5F4),
                            width: 2,
                          ),
                          borderRadius: BorderRadius.circular(4),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.04),
                              blurRadius: 10,
                              offset: const Offset(0, 4),
                            ),
                          ],
                        ),
                        child: TextField(
                          controller: _controllers[index],
                          focusNode: _focusNodes[index],
                          onChanged: (value) => _onChanged(value, index),
                          textAlign: TextAlign.center,
                          keyboardType: TextInputType.number,
                          maxLength: 1,
                          style: AppTypography.beVietnamProBold.copyWith(
                            color: AppColors.primaryDark,
                            fontSize: 24,
                          ),
                          decoration: const InputDecoration(
                            counterText: '',
                            border: InputBorder.none,
                          ),
                        ),
                      );
                    }),
                  ),
                  const SizedBox(height: 48),

                  // Countdown Timer & Re-send
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Icon(Icons.timer_outlined, size: 16, color: Color(0xFF603E39)),
                      const SizedBox(width: 8),
                      Text(
                        '00:59',
                        style: AppTypography.interBold.copyWith(
                          color: const Color(0xFF603E39),
                          fontSize: 14,
                        ),
                      ),
                      const SizedBox(width: 24),
                      TextButton(
                        onPressed: () {},
                        child: Text(
                          'SEND AGAIN',
                          style: AppTypography.interBold.copyWith(
                            color: AppColors.primaryRed,
                            fontSize: 12,
                            letterSpacing: 1.2,
                          ),
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: 64),
                  // Tech Aesthetic Illustration
                  Container(
                    height: 180,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    clipBehavior: Clip.antiAlias,
                    child: Stack(
                      children: [
                        Positioned.fill(
                          child: Opacity(
                            opacity: 0.1,
                            child: Image.asset(
                              'assets/otp_tech_aesthetic.png',
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        Center(
                          child: Container(
                            padding: const EdgeInsets.all(16),
                            decoration: BoxDecoration(
                              color: Colors.white.withOpacity(0.9),
                              borderRadius: BorderRadius.circular(12),
                              border: Border.all(color: const Color(0xFFF5F5F4)),
                            ),
                            child: SvgPicture.string(
                              '''<svg width="40" height="40" viewBox="0 0 40 40" fill="none" xmlns="http://www.w3.org/2000/svg">
<path d="M20 35C28.2843 35 35 28.2843 35 20C35 11.7157 28.2843 5 20 5C11.7157 5 5 11.7157 5 20C5 28.2843 11.7157 35 20 35Z" stroke="#BC0100" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"/>
<path d="M20 10V20L25 25" stroke="#BC0100" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"/>
</svg>''',
                              width: 40,
                              height: 40,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(height: 140),
                ],
              ),
            ),
          ),

          // Header
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: Container(
              height: 100,
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.8),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.05),
                    blurRadius: 10,
                  ),
                ],
              ),
              child: ClipRRect(
                child: BackdropFilter(
                  filter: ColorFilter.mode(
                    Colors.white.withOpacity(0.8),
                    BlendMode.srcIn,
                  ),
                  child: SafeArea(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 24.0),
                      child: Stack(
                        alignment: Alignment.center,
                        children: [
                          Positioned(
                            left: 0,
                            child: IconButton(
                              icon: SvgPicture.asset(
                                'assets/back_arrow.svg',
                                width: 16,
                                height: 16,
                              ),
                              onPressed: widget.onBack,
                            ),
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
                  ),
                ),
              ),
            ),
          ),

          // Footer
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
              padding: const EdgeInsets.fromLTRB(24, 25, 24, 40),
              decoration: BoxDecoration(
                color: Colors.white,
                border: const Border(
                  top: BorderSide(color: Color(0xFFF5F5F4)),
                ),
                boxShadow: [
                  BoxShadow(
                    color: const Color(0xFF1A1C1C).withOpacity(0.04),
                    blurRadius: 40,
                    offset: const Offset(0, -12),
                  ),
                ],
              ),
              child: GestureDetector(
                onTap: widget.onVerify,
                child: Container(
                  width: double.infinity,
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  decoration: BoxDecoration(
                    gradient: const LinearGradient(
                      colors: [Color(0xFFBC0100), Color(0xFFBC000C)],
                      begin: Alignment(0, -1),
                      end: Alignment(0, 1),
                    ),
                    borderRadius: BorderRadius.circular(2),
                    boxShadow: [
                      BoxShadow(
                        color: const Color(0xFFBC0100).withOpacity(0.2),
                        blurRadius: 25,
                        offset: const Offset(0, 20),
                        spreadRadius: -5,
                      ),
                    ],
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'VERIFY AND PROCEED',
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
                        colorFilter: const ColorFilter.mode(
                          Colors.white,
                          BlendMode.srcIn,
                        ),
                      ),
                    ],
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
