import 'package:flutter/material.dart';
import '../theme.dart';

class AuthProgressBar extends StatelessWidget {
  final int currentStep;
  final int totalSteps;

  const AuthProgressBar({
    super.key,
    required this.currentStep,
    required this.totalSteps,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'STEP $currentStep OF $totalSteps',
              style: AppTypography.beVietnamProBold.copyWith(
                color: const Color(0xFFBC0100),
                fontSize: 12,
                letterSpacing: 1.2,
              ),
            ),
            if (currentStep == 1)
              Text(
                'Welcome',
                style: AppTypography.interMedium.copyWith(
                  color: const Color(0xFF603E39),
                  fontSize: 12,
                ),
              ),
          ],
        ),
        const SizedBox(height: 16),
        Container(
          height: 4,
          width: double.infinity,
          decoration: BoxDecoration(
            color: const Color(0xFFE8E8E8),
            borderRadius: BorderRadius.circular(12),
          ),
          child: LayoutBuilder(
            builder: (context, constraints) {
              return Stack(
                children: [
                  Container(
                    width: constraints.maxWidth * (currentStep / totalSteps),
                    height: 4,
                    decoration: BoxDecoration(
                      color: const Color(0xFFBC0100),
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                ],
              );
            },
          ),
        ),
      ],
    );
  }
}
