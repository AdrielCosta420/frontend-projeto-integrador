import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CustomTextFormField extends StatelessWidget {
  final TextEditingController textController;
  final String? label;
  final String? hintText;
  final int? maxLines;
  final Function(String)? onChanged;
  final IconData icon;
  final String? Function(String?)? validator;
  final TextInputType? keyboardType;
  final List<TextInputFormatter>? inputFormatters;
  final bool? obscure;
  const CustomTextFormField({
    super.key,
    required this.textController,
    this.label,
    this.hintText,
    this.maxLines,
    this.onChanged,
    required this.icon,
    this.validator,
    this.keyboardType,
    this.inputFormatters,
    this.obscure = false,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: validator,
      keyboardType: keyboardType,
      inputFormatters: inputFormatters,
      focusNode: FocusNode(),
      style: const TextStyle(
        color: Colors.black,
        fontSize: 13,
        letterSpacing: 0.1,
      ),
      onChanged: onChanged,
      controller: textController,
      decoration: InputDecoration(
        suffixIcon: Icon(icon),
        label: Text(label ?? ''),
        hintText: hintText,
        hintStyle: TextStyle(
          color: Colors.grey.shade400,
          fontSize: 13,
          letterSpacing: 0.1,
        ),
        border: UnderlineInputBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        enabledBorder: UnderlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(
            color: Colors.grey.shade400,
          ),
        ),
      ),
      maxLines: maxLines ?? 1,
    );
  }
}
