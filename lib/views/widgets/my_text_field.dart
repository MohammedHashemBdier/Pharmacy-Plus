import 'package:flutter/material.dart';

class MyTextField extends StatelessWidget {
  final double height;
  final double? width;
  final String hint;
  final double fontSize;
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
    this.fontSize = 20,
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
      child: TextField(
        onTapOutside: onTapOutside,
        controller: controller,
        focusNode: focusNode,
        onChanged: onChanged,
        cursorColor: const Color(0xFF767676),
        readOnly: readOnly,
        enabled: enabled,
        style: TextStyle(
          color: const Color(0xFF767676),
          fontSize: fontSize,
          fontWeight: FontWeight.w600,
        ),
        decoration: InputDecoration(
          suffixIcon: suffixIcon,
          suffixIconColor: const Color(0xFF767676),
          contentPadding: EdgeInsets.symmetric(
            vertical: height / 2,
            horizontal: 20,
          ),
          label: Text(
            hint,
            style: TextStyle(color: Colors.grey.shade400),
          ),
          border: const OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(10)),
          ),
          focusColor: const Color(0xFF767676),
          focusedBorder: const OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(10)),
            borderSide: BorderSide(
              color: Color(0xFF767676),
              width: 1.5,
            ),
          ),
        ),
      ),
    );
  }
}
