import 'package:flutter/material.dart';

class SocialButton extends StatelessWidget {
 final String text;
 final IconData icon;

 const SocialButton({
  super.key,
  required this.text,
  required this.icon,
 });

 @override
 Widget build(BuildContext context) {
  final theme = Theme.of(context);

  return Container(
   width: double.infinity,
   height: 50,
   decoration: BoxDecoration(
    color: theme.colorScheme.surface,
    borderRadius: BorderRadius.circular(10),
    border: Border.all(
     color: theme.colorScheme.outline.withOpacity(0.4),
     width: 3,
    ),
   ),
   child: Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
     Icon(
      icon,
      size: 35,
      color: theme.colorScheme.onSurface,
     ),

     const SizedBox(width: 10),

     Text(
      text,
      style: TextStyle(
       color: theme.colorScheme.onSurface,
       fontSize: 20,
       fontWeight: FontWeight.w800,
      ),
     ),
    ],
   ),
  );
 }
}