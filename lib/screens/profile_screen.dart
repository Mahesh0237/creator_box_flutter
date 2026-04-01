import 'package:flutter/material.dart';
import '../theme.dart';
import '../widgets/shared_app_bar.dart';
import 'my_campaigns_screen.dart';
import 'my_stats_screen.dart';
import 'edit_profile_screen.dart';
import 'help_screen.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF9F9F9),
      appBar: const SharedAppBar(),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 32),
        child: Column(
          children: [
            // Identity Section
            Center(
              child: Column(
                children: [
                  Stack(
                    alignment: Alignment.bottomRight,
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(16),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withValues(alpha: 0.1),
                              blurRadius: 20,
                              offset: const Offset(0, 10),
                            ),
                          ],
                        ),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(16),
                          child: Image.asset(
                            'assets/profile_avatar_large.png', // Assuming identical user image
                            width: 120,
                            height: 120,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      Positioned(
                        right: -4,
                        bottom: -4,
                        child: Container(
                          padding: const EdgeInsets.all(4),
                          decoration: const BoxDecoration(
                            color: Colors.white,
                            shape: BoxShape.circle,
                          ),
                          child: Container(
                            padding: const EdgeInsets.all(4),
                            decoration: const BoxDecoration(
                              color: AppColors.primaryRed,
                              shape: BoxShape.circle,
                            ),
                            child: const Icon(
                              Icons.verified,
                              color: Colors.white,
                              size: 16,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                  Text(
                    'Mahesh Uppari',
                    style: AppTypography.beVietnamProBlack.copyWith(
                      color: AppColors.textMain,
                      fontSize: 24,
                      letterSpacing: -0.5,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    '@mahesh_uppari',
                    style: AppTypography.interRegular.copyWith(
                      color: const Color(0xFF603E39),
                      fontSize: 14,
                    ),
                  ),
                  const SizedBox(height: 24),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const EditProfileScreen(),
                        ),
                      );
                    },
                    style:
                        ElevatedButton.styleFrom(
                          backgroundColor: AppColors.primaryRed,
                          foregroundColor: Colors.white,
                          elevation: 0,
                          padding: const EdgeInsets.symmetric(
                            horizontal: 32,
                            vertical: 12,
                          ),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ).copyWith(
                          backgroundColor: WidgetStateProperty.resolveWith(
                            (states) => AppColors.primaryRed,
                          ),
                        ),
                    child: Container(
                      decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                            color: AppColors.primaryRed.withValues(alpha: 0.2),
                            blurRadius: 15,
                            offset: const Offset(0, 8),
                          ),
                        ],
                      ),
                      child: Text(
                        'Edit Profile',
                        style: AppTypography.interBold.copyWith(
                          fontSize: 16,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 40),

            // Performance Index
            Container(
              padding: const EdgeInsets.all(24),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
                border: Border.all(
                  color: const Color(0xFFEBBBB4).withValues(alpha: 0.1),
                ),
                boxShadow: [
                  BoxShadow(
                    color: const Color(0xFF1A1C1C).withValues(alpha: 0.02),
                    blurRadius: 20,
                    offset: const Offset(0, 8),
                  ),
                ],
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'PERFORMANCE INDEX',
                        style: AppTypography.interBold.copyWith(
                          color: const Color(0xFF603E39),
                          fontSize: 12,
                          letterSpacing: 1.2,
                        ),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        'Creator Growth Score:\n72%',
                        style: AppTypography.beVietnamProBlack.copyWith(
                          color: AppColors.textMain,
                          fontSize: 18,
                          height: 1.3,
                        ),
                      ),
                    ],
                  ),
                  Container(
                    width: 64,
                    height: 64,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(color: AppColors.primaryRed, width: 4),
                    ),
                    child: Center(
                      child: Text(
                        '72',
                        style: AppTypography.interBold.copyWith(
                          color: AppColors.textMain,
                          fontSize: 18,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 24),

            // Metrics Grid
            Row(
              children: [
                Expanded(
                  child: _MetricCard(label: 'Subscribers', value: '1.2M'),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: _MetricCard(label: 'Total\nEarnings', value: '8.4L'),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: _MetricCard(label: 'Campaigns', value: '48'),
                ),
              ],
            ),
            const SizedBox(height: 40),

            // Account Hub
            _SectionHeader(title: 'Account Hub'),
            const SizedBox(height: 12),
            Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
                border: Border.all(
                  color: const Color(0xFFEBBBB4).withValues(alpha: 0.1),
                ),
              ),
              child: Column(
                children: [
                  _HubActionItem(
                    icon: Icons.campaign_outlined,
                    title: 'My Campaigns',
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const MyCampaignsScreen(),
                        ),
                      );
                    },
                  ),
                  _HubActionItem(
                    icon: Icons.bar_chart_rounded,
                    title: 'My Stats',
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const MyStatsScreen(),
                        ),
                      );
                    },
                  ),
                  _HubActionItem(
                    icon: Icons.account_balance_wallet_outlined,
                    title: 'Wallet',
                    onTap: () {},
                  ),
                  _HubActionItem(
                    icon: Icons.bookmark_border_rounded,
                    title: 'Saved Videos',
                    onTap: () {},
                    showBorder: false,
                  ),
                ],
              ),
            ),
            const SizedBox(height: 40),

            // Support & Legal
            _SectionHeader(title: 'Support & Legal'),
            const SizedBox(height: 12),
            Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
                border: Border.all(
                  color: const Color(0xFFEBBBB4).withValues(alpha: 0.1),
                ),
              ),
              child: Column(
                children: [
                  _SupportActionItem(
                    title: 'Help & Support',
                    icon: Icons.help_outline,
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const HelpScreen(),
                        ),
                      );
                    },
                  ),
                  _SupportActionItem(
                    title: 'Privacy Policy',
                    icon: Icons.shield_outlined,
                    onTap: () {},
                  ),
                  _SupportActionItem(
                    title: 'Terms of Service',
                    icon: Icons.description_outlined,
                    onTap: () {},
                  ),
                  _SupportActionItem(
                    title: 'LOGOUT',
                    icon: Icons.logout,
                    isLogout: true,
                    onTap: () {},
                  ),
                ],
              ),
            ),
            const SizedBox(height: 40),
          ],
        ),
      ),
    );
  }
}

