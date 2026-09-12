import 'package:flutter/material.dart';

class CustomtextField extends StatefulWidget {
  final String hintText;
  final bool obscureText;
  final TextEditingController? controller;
  final String? Function(String?)? validator;

  const CustomtextField({super.key, required this.hintText,
    this.obscureText = false, this.controller, this.validator});
  @override
  State<CustomtextField> createState() => _CustomTextFieldState();
}
class _CustomTextFieldState extends State<CustomtextField>{

  bool isObscured =true;
  @override
  Widget build(BuildContext context){
    return TextFormField(
      controller : widget.controller ,
      obscureText: widget.obscureText ? isObscured:false,
      validator: widget.validator,
      style: const TextStyle(
        color: Colors.white,
      ),
      decoration: InputDecoration(
          hintText:widget.hintText,
        hintStyle: const TextStyle(
          color: Colors.white54,
        ),
        filled: true,
        fillColor: Colors.white12,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide.none,
        ),
        suffixIcon:widget.obscureText
        ? IconButton(
          icon: Icon(
            isObscured? Icons.visibility_off:Icons.visibility,
            color: Colors.white54,
          ),
          onPressed:(){
            setState((){
              isObscured = !isObscured;
            });
          },
        )
        :null,
      ),
    );
  }
}