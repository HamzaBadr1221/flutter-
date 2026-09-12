import 'package:flutter/material.dart';

class SocialButton extends StatelessWidget{
 final String text;
  final IconData icon;
  const SocialButton({super.key,required this.text,required this.icon});
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 50,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
      ),
      child:Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children:[
          Icon(icon,size:50),
          const SizedBox(width:10),
          Text(
              text,
            style: const TextStyle(
              color: Colors.black,
              fontSize: 20,
              fontWeight: FontWeight.w800,
            ),
          ),
        ]
      ),
    );
  }
}