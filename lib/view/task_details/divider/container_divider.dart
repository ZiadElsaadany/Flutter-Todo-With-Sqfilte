import 'package:flutter/material.dart';

class ContainerDivider extends StatelessWidget {
final int id ;
ContainerDivider(this.id) ;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 25, right: 50, top: 5,bottom: 5),
      height: 2,
      color: id!=1 ?Colors.black : Colors.green,
    )  ;
  }
}
