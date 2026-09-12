import 'package:flutter/material.dart';

class OrDivider extends StatelessWidget{
  const OrDivider({super.key});

  @override
  Widget build(BuildContext context){
    return Row (
      children: [
        Expanded(
          child: Divider(color: Colors.white,),
        ),
        const Padding(
           padding: EdgeInsets.symmetric(horizontal: 10),
          child: Text(
              'or' ,
            style: TextStyle(
              fontSize: 20,
                color: Colors.white54),
          )
        ),
        Expanded(
            child: Divider(color: Colors.white,),
        ),
      ],
    );
  }
}