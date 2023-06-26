import 'package:flutter/material.dart';

class TextFieldWidget extends StatelessWidget {
  const TextFieldWidget(
      {super.key,
      required this.controller,
      this.hintText,
      required this.labelText,
      required this.icon,
      required this.onTap,
      this.obscureText,
      this.keyboardType});
  final TextEditingController controller;
  final String? hintText;
  final String labelText;
  final Function() onTap;
  final IconData icon;
  final bool? obscureText;
  final TextInputType? keyboardType;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      obscureText: obscureText ?? false,
      keyboardType: keyboardType,
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(19),
        ),
        hintText: hintText ?? "",
        hintStyle: TextStyle(fontWeight: FontWeight.bold),
        label: Text(
          labelText,
          style: const TextStyle(fontSize: 19, fontWeight: FontWeight.w600),
        ),
        suffixIcon: IconButton(
          onPressed: onTap,
          icon: Icon(icon),
        ),
      ),
    );
  }
}
