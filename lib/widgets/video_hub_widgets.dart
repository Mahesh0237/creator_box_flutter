import 'package:flutter/material.dart';
import '../theme.dart';

class CategoryChip extends StatelessWidget {
  final String label;
  final bool isSelected;
  final VoidCallback onTap;

  const CategoryChip({
    super.key,
    required this.label,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.only(right: 12),
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
        decoration: BoxDecoration(
          color: isSelected ? AppColors.primaryRed : const Color(0xFFE8E8E8),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Text(
          label,
          style: isSelected 
              ? AppTypography.interSemiBold.copyWith(
                  color: Colors.white,
                  fontSize: 14,
                )
              : AppTypography.interMedium.copyWith(
                  color: const Color(0xFF1A1C1C),
                  fontSize: 14,
                ),
        ),
      ),
    );
  }
}

class HeroVideoCard extends StatelessWidget {
  final String title;
  final String thumbnailPath;
  final VoidCallback onTap;

  const HeroVideoCard({
    super.key,
    required this.title,
    required this.thumbnailPath,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: AspectRatio(
        aspectRatio: 21 / 9,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(4),
          child: Stack(
            fit: StackFit.expand,
            children: [
              Image.asset(
                thumbnailPath,
                fit: BoxFit.cover,
                alignment: const Alignment(0, -0.2),
              ),
              Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      Colors.transparent,
                      Colors.black.withValues(alpha: 0.2),
                      Colors.black.withValues(alpha: 0.8),
                    ],
                    stops: const [0.0, 0.5, 1.0],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(24.0),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Expanded(
                      child: Text(
                        title,
                        style: AppTypography.interRegular.copyWith(
                          color: Colors.white.withValues(alpha: 0.8),
                          fontSize: 16,
                          height: 1.5,
                        ),
                      ),
                    ),
                    const SizedBox(width: 16),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          const Icon(Icons.play_arrow, color: Color(0xFF1A1C1C), size: 16),
                          const SizedBox(width: 6),
                          Text(
                            'Watch Now',
                            style: AppTypography.interBold.copyWith(
                              color: const Color(0xFF1A1C1C),
                              fontSize: 14,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class MasterclassCard extends StatelessWidget {
  final String title;
  final String thumbnailPath;
  final String duration;
  final String views;
  final String timeAgo;
  final VoidCallback onTap;

  const MasterclassCard({
    super.key,
    required this.title,
    required this.thumbnailPath,
    required this.duration,
    required this.views,
    required this.timeAgo,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        GestureDetector(
          onTap: onTap,
          child: Stack(
            alignment: Alignment.center,
            children: [
              AspectRatio(
                aspectRatio: 16 / 9,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(4),
                  child: Image.asset(
                    thumbnailPath,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              // Duration Tag
              Positioned(
                bottom: 12,
                right: 12,
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                  decoration: BoxDecoration(
                    color: Colors.black.withValues(alpha: 0.8),
                    borderRadius: BorderRadius.circular(2),
                  ),
                  child: Text(
                    duration,
                    style: AppTypography.interBold.copyWith(
                      color: Colors.white,
                      fontSize: 10,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 16),
        Text(
          title,
          style: AppTypography.interBold.copyWith(
            color: const Color(0xFF1A1C1C),
            fontSize: 20,
            height: 1.375,
            letterSpacing: -0.2,
          ),
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
        ),
        const SizedBox(height: 8),
        Row(
          children: [
            Text(
              views,
              style: AppTypography.interMedium.copyWith(
                color: const Color(0xFF603E39),
                fontSize: 12,
              ),
            ),
            const SizedBox(width: 8),
            Container(width: 4, height: 4, decoration: const BoxDecoration(color: Color(0xFF956D67), shape: BoxShape.circle)),
            const SizedBox(width: 8),
            Text(
              timeAgo,
              style: AppTypography.interMedium.copyWith(
                color: const Color(0xFF603E39),
                fontSize: 12,
              ),
            ),
          ],
        ),
        const SizedBox(height: 16),
        // Apply Button
        GestureDetector(
          onTap: onTap,
          child: Container(
            width: double.infinity,
            padding: const EdgeInsets.symmetric(vertical: 10),
            decoration: BoxDecoration(
              color: const Color(0xFFE8E8E8),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Center(
              child: Text(
                'APPLY THIS IDEA',
                style: AppTypography.interBold.copyWith(
                  color: const Color(0xFFB91C1C),
                  fontSize: 12,
                  letterSpacing: 1.2,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class ShortCard extends StatelessWidget {
  final String title;
  final String views;
  final String thumbnailPath;
  final VoidCallback onTap;

  const ShortCard({
    super.key,
    required this.title,
    required this.views,
    required this.thumbnailPath,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(4),
        ),
        clipBehavior: Clip.antiAlias,
        child: Stack(
          fit: StackFit.expand,
          children: [
            Image.asset(
              thumbnailPath,
              fit: BoxFit.cover,
            ),
            Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Colors.transparent,
                    Colors.black.withValues(alpha: 0.7),
                  ],
                  stops: const [0.3, 1.0],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: AppTypography.interBold.copyWith(
                      color: Colors.white,
                      fontSize: 14,
                      height: 1.25,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    views,
                    style: AppTypography.interMedium.copyWith(
                      color: Colors.white.withValues(alpha: 0.7),
                      fontSize: 10,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
