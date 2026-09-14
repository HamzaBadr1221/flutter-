import 'package:flutter/material.dart';

class CustomtextField extends StatefulWidget {
  final String hintText;
  final bool obscureText;
  final TextEditingController? controller;
  final String? Function(String?)? validator;

  const CustomtextField({
    super.key,
    required this.hintText,
    this.obscureText = false,
    this.controller,
    this.validator,
  });

  @override
  State<CustomtextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomtextField> {
  bool isObscured = true;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;

    return TextFormField(
      controller: widget.controller,
      obscureText: widget.obscureText ? isObscured : false,
      validator: widget.validator,

      style: TextStyle(
        color: theme.colorScheme.onSurface,
      ),

      decoration: InputDecoration(
        hintText: widget.hintText,

        hintStyle: TextStyle(
          color: theme.colorScheme.onSurface.withOpacity(0.6),
        ),

        filled: true,

        fillColor: isDark
            ? Colors.white12
            : Colors.black.withOpacity(0.06),

        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(
            color: theme.colorScheme.outline.withOpacity(0.4),
            width: 3,
          ),
        ),

        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(
            color: Colors.blue,
            width: 2,
          ),
        ),

        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(
            color: Colors.red,
          ),
        ),

        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(
            color: Colors.red,
            width: 2,
          ),
        ),

        suffixIcon: widget.obscureText
            ? IconButton(
          icon: Icon(
            isObscured
                ? Icons.visibility_off
                : Icons.visibility,
            color: theme.colorScheme.onSurface.withOpacity(0.6),
          ),
          onPressed: () {
            setState(() {
              isObscured = !isObscured;
            });
          },
        )
            : null,
      ),
    );
  }
}