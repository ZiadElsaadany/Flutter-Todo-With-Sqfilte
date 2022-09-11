import 'package:flutter/material.dart';

class IconWidget extends StatelessWidget {
final Icon icon ;
IconWidget({
  required this.icon
});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(8.0),
      child: Icon(icon.icon, color: Colors.red,size: 30,),
    );
  }
}
