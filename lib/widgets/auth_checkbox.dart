import 'package:flutter/material.dart';
import '../theme.dart';

class AuthCheckbox extends StatefulWidget {
  final String label;
  final bool initialValue;
  final ValueChanged<bool?> onChanged;
  final Widget? richLabel;

  const AuthCheckbox({
    super.key,
    required this.label,
    this.initialValue = false,
    required this.onChanged,
    this.richLabel,
  });

  @override
  State<AuthCheckbox> createState() => _AuthCheckboxState();
}

class _AuthCheckboxState extends State<AuthCheckbox> {
  late bool _value;

  @override
  void initState() {
    super.initState();
    _value = widget.initialValue;
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() => _value = !_value);
        widget.onChanged(_value);
      },
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 20,
            height: 20,
            margin: const EdgeInsets.only(top: 2),
            decoration: BoxDecoration(
              color: Colors.white,
              border: Border.all(
                color: const Color(0xFFBC0100).withOpacity(0.3),
                width: 1,
              ),
              borderRadius: BorderRadius.circular(2),
            ),
            child: _value
                ? const Icon(
                    Icons.check,
                    size: 14,
                    color: Color(0xFFBC0100),
                  )
                : null,
          ),
          const SizedBox(width: 12),
          Expanded(
            child: widget.richLabel ??
                Text(
                  widget.label,
                  style: AppTypography.interMedium.copyWith(
                    color: const Color(0xFF603E39),
                    fontSize: 14,
                  ),
                ),
          ),
        ],
      ),
    );
  }
}
