import 'package:flutter/material.dart';
import '../theme.dart';

class AuthInputField extends StatefulWidget {
  final String label;
  final String hintText;
  final bool obscureText;
  final bool showPasswordToggle;
  final TextEditingController? controller;
  final TextInputType keyboardType;
  final Widget? prefix;
  final Widget? suffix;
  final bool readOnly;
  final VoidCallback? onTap;

  const AuthInputField({
    super.key,
    required this.label,
    required this.hintText,
    this.obscureText = false,
    this.showPasswordToggle = false,
    this.controller,
    this.keyboardType = TextInputType.text,
    this.prefix,
    this.suffix,
    this.readOnly = false,
    this.onTap,
  });

  @override
  State<AuthInputField> createState() => _AuthInputFieldState();
}

class _AuthInputFieldState extends State<AuthInputField> {
  late bool _isObscured;

  @override
  void initState() {
    super.initState();
    _isObscured = widget.obscureText;
  }

  @override
  Widget build(BuildContext context) {
    Widget? suffixWidget;

    if (widget.showPasswordToggle && widget.suffix != null) {
      // Both eye icon and suffix (e.g. FORGOT button)
      suffixWidget = Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          _buildEyeIcon(),
          const SizedBox(width: 4),
          widget.suffix!,
        ],
      );
    } else if (widget.showPasswordToggle) {
      suffixWidget = _buildEyeIcon();
    } else {
      suffixWidget = widget.suffix;
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          widget.label.toUpperCase(),
          style: AppTypography.interBold.copyWith(
            color: const Color(0xFF603E39),
            fontSize: 10,
            letterSpacing: 2,
          ),
        ),
        const SizedBox(height: 4),
        TextField(
          controller: widget.controller,
          obscureText: _isObscured,
          keyboardType: widget.keyboardType,
          readOnly: widget.readOnly,
          onTap: widget.onTap,
          style: AppTypography.interMedium.copyWith(
            color: AppColors.primaryDark,
            fontSize: 18,
          ),
          cursorColor: AppColors.primaryRed,
          decoration: InputDecoration(
            hintText: widget.hintText,
            hintStyle: AppTypography.interRegular.copyWith(
              color: const Color(0xFFD6D3D1),
              fontSize: 16,
            ),
            prefixIcon: widget.prefix != null
                ? Padding(
                    padding: const EdgeInsets.only(right: 8.0, top: 4.0),
                    child: widget.prefix,
                  )
                : null,
            prefixIconConstraints:
                const BoxConstraints(minWidth: 0, minHeight: 0),
            suffixIcon: suffixWidget,
            enabledBorder: const UnderlineInputBorder(
              borderSide: BorderSide(
                  color: Color(0x4D956D67)), // 0.3 opacity of 956D67
            ),
            focusedBorder: const UnderlineInputBorder(
              borderSide: BorderSide(color: AppColors.primaryRed),
            ),
            contentPadding:
                const EdgeInsets.symmetric(vertical: 14, horizontal: 0),
          ),
        ),
      ],
    );
  }

  Widget _buildEyeIcon() {
    return GestureDetector(
      onTap: () {
        setState(() {
          _isObscured = !_isObscured;
        });
      },
      child: Padding(
        padding: const EdgeInsets.only(top: 8.0),
        child: Icon(
          _isObscured ? Icons.visibility_off_outlined : Icons.visibility_outlined,
          color: const Color(0xFF956D67),
          size: 20,
        ),
      ),
    );
  }
}
