import 'package:flutter/material.dart';
import '../theme.dart';

class CreatorPodium extends StatelessWidget {
  final Map<String, dynamic> first;
  final Map<String, dynamic> second;
  final Map<String, dynamic> third;

  const CreatorPodium({
    super.key,
    required this.first,
    required this.second,
    required this.third,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 240,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          _buildPodiumItem(second, 2, 110),
          _buildPodiumItem(first, 1, 140, isFirst: true),
          _buildPodiumItem(third, 3, 90),
        ],
      ),
    );
  }

  Widget _buildPodiumItem(Map<String, dynamic> creator, int rank, double height, {bool isFirst = false}) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Stack(
          alignment: Alignment.topCenter,
          clipBehavior: Clip.none,
          children: [
            Container(
              width: isFirst ? 84 : 70,
              height: isFirst ? 84 : 70,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(
                  color: isFirst ? AppColors.primaryRed : Colors.white.withValues(alpha: 0.1),
                  width: 3,
                ),
                image: DecorationImage(
                  image: AssetImage(creator['avatar'] ?? 'assets/profile_placeholder.png'),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            if (isFirst)
              Positioned(
                top: -24,
                child: Image.asset('assets/crown_icon.png', width: 28, height: 28, errorBuilder: (_, __, ___) => const Icon(Icons.star, color: Colors.amber, size: 28)),
              ),
            Positioned(
              bottom: -10,
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 2),
                decoration: BoxDecoration(
                  color: isFirst ? AppColors.primaryRed : Colors.white,
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(color: AppColors.grayBorder, width: 1),
                ),
                child: Text(
                  '#$rank',
                  style: AppTypography.interBold.copyWith(
                    color: isFirst ? Colors.white : AppColors.textMain,
                    fontSize: 10,
                  ),
                ),
              ),
            ),
          ],
        ),
        const SizedBox(height: 16),
        Text(
          creator['name'] ?? '',
          style: AppTypography.interBold.copyWith(
            color: AppColors.textMain,
            fontSize: isFirst ? 14 : 12,
          ),
        ),
        Text(
          creator['category'] ?? '',
          style: AppTypography.interMedium.copyWith(
            color: AppColors.hintText,
            fontSize: 10,
          ),
        ),
        const SizedBox(height: 12),
        Container(
          width: isFirst ? 90 : 80,
          height: height,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: isFirst 
                ? [AppColors.primaryRed.withValues(alpha: 0.1), AppColors.primaryRed.withValues(alpha: 0.02)]
                : [Colors.white.withValues(alpha: 0.05), Colors.white.withValues(alpha: 0.01)],
            ),
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(12),
              topRight: Radius.circular(12),
            ),
            border: Border.all(color: AppColors.grayBorder.withValues(alpha: 0.5)),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                creator['engagement'] ?? '',
                style: AppTypography.interBold.copyWith(
                  color: isFirst ? AppColors.primaryRed : AppColors.textMain,
                  fontSize: 14,
                ),
              ),
              Text(
                'ENGAGEMENT',
                style: AppTypography.interMedium.copyWith(
                  color: AppColors.hintText,
                  fontSize: 8,
                  letterSpacing: 0.5,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class CreatorListTile extends StatelessWidget {
  final Map<String, dynamic> creator;
  final int rank;

  const CreatorListTile({
    super.key,
    required this.creator,
    required this.rank,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: AppColors.grayBorder, width: 1),
      ),
      child: Row(
        children: [
          SizedBox(
            width: 24,
            child: Text(
              '$rank',
              style: AppTypography.interBold.copyWith(
                color: AppColors.hintText,
                fontSize: 14,
              ),
            ),
          ),
          Container(
            width: 48,
            height: 48,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              image: DecorationImage(
                image: AssetImage(creator['avatar'] ?? 'assets/profile_placeholder.png'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  creator['name'] ?? '',
                  style: AppTypography.interBold.copyWith(
                    color: AppColors.textMain,
                    fontSize: 16,
                  ),
                ),
                Text(
                  creator['category'] ?? '',
                  style: AppTypography.interMedium.copyWith(
                    color: AppColors.hintText,
                    fontSize: 12,
                  ),
                ),
              ],
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                creator['engagement'] ?? '',
                style: AppTypography.interBold.copyWith(
                  color: AppColors.primaryRed,
                  fontSize: 16,
                ),
              ),
              Text(
                'ENGA. RATE',
                style: AppTypography.interMedium.copyWith(
                  color: AppColors.hintText,
                  fontSize: 10,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
