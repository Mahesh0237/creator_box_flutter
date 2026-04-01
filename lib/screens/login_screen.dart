import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../theme.dart';
import '../widgets/auth_input_field.dart';
import '../widgets/auth_checkbox.dart';
import '../widgets/social_auth_button.dart';

class LoginScreen extends StatelessWidget {
  final VoidCallback onLogin;
  final VoidCallback onCreateAccount;
  final VoidCallback onBack;

  const LoginScreen({
    super.key,
    required this.onLogin,
    required this.onCreateAccount,
    required this.onBack,
  });

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle.dark,
      child: Scaffold(
        backgroundColor: const Color(0xFFF9F9F9),
        body: Stack(
          children: [
            // Main Scrollable Content
            SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const SizedBox(height: 160), // Spacing for Header

                    Text(
                      'Welcome back.',
                      style: AppTypography.beVietnamProExtraBold.copyWith(
                        color: AppColors.primaryDark,
                        fontSize: 36,
                        letterSpacing: -1.8,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 12),
                    Text(
                      'Enter your credentials to continue your creative\njourney.',
                      style: AppTypography.interRegular.copyWith(
                        color: const Color(0xFF603E39),
                        fontSize: 14,
                        height: 1.6,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 48),
                    const AuthInputField(
                      label: 'Email Address',
                      hintText: 'name@creatorbox.com',
                      keyboardType: TextInputType.emailAddress,
                    ),
                    const SizedBox(height: 32),
                    AuthInputField(
                      label: 'Password',
                      hintText: '••••••••',
                      obscureText: true,
                      suffix: TextButton(
                        onPressed: () {},
                        child: Text(
                          'FORGOT?',
                          style: AppTypography.interBold.copyWith(
                            color: AppColors.primaryRed,
                            fontSize: 12,
                            letterSpacing: 0.6,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 32),
                    AuthCheckbox(
                      label: 'Keep me signed in on this device',
                      onChanged: (val) {},
                    ),
                    const SizedBox(height: 160),
                    const SizedBox(height: 140), // Space for Sticky Footer
                  ],
                ),
              ),
            ),

            // Header - TopAppBar
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
                        child: SizedBox(
                          height: 60,
                          child: Stack(
                            alignment: Alignment.center,
                            children: [
                              Align(
                                alignment: Alignment.centerLeft,
                                child: IconButton(
                                  icon: SvgPicture.asset(
                                    'assets/back_arrow.svg',
                                    width: 16,
                                    height: 16,
                                    colorFilter: const ColorFilter.mode(
                                      AppColors.primaryRed,
                                      BlendMode.srcIn,
                                    ),
                                  ),
                                  onPressed: onBack,
                                ),
                              ),
                              Align(
                                alignment: Alignment.center,
                                child: Image.asset(
                                  'assets/Creator-Box-logo.png',
                                  height: 40,
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
            ),

            // Footer - Bottom Action Bar
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: Container(
                padding: const EdgeInsets.fromLTRB(24, 25, 24, 40),
                decoration: BoxDecoration(
                  color: Colors.white,
                  border: const Border(top: BorderSide(color: Color(0xFFF5F5F4))),
                  boxShadow: [
                    BoxShadow(
                      color: const Color(0xFF1A1C1C).withOpacity(0.04),
                      blurRadius: 40,
                      offset: const Offset(0, -12),
                    ),
                  ],
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    GestureDetector(
                      onTap: onLogin,
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
                              'SIGN IN',
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
                    const SizedBox(height: 16),
                    SocialAuthButton(
                      text: 'Continue with Google',
                      iconPath: 'assets/google_logo.svg',
                      onPressed: () {},
                    ),
                    const SizedBox(height: 16),
                    GestureDetector(
                      onTap: onCreateAccount,
                      child: RichText(
                        text: TextSpan(
                          style: AppTypography.interRegular.copyWith(
                            color: const Color(0xFF603E39),
                            fontSize: 10,
                            letterSpacing: 1,
                          ),
                          children: [
                            const TextSpan(text: 'NEW HERE? '),
                            TextSpan(
                              text: 'CREATE ACCOUNT',
                              style: AppTypography.interBold.copyWith(
                                color: const Color(0xFFBC0100),
                              ),
                            ),
                          ],
                        ),
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
