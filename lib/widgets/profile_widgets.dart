import 'package:flutter/material.dart';
import '../theme.dart';

class ProfileStatCard extends StatelessWidget {
  final String label;
  final String value;

  const ProfileStatCard({
    super.key,
    required this.label,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          value,
          style: AppTypography.headlineMedium.copyWith(
            color: const Color(0xFF121212),
            fontSize: 20,
            fontWeight: FontWeight.w900,
          ),
        ),
        const SizedBox(height: 2),
        Text(
          label.toUpperCase(),
          style: AppTypography.interMedium.copyWith(
            color: const Color(0xFF606060),
            fontSize: 11,
            letterSpacing: 0.5,
          ),
        ),
      ],
    );
  }
}

class GrowthScoreCard extends StatelessWidget {
  final String score;
  final String status;

  const GrowthScoreCard({
    super.key,
    required this.score,
    required this.status,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: const Color(0xFFF7F7F7),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'GROWTH SCORE',
                style: AppTypography.interBold.copyWith(
                  color: const Color(0xFF121212),
                  fontSize: 13,
                ),
              ),
              const Icon(Icons.show_chart, size: 16, color: Color(0xFF121212)),
            ],
          ),
          const SizedBox(height: 12),
          Text(
            '$score%',
            style: AppTypography.headlineMedium.copyWith(
              color: AppColors.primaryRed,
              fontSize: 18,
              fontWeight: FontWeight.w900,
            ),
          ),
          const SizedBox(height: 2),
          Text(
            status,
            style: AppTypography.interMedium.copyWith(
              color: const Color(0xFF606060),
              fontSize: 11,
            ),
          ),
        ],
      ),
    );
  }
}

class HighlightCard extends StatelessWidget {
  final String label;
  final String value;
  final Color? color;

  const HighlightCard({
    super.key,
    required this.label,
    required this.value,
    this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: const Color(0xFFF7F7F7),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label.toUpperCase(),
            style: AppTypography.interMedium.copyWith(
              color: const Color(0xFF606060),
              fontSize: 11,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            value,
            style: AppTypography.headlineSmall.copyWith(
              color: const Color(0xFF121212),
              fontSize: 18,
              fontWeight: FontWeight.w900,
            ),
          ),
        ],
      ),
    );
  }
}

class AccountHubItem extends StatelessWidget {
  final String title;
  final IconData icon;
  final VoidCallback onTap;

  const AccountHubItem({
    super.key,
    required this.title,
    required this.icon,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 60,
        margin: const EdgeInsets.only(bottom: 12),
        padding: const EdgeInsets.symmetric(horizontal: 16),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12.5),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.04),
              blurRadius: 20,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Row(
          children: [
            Icon(icon, size: 20, color: const Color(0xFF121212)),
            const SizedBox(width: 16),
            Expanded(
              child: Text(
                title,
                style: AppTypography.interSemiBold.copyWith(
                  color: const Color(0xFF121212),
                  fontSize: 12,
                ),
              ),
            ),
            const Icon(Icons.chevron_right, size: 20, color: Color(0xFFDADADA)),
          ],
        ),
      ),
    );
  }
}