class _MetricCard extends StatelessWidget {
  final String label;
  final String value;

  const _MetricCard({required this.label, required this.value});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 8),
      decoration: BoxDecoration(
        color: const Color(0xFFF3F3F3),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        children: [
          Text(
            label.toUpperCase(),
            textAlign: TextAlign.center,
            style: AppTypography.interBold.copyWith(
              color: const Color(0xFF603E39),
              fontSize: 10,
              letterSpacing: 0.5,
              height: 1.2,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            value,
            style: AppTypography.beVietnamProBlack.copyWith(
              color: AppColors.primaryRed,
              fontSize: 20,
            ),
          ),
        ],
      ),
    );
  }
}

class _SectionHeader extends StatelessWidget {
  final String title;

  const _SectionHeader({required this.title});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Text(
        title.toUpperCase(),
        style: AppTypography.interBold.copyWith(
          color: const Color(0xFF603E39),
          fontSize: 12,
          letterSpacing: 1.2,
        ),
      ),
    );
  }
}

class _HubActionItem extends StatelessWidget {
  final IconData icon;
  final String title;
  final VoidCallback onTap;
  final bool showBorder;

  const _HubActionItem({
    required this.icon,
    required this.title,
    required this.onTap,
    this.showBorder = true,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          border: showBorder
              ? Border(
                  bottom: BorderSide(
                    color: const Color(0xFFEBBBB4).withValues(alpha: 0.1),
                  ),
                )
              : null,
        ),
        padding: const EdgeInsets.all(16),
        child: Row(
          children: [
            Container(
              width: 40,
              height: 40,
              decoration: BoxDecoration(
                color: const Color(0xFFE8E8E8),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Icon(icon, color: AppColors.primaryRed, size: 20),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Text(
                title,
                style: AppTypography.interMedium.copyWith(
                  color: AppColors.textMain,
                  fontSize: 16,
                ),
              ),
            ),
            const Icon(Icons.chevron_right, color: Color(0xFF603E39), size: 20),
          ],
        ),
      ),
    );
  }
}

class _SupportActionItem extends StatelessWidget {
  final String title;
  final IconData icon;
  final VoidCallback onTap;
  final bool isLogout;

  const _SupportActionItem({
    required this.title,
    required this.icon,
    required this.onTap,
    this.isLogout = false,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: isLogout
            ? BoxDecoration(
                border: Border(
                  top: BorderSide(
                    color: const Color(0xFFEBBBB4).withValues(alpha: 0.1),
                  ),
                ),
              )
            : null,
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              title,
              style: isLogout
                  ? AppTypography.interBold.copyWith(
                      color: AppColors.primaryRed,
                      fontSize: 14,
                      letterSpacing: 0.7,
                    )
                  : AppTypography.interRegular.copyWith(
                      color: const Color(0xFF603E39),
                      fontSize: 14,
                    ),
            ),
            Icon(
              icon,
              color: isLogout ? AppColors.primaryRed : const Color(0xFF603E39),
              size: 18,
            ),
          ],
        ),
      ),
    );
  }
}
