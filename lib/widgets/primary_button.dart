import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../theme.dart';

class PrimaryButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final bool isSecondary;
  final double? width;
  final String? iconPath;

  const PrimaryButton({
    super.key,
    required this.text,
    required this.onPressed,
    this.isSecondary = false,
    this.width,
    this.iconPath,
  });

  @override
  Widget build(BuildContext context) {
    if (isSecondary) {
      return InkWell(
        onTap: onPressed,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0),
          child: Text(
            text,
            style: AppTextStyles.bodySemiBold(
              16,
              color: AppColors.textDark,
            ),
          ),
        ),
      );
    }

    return GestureDetector(
      onTap: onPressed,
      child: Center(
        child: Container(
          width: width,
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(100),
            gradient: const LinearGradient(
              colors: [AppColors.primaryRed, AppColors.primaryRedLight],
              begin: Alignment.centerLeft,
              end: Alignment.centerRight,
            ),
            boxShadow: [
              BoxShadow(
                color: AppColors.primaryRed.withOpacity(0.3),
                offset: const Offset(0, 12),
                blurRadius: 24,
                spreadRadius: -4,
              ),
            ],
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: width != null ? MainAxisSize.max : MainAxisSize.min,
            children: [
              Text(
                text.toUpperCase(),
                style: AppTextStyles.headingBold(
                  16,
                ).copyWith(
                  letterSpacing: 1.2,
                ),
              ),
              const SizedBox(width: 8),
              if (iconPath != null)
                SvgPicture.asset(
                  iconPath!,
                  width: 18,
                  height: 18,
                  colorFilter: const ColorFilter.mode(
                    Colors.white,
                    BlendMode.srcIn,
                  ),
                )
              else
                const Icon(
                  Icons.arrow_forward,
                  color: Colors.white,
                  size: 18,
                ),
            ],
          ),
        ),
      ),
    );
  }
}
