import 'package:flutter/material.dart';
import '../theme.dart';

class AuthInputField extends StatelessWidget {
  final String label;
  final String hintText;
  final bool obscureText;
  final TextEditingController? controller;
  final TextInputType keyboardType;
  final Widget? prefix;
  final Widget? suffix;

  const AuthInputField({
    super.key,
    required this.label,
    required this.hintText,
    this.obscureText = false,
    this.controller,
    this.keyboardType = TextInputType.text,
    this.prefix,
    this.suffix,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label.toUpperCase(),
          style: AppTypography.interBold.copyWith(
            color: const Color(0xFF603E39),
            fontSize: 10,
            letterSpacing: 2,
          ),
        ),
        const SizedBox(height: 4),
        TextField(
          controller: controller,
          obscureText: obscureText,
          keyboardType: keyboardType,
          style: AppTypography.interMedium.copyWith(
            color: AppColors.primaryDark,
            fontSize: 18,
          ),
          cursorColor: AppColors.primaryRed,
          decoration: InputDecoration(
            hintText: hintText,
            hintStyle: AppTypography.interRegular.copyWith(
              color: const Color(0xFFD6D3D1),
              fontSize: 16,
            ),
            prefixIcon: prefix != null
                ? Padding(
                    padding: const EdgeInsets.only(right: 8.0, top: 4.0),
                    child: prefix,
                  )
                : null,
            prefixIconConstraints: const BoxConstraints(minWidth: 0, minHeight: 0),
            suffixIcon: suffix,
            enabledBorder: const UnderlineInputBorder(
              borderSide: BorderSide(color: Color(0x4D956D67)), // 0.3 opacity of 956D67
            ),
            focusedBorder: const UnderlineInputBorder(
              borderSide: BorderSide(color: AppColors.primaryRed),
            ),
            contentPadding: const EdgeInsets.symmetric(vertical: 14, horizontal: 0),
          ),
        ),
      ],
    );
  }
}
