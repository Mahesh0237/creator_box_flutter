import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../theme.dart';
import '../widgets/auth_input_field.dart';
import '../widgets/auth_checkbox.dart';
import '../widgets/progress_bar.dart';

class SignupScreen extends StatefulWidget {
  final VoidCallback onSignup;
  final VoidCallback onBack;

  const SignupScreen({
    super.key,
    required this.onSignup,
    required this.onBack,
  });

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final TextEditingController _dobController = TextEditingController();
  String? _selectedGender;

  Future<void> _pickDate() async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime(2000, 1, 1),
      firstDate: DateTime(1950),
      lastDate: DateTime.now(),
      builder: (context, child) {
        return Theme(
          data: Theme.of(context).copyWith(
            colorScheme: const ColorScheme.light(
              primary: AppColors.primaryRed,
              onPrimary: Colors.white,
              surface: Colors.white,
              onSurface: AppColors.primaryDark,
            ),
          ),
          child: child!,
        );
      },
    );
    if (picked != null) {
      setState(() {
        _dobController.text =
            '${picked.day.toString().padLeft(2, '0')}/${picked.month.toString().padLeft(2, '0')}/${picked.year}';
      });
    }
  }

  @override
  void dispose() {
    _dobController.dispose();
    super.dispose();
  }

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
                    const AuthProgressBar(currentStep: 1, totalSteps: 7),
                    const SizedBox(height: 48),
                    Text(
                      "Let's get started.",
                      style: AppTypography.beVietnamProExtraBold.copyWith(
                        color: AppColors.primaryDark,
                        fontSize: 36,
                        letterSpacing: -1.8,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 12),
                    Text(
                      'CREATE YOUR FREE\nACCOUNT',
                      style: AppTypography.interBold.copyWith(
                        color: const Color(0xFFBC0100),
                        fontSize: 10,
                        letterSpacing: 2,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 48),

                    // Section 01: Personal Info
                    _buildSectionHeader('01 PERSONAL INFO'),
                    const SizedBox(height: 24),
                    const Row(
                      children: [
                        Expanded(
                          child: AuthInputField(
                            label: 'First Name',
                            hintText: 'John',
                          ),
                        ),
                        SizedBox(width: 24),
                        Expanded(
                          child: AuthInputField(
                            label: 'Last Name',
                            hintText: 'Doe',
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 32),
                    const AuthInputField(
                      label: 'Email Address',
                      hintText: 'name@creatorbox.com',
                      keyboardType: TextInputType.emailAddress,
                    ),
                    const SizedBox(height: 32),

                    // Date of Birth
                    AuthInputField(
                      label: 'Date of Birth',
                      hintText: 'DD/MM/YYYY',
                      controller: _dobController,
                      readOnly: true,
                      onTap: _pickDate,
                      suffix: GestureDetector(
                        onTap: _pickDate,
                        child: const Padding(
                          padding: EdgeInsets.only(top: 8.0),
                          child: Icon(
                            Icons.calendar_today_outlined,
                            color: Color(0xFF956D67),
                            size: 20,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 32),

                    // Gender Selection
                    _buildGenderSelector(),
                    const SizedBox(height: 48),

                    // Section 02: Account Info
                    _buildSectionHeader('02 ACCOUNT INFO'),
                    const SizedBox(height: 24),
                    const AuthInputField(
                      label: 'Password',
                      hintText: '••••••••',
                      obscureText: true,
                      showPasswordToggle: true,
                    ),
                    const SizedBox(height: 32),
                    const AuthInputField(
                      label: 'Confirm Password',
                      hintText: '••••••••',
                      obscureText: true,
                      showPasswordToggle: true,
                    ),
                    const SizedBox(height: 40),

                    // Terms and Privacy
                    AuthCheckbox(
                      label: '',
                      onChanged: (val) {},
                      richLabel: RichText(
                        text: TextSpan(
                          style: AppTypography.interMedium.copyWith(
                            color: const Color(0xFF603E39),
                            fontSize: 11,
                            height: 1.6,
                          ),
                          children: [
                            const TextSpan(
                                text:
                                    'BY CREATING AN ACCOUNT, YOU AGREE TO OUR '),
                            TextSpan(
                              text: 'TERMS OF SERVICE',
                              style: AppTypography.interBold.copyWith(
                                color: const Color(0xFFBC0100),
                                decoration: TextDecoration.underline,
                              ),
                            ),
                            const TextSpan(text: ' AND '),
                            TextSpan(
                              text: 'PRIVACY POLICY',
                              style: AppTypography.interBold.copyWith(
                                color: const Color(0xFFBC0100),
                                decoration: TextDecoration.underline,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(height: 160), // Footer spacing
                  ],
                ),
              ),
            ),

            // Header — Matching Login Screen style
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
                                  onPressed: widget.onBack,
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
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    GestureDetector(
                      onTap: widget.onSignup,
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
                              color:
                                  const Color(0xFFBC0100).withOpacity(0.2),
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
                              'CREATE ACCOUNT',
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
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSectionHeader(String title) {
    return Row(
      children: [
        Text(
          title,
          style: AppTypography.interBold.copyWith(
            color: const Color(0xFF603E39),
            fontSize: 12,
            letterSpacing: 1.2,
          ),
        ),
        const SizedBox(width: 16),
        Expanded(
          child: Container(
            height: 1,
            color: const Color(0xFFF5F5F4),
          ),
        ),
      ],
    );
  }

  Widget _buildGenderSelector() {
    final genders = ['Male', 'Female', 'Other'];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'GENDER',
          style: AppTypography.interBold.copyWith(
            color: const Color(0xFF603E39),
            fontSize: 10,
            letterSpacing: 2,
          ),
        ),
        const SizedBox(height: 12),
        Row(
          children: genders.map((gender) {
            final isSelected = _selectedGender == gender;
            return Padding(
              padding: const EdgeInsets.only(right: 12),
              child: GestureDetector(
                onTap: () {
                  setState(() {
                    _selectedGender = gender;
                  });
                },
                child: AnimatedContainer(
                  duration: const Duration(milliseconds: 200),
                  padding:
                      const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                  decoration: BoxDecoration(
                    color: isSelected
                        ? AppColors.primaryRed
                        : Colors.white,
                    borderRadius: BorderRadius.circular(2),
                    border: Border.all(
                      color: isSelected
                          ? AppColors.primaryRed
                          : const Color(0xFFE5E5E5),
                      width: 1.5,
                    ),
                    boxShadow: isSelected
                        ? [
                            BoxShadow(
                              color: AppColors.primaryRed.withOpacity(0.15),
                              blurRadius: 12,
                              offset: const Offset(0, 4),
                            ),
                          ]
                        : [],
                  ),
                  child: Text(
                    gender.toUpperCase(),
                    style: AppTypography.interSemiBold.copyWith(
                      color: isSelected
                          ? Colors.white
                          : const Color(0xFF956D67),
                      fontSize: 12,
                      letterSpacing: 1,
                    ),
                  ),
                ),
              ),
            );
          }).toList(),
        ),
      ],
    );
  }
}
