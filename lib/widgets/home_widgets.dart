import 'package:flutter/material.dart';
import '../theme.dart';

class CampaignCard extends StatelessWidget {
  final String title;
  final String price;
  final String matchPercentage;
  final String description;
  final VoidCallback onApply;

  const CampaignCard({
    super.key,
    required this.title,
    required this.price,
    required this.matchPercentage,
    required this.description,
    required this.onApply,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 320,
      margin: const EdgeInsets.only(right: 16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: const Border(
          left: BorderSide(color: AppColors.primaryRed, width: 4),
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.04),
            blurRadius: 40,
            offset: const Offset(0, 12),
          ),
        ],
      ),
      padding: const EdgeInsets.all(24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 12,
                  vertical: 4,
                ),
                decoration: BoxDecoration(
                  color: AppColors.primaryRed.withValues(alpha: 0.1),
                  borderRadius: BorderRadius.circular(4),
                ),
                child: Text(
                  '$matchPercentage% AI MATCH',
                  style: AppTypography.labelLarge.copyWith(
                    color: AppColors.primaryRed,
                    fontWeight: FontWeight.w800,
                    fontSize: 10,
                  ),
                ),
              ),
              Text(
                price,
                style: AppTypography.titleLarge.copyWith(
                  color: const Color(0xFF603E39),
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          Text(
            title,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            style: AppTypography.titleLarge.copyWith(
              color: AppColors.textMain,
              fontWeight: FontWeight.w900,
              fontSize: 18,
              height: 1.25,
            ),
          ),
          const SizedBox(height: 16),
          Text(
            description,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            style: AppTypography.bodyMedium.copyWith(
              color: const Color(0xFF603E39),
              fontSize: 14,
              height: 1.4,
            ),
          ),
          const SizedBox(height: 24),
          GestureDetector(
            onTap: onApply,
            child: Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(vertical: 16),
              decoration: BoxDecoration(
                gradient: const LinearGradient(
                  colors: [AppColors.primaryRed, Color(0xFFBC000C)],
                ),
                borderRadius: BorderRadius.circular(4),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withValues(alpha: 0.1),
                    blurRadius: 15,
                    spreadRadius: -3,
                    offset: const Offset(0, 10),
                  ),
                ],
              ),
              child: Center(
                child: Text(
                  'APPLY NOW',
                  style: AppTypography.labelLarge.copyWith(
                    color: Colors.white,
                    fontWeight: FontWeight.w800,
                    letterSpacing: 2.4,
                    fontSize: 12,
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

class BrandCard extends StatelessWidget {
  final String name;
  final int activeBriefs;
  final String logoPath;

  const BrandCard({
    super.key,
    required this.name,
    required this.activeBriefs,
    required this.logoPath,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.02),
            blurRadius: 20,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            padding: const EdgeInsets.all(1),
            decoration: BoxDecoration(
              color: const Color(0xFFF3F3F3),
              borderRadius: BorderRadius.circular(12),
              border: Border.all(
                color: const Color(0xFFEBBBB4).withValues(alpha: 0.2),
              ),
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Image.asset(
                logoPath,
                width: 64,
                height: 64,
                fit: BoxFit.cover,
              ),
            ),
          ),
          const SizedBox(height: 12),
          Text(
            name.toUpperCase(),
            textAlign: TextAlign.center,
            style: AppTypography.titleMedium.copyWith(
              color: AppColors.textMain,
              fontWeight: FontWeight.w900,
              fontSize: 14,
              letterSpacing: -0.35,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            '$activeBriefs ACTIVE BRIEFS',
            style: AppTypography.bodySmall.copyWith(
              color: const Color(0xFF603E39),
              fontSize: 10,
              letterSpacing: 1,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }
}

class TrendingVideoCard extends StatelessWidget {
  final String title;
  final String insight;
  final String description;
  final String reach;
  final String category;
  final String thumbnailPath;

  const TrendingVideoCard({
    super.key,
    required this.title,
    required this.insight,
    required this.description,
    required this.reach,
    required this.category,
    required this.thumbnailPath,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Stack(
          alignment: Alignment.center,
          children: [
            AspectRatio(
              aspectRatio: 342 / 192,
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withValues(alpha: 0.25),
                      blurRadius: 50,
                      spreadRadius: -12,
                      offset: const Offset(0, 25),
                    ),
                  ],
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: Image.asset(thumbnailPath, fit: BoxFit.cover),
                ),
              ),
            ),
            Container(
              width: 64,
              height: 64,
              decoration: BoxDecoration(
                color: AppColors.primaryRed.withValues(alpha: 0.9),
                borderRadius: BorderRadius.circular(12),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withValues(alpha: 0.1),
                    blurRadius: 25,
                    spreadRadius: -5,
                    offset: const Offset(0, 20),
                  ),
                ],
              ),
              child: const Icon(
                Icons.play_arrow,
                color: Colors.white,
                size: 32,
              ),
            ),
          ],
        ),
        const SizedBox(height: 24),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
          decoration: BoxDecoration(
            color: const Color(0xFFE8E8E8),
            borderRadius: BorderRadius.circular(2),
          ),
          child: Text(
            insight.toUpperCase(),
            style: AppTypography.labelLarge.copyWith(
              color: AppColors.textMain,
              fontWeight: FontWeight.w800,
              fontSize: 10,
              letterSpacing: 1,
            ),
          ),
        ),
        const SizedBox(height: 16),
        Text(
          title,
          style: AppTypography.headlineMedium.copyWith(
            color: AppColors.textMain,
            fontWeight: FontWeight.w900,
            fontSize: 24,
            letterSpacing: -0.6,
            height: 1,
          ),
        ),
        const SizedBox(height: 16),
        Text(
          description,
          style: AppTypography.bodyMedium.copyWith(
            color: const Color(0xFF603E39),
            fontSize: 16,
            height: 1.6,
          ),
        ),
        const SizedBox(height: 16),
        Row(
          children: [
            Text(
              '+$reach REACH',
              style: AppTypography.labelLarge.copyWith(
                color: AppColors.primaryRed,
                fontWeight: FontWeight.w800,
                fontSize: 12,
              ),
            ),
            const SizedBox(width: 16),
            Text(
              category.toUpperCase(),
              style: AppTypography.bodySmall.copyWith(
                color: const Color(0xFF603E39),
                fontWeight: FontWeight.bold,
                fontSize: 12,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
