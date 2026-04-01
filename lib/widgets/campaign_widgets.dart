import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../theme.dart';

class CampaignRequirementCard extends StatelessWidget {
  final String title;
  final String description;
  final String iconPath;

  const CampaignRequirementCard({
    super.key,
    required this.title,
    required this.description,
    required this.iconPath,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: Colors.white,
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
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SvgPicture.asset(
            iconPath,
            width: 24,
            height: 24,
            colorFilter: const ColorFilter.mode(AppColors.primaryRed, BlendMode.srcIn),
          ),
          const SizedBox(height: 24),
          Text(
            title.toUpperCase(),
            style: AppTypography.beVietnamProBold.copyWith(
              fontSize: 14,
              color: AppColors.textDark,
              letterSpacing: 0,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            description,
            style: AppTypography.interRegular.copyWith(
              fontSize: 14,
              color: AppColors.textBrown,
              height: 1.4,
            ),
          ),
        ],
      ),
    );
  }
}

class CampaignDeliverableTile extends StatelessWidget {
  final String title;
  final String description;

  const CampaignDeliverableTile({
    super.key,
    required this.title,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          margin: const EdgeInsets.only(top: 4),
          width: 24,
          height: 24,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(color: AppColors.primaryRed, width: 2),
          ),
          child: Center(
            child: Container(
              width: 8,
              height: 8,
              decoration: const BoxDecoration(
                color: AppColors.primaryRed,
                shape: BoxShape.circle,
              ),
            ),
          ),
        ),
        const SizedBox(width: 16),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title.toUpperCase(),
                style: AppTypography.beVietnamProBold.copyWith(
                  fontSize: 14,
                  color: AppColors.textDark,
                  letterSpacing: -0.35,
                ),
              ),
              const SizedBox(height: 4),
              Text(
                description,
                style: AppTypography.interRegular.copyWith(
                  fontSize: 12,
                  color: AppColors.textBrown,
                  height: 1.3,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class CampaignBenefitCard extends StatelessWidget {
  final String title;
  final String subtitle;
  final String? value;
  final Widget? trailing;

  const CampaignBenefitCard({
    super.key,
    required this.title,
    required this.subtitle,
    this.value,
    this.trailing,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(17),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: AppColors.textBrown.withValues(alpha: 0.1)),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: AppTypography.interMedium.copyWith(
                  fontSize: 16,
                  color: AppColors.textDark,
                ),
              ),
              Text(
                subtitle,
                style: AppTypography.interMedium.copyWith(
                  fontSize: 16,
                  color: AppColors.textDark,
                ),
              ),
            ],
          ),
          if (value != null)
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  "VALUE",
                  style: AppTypography.beVietnamProBlack.copyWith(
                    fontSize: 12,
                    color: AppColors.primaryRed,
                  ),
                ),
                Text(
                  value!,
                  style: AppTypography.beVietnamProBlack.copyWith(
                    fontSize: 12,
                    color: AppColors.primaryRed,
                  ),
                ),
              ],
            ),
          if (trailing != null) trailing!,
        ],
      ),
    );
  }
}
