import 'package:flutter/material.dart';
import '../theme.dart';

class AnalysisMetricCard extends StatelessWidget {
  final String label;
  final String value;
  final String? trend;
  final bool isPrimary;

  const AnalysisMetricCard({
    super.key,
    required this.label,
    required this.value,
    this.trend,
    this.isPrimary = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: const Color(0xFFF3F3F3),
        border: isPrimary
            ? const Border(
                left: BorderSide(color: AppColors.primaryRed, width: 4),
              )
            : null,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label.toUpperCase(),
            style: AppTypography.interBold.copyWith(
              fontSize: 10,
              color: AppColors.textBrown,
              letterSpacing: 1,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            value,
            style: AppTypography.beVietnamProBlack.copyWith(
              fontSize: 30,
              color: AppColors.textDark,
            ),
          ),
          if (trend != null) ...[
            const SizedBox(height: 4),
            Row(
              children: [
                const Icon(Icons.arrow_drop_up, color: AppColors.primaryRed, size: 20),
                Text(
                  trend!,
                  style: AppTypography.interBold.copyWith(
                    fontSize: 10,
                    color: AppColors.primaryRed,
                  ),
                ),
              ],
            ),
          ] else ...[
            const SizedBox(height: 4),
            Text(
              "Average: 42%", // Placeholder variant
              style: AppTypography.interBold.copyWith(
                fontSize: 10,
                color: AppColors.textBrown,
              ),
            ),
          ],
        ],
      ),
    );
  }
}

class InsightCard extends StatelessWidget {
  final String title;
  final String description;
  final IconData icon;

  const InsightCard({
    super.key,
    required this.title,
    required this.description,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.04),
            blurRadius: 40,
            offset: const Offset(0, 12),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(icon, color: AppColors.primaryRed, size: 22),
              const SizedBox(width: 8),
              Text(
                title.toUpperCase(),
                style: AppTypography.interBold.copyWith(
                  fontSize: 12,
                  color: AppColors.primaryRed,
                  letterSpacing: 1.2,
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          Text(
            description,
            style: AppTypography.interRegular.copyWith(
              fontSize: 14,
              color: AppColors.textBrown,
              height: 1.6,
            ),
          ),
        ],
      ),
    );
  }
}

class SimilarAnalysisTile extends StatelessWidget {
  final String thumbnail;
  final String title;
  final String metadata;

  const SimilarAnalysisTile({
    super.key,
    required this.thumbnail,
    required this.title,
    required this.metadata,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: const BoxDecoration(
        color: Color(0xFFF3F3F3),
      ),
      child: Row(
        children: [
          Container(
            width: 96,
            height: 64,
            decoration: const BoxDecoration(
              color: Color(0xFFE5E5E5),
            ),
            child: Image.asset(
              thumbnail,
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  title.toUpperCase(),
                  style: AppTypography.interBold.copyWith(
                    fontSize: 12,
                    color: AppColors.textDark,
                    height: 1.2,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  metadata.toUpperCase(),
                  style: AppTypography.interBold.copyWith(
                    fontSize: 10,
                    color: AppColors.textBrown,
                    letterSpacing: 1,
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
