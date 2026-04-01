import 'package:flutter/material.dart';
import '../theme.dart';
import '../widgets/profile_widgets.dart';
import 'my_campaigns_screen.dart';
import 'my_stats_screen.dart';
import 'edit_profile_screen.dart';
import 'help_screen.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(
          'PROFILE',
          style: AppTypography.labelLarge.copyWith(
            color: AppColors.textMain,
            fontWeight: FontWeight.w900,
            letterSpacing: 1.2,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0,
        actions: [
          IconButton(
            icon: const Icon(Icons.settings_outlined, color: AppColors.textMain, size: 24),
            onPressed: () {},
          ),
          IconButton(
            icon: const Icon(Icons.notifications_outlined, color: AppColors.textMain, size: 24),
            onPressed: () {},
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Column(
          children: [
            const SizedBox(height: 24),
            // Identity
            Center(
              child: Column(
                children: [
                  Stack(
                    alignment: Alignment.bottomRight,
                    children: [
                      Container(
                        padding: const EdgeInsets.all(4),
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(color: AppColors.primaryRed, width: 2),
                        ),
                        child: const CircleAvatar(
                          backgroundImage: AssetImage('assets/profile_avatar_large.png'),
                          radius: 48,
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => const EditProfileScreen()),
                          );
                        },
                        child: Container(
                          padding: const EdgeInsets.all(6),
                          decoration: BoxDecoration(
                            color: AppColors.primaryRed,
                            shape: BoxShape.circle,
                            border: Border.all(color: Colors.white, width: 2),
                          ),
                          child: const Icon(Icons.edit, color: Colors.white, size: 14),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                  Text(
                    'ELENA VORKOVA',
                    style: AppTypography.headlineSmall.copyWith(
                      color: const Color(0xFF121212),
                      fontSize: 22,
                      fontWeight: FontWeight.w900,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        '@elena_vorkova',
                        style: AppTypography.interMedium.copyWith(
                          color: const Color(0xFF606060),
                          fontSize: 14,
                        ),
                      ),
                      const SizedBox(width: 8),
                      const Icon(Icons.location_on, size: 14, color: Color(0xFF606060)),
                      const SizedBox(width: 2),
                      Text(
                        'London, UK',
                        style: AppTypography.interMedium.copyWith(
                          color: const Color(0xFF606060),
                          fontSize: 12,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            
            const SizedBox(height: 32),
            // Stats Row
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                const ProfileStatCard(label: 'Posts', value: '124'),
                Container(width: 1, height: 24, color: const Color(0xFFEEEEEE)),
                const ProfileStatCard(label: 'Followers', value: '2.4M'),
                Container(width: 1, height: 24, color: const Color(0xFFEEEEEE)),
                const ProfileStatCard(label: 'Following', value: '842'),
              ],
            ),
            
            const SizedBox(height: 32),
            // Growth Score & Highlights (Bento Grid Style)
            const Row(
              children: [
                Expanded(
                  flex: 3,
                  child: GrowthScoreCard(
                    score: '87.5',
                    status: 'Excellent growth this month',
                  ),
                ),
                SizedBox(width: 12),
                Expanded(
                  flex: 2,
                  child: HighlightCard(
                    label: 'Engagement',
                    value: '4.2%',
                  ),
                ),
              ],
            ),
            const SizedBox(height: 12),
            const Row(
              children: [
                Expanded(
                  child: HighlightCard(
                    label: 'Media Reach',
                    value: '1.2M',
                  ),
                ),
                SizedBox(width: 12),
                Expanded(
                  child: HighlightCard(
                    label: 'Total Views',
                    value: '15.4M',
                  ),
                ),
              ],
            ),
            
            const SizedBox(height: 40),
            // Account Hub Label
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'ACCOUNT HUB',
                style: AppTypography.labelLarge.copyWith(
                  color: const Color(0xFF121212),
                  fontWeight: FontWeight.w900,
                  letterSpacing: 1.2,
                ),
              ),
            ),
            const SizedBox(height: 16),
            AccountHubItem(
              title: 'My Campaigns',
              icon: Icons.history,
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const MyCampaignsScreen()),
                );
              },
            ),
            AccountHubItem(
              title: 'Payment Settings',
              icon: Icons.payment,
              onTap: () {},
            ),
            AccountHubItem(
              title: 'Account Analytics',
              icon: Icons.insights,
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const MyStatsScreen()),
                );
              },
            ),
            AccountHubItem(
              title: 'Help & Support',
              icon: Icons.help_outline,
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const HelpScreen()),
                );
              },
            ),
            const SizedBox(height: 32),
            // Logout
            TextButton(
              onPressed: () {},
              child: Text(
                'LOGOUT',
                style: AppTypography.interBold.copyWith(
                  color: AppColors.primaryRed,
                  fontSize: 14,
                  letterSpacing: 1.0,
                ),
              ),
            ),
            const SizedBox(height: 100),
          ],
        ),
      ),
    );
  }
}
