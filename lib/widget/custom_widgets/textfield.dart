import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField(
      {super.key,
      required this.label,
      this.onChanged,
      this.controller,
      this.keyboardType,
      this.prefixText,
      this.maxLength,
      this.width});
  final String label;
  final void Function(String)? onChanged;
  final TextEditingController? controller;
  final TextInputType? keyboardType;
  final String? prefixText;
  final int? maxLength;
  final double? width;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      child: TextField(
        onChanged: onChanged,
        maxLength: maxLength,
        controller: controller,
        keyboardType: keyboardType,
        decoration: InputDecoration(labelText: label, prefixText: prefixText),
      ),
    );
  }
}
