import 'package:flutter/material.dart';

class SecondaryTextWidget extends StatelessWidget {
String text ;
SecondaryTextWidget({
  required this.text
});
  @override
  Widget build(BuildContext context) {
    return  Text(text, style: const TextStyle(
        color: Colors.black,
        fontSize: 22,
        fontWeight: FontWeight.w500,
        letterSpacing: 1.5
    ),) ;
  }
}
