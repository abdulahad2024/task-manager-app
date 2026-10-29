import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:task_masenger_app/app/core/constants/color/app_color.dart';

class CustomOtpField extends StatefulWidget {
  final int length;
  final ValueChanged<String> onChanged;
  final ValueChanged<String>? onCompleted;
  final double boxSize;
  final BorderRadius? borderRadius;
  final Color? fillColor;
  final Color? borderColor;
  final Color? focusedBorderColor;

  const CustomOtpField({
    super.key,
    this.length = 6,
    required this.onChanged,
    this.onCompleted,
    this.boxSize = 48.0,
    this.borderRadius,
    this.fillColor,
    this.borderColor,
    this.focusedBorderColor,
  });

  @override
  State<CustomOtpField> createState() => _CustomOtpFieldState();
}

class _CustomOtpFieldState extends State<CustomOtpField> {
  late List<TextEditingController> _controllers;
  late List<FocusNode> _focusNodes;

  @override
  void initState() {
    super.initState();
    _controllers = List.generate(widget.length, (index) => TextEditingController());
    _focusNodes = List.generate(widget.length, (index) => FocusNode());
  }

  @override
  void dispose() {
    for (var controller in _controllers) {
      controller.dispose();
    }
    for (var node in _focusNodes) {
      node.dispose();
    }
    super.dispose();
  }

  // সব বক্সের টেক্সট একসাথে জোড়া লাগানোর ফাংশন
  void _updateOtp() {
    String otp = _controllers.map((controller) => controller.text).join();
    widget.onChanged(otp);
    if (otp.length == widget.length && widget.onCompleted != null) {
      widget.onCompleted!(otp);
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;

    final defaultFillColor = widget.fillColor ?? (isDark ? Colors.grey.shade900 : const Color(0xFFF4FBF0));
    final defaultBorderColor = widget.borderColor ?? (isDark ? Colors.grey.shade700 : Colors.grey.shade300);
    final activeBorderColor = widget.focusedBorderColor ?? AppColor.primaryColor;

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: List.generate(widget.length, (index) {
        return SizedBox(
          width: widget.boxSize,
          height: widget.boxSize,
          child: TextFormField(
            controller: _controllers[index],
            focusNode: _focusNodes[index],
            onChanged: (value) {
              if (value.isNotEmpty) {
                // যদি একটি ডিজিট লেখা হয়ে যায়, পরের বক্সে ফোকাস নাও
                if (index < widget.length - 1) {
                  _focusNodes[index + 1].requestFocus();
                } else {
                  _focusNodes[index].unfocus(); // শেষ বক্সে গেলে কিবোর্ড হাইড হবে
                }
              } else if (value.isEmpty) {
                // ব্যাকস্পেস দিলে আগের বক্সে ফিরে যাবে
                if (index > 0) {
                  _focusNodes[index - 1].requestFocus();
                }
              }
              _updateOtp(); // পুরো ওটিপি আপডেট করা
            },
            maxLength: 1,
            keyboardType: TextInputType.number,
            textAlign: TextAlign.center,
            inputFormatters: [
              LengthLimitingTextInputFormatter(1),
              FilteringTextInputFormatter.digitsOnly,
            ],
            style: theme.textTheme.titleMedium?.copyWith(
              fontWeight: FontWeight.bold,
            ),
            decoration: InputDecoration(
              counterText: '',
              filled: true,
              fillColor: defaultFillColor,
              contentPadding: EdgeInsets.zero,
              border: OutlineInputBorder(
                borderRadius: widget.borderRadius ?? BorderRadius.circular(10),
                borderSide: BorderSide(color: defaultBorderColor),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: widget.borderRadius ?? BorderRadius.circular(10),
                borderSide: BorderSide(color: defaultBorderColor),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: widget.borderRadius ?? BorderRadius.circular(10),
                borderSide: BorderSide(color: activeBorderColor, width: 1.5),
              ),
            ),
          ),
        );
      }),
    );
  }
}