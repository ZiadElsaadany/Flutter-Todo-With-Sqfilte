import 'package:flutter/material.dart';

class HeaderWidget extends StatelessWidget {
final String text ;
HeaderWidget( {
  required  this.text
} );
  @override
  Widget build(BuildContext context) {
    return   Text(text,style:  TextStyle(
        color: Colors.black26.withOpacity(0.4),
        fontSize: 23,
        fontWeight: FontWeight.bold
    ),);
  }
}
