import 'package:flutter/material.dart';
import 'package:pharmacy_plus/constants/colors.dart';

class MyTextField extends StatelessWidget {
  final double height;
  final double? width;
  final String hint;
  final Widget? suffixIcon;
  final TextEditingController? controller;
  final FocusNode? focusNode;
  final bool readOnly;
  final bool enabled;
  final void Function(PointerDownEvent)? onTapOutside;
  final void Function(String)? onChanged;

  const MyTextField({
    super.key,
    required this.height,
    this.width,
    this.hint = '',
    this.suffixIcon,
    this.controller,
    this.focusNode,
    this.readOnly = false,
    this.enabled = true,
    this.onTapOutside,
    this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: 50,
      child: TextField(
        onTapOutside: onTapOutside,
        controller: controller,
        focusNode: focusNode,
        onChanged: onChanged,
        readOnly: readOnly,
        enabled: enabled,
        decoration: InputDecoration(
          focusColor: AppColors.c2,
          suffixIcon: suffixIcon,
          contentPadding: EdgeInsets.symmetric(
            vertical: height / 2,
            horizontal: 20,
          ),
          label: Text(
            hint,
          ),
          border: const OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(20)),
          ),
          focusedBorder: const OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(20)),
            borderSide: BorderSide(
              color: AppColors.c2,
            ),
          ),
        ),
      ),
    );
  }
}
