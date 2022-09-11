import 'package:flutter/material.dart';

class EmptyTasks extends StatelessWidget {
final String text ;
EmptyTasks(this.text);
  @override
  Widget build(BuildContext context) {
     return Center(
       child: Column(
        children:  [
          const Icon(Icons.wb_incandescent, size: 120,color: Colors.grey,),
          const SizedBox(
            height: 30,
          ),
          Center(
            child: Text(text, style: const TextStyle(
              color: Colors.grey,
              fontWeight: FontWeight.bold,
              fontSize: 22
            ),),
          ) ,
        ],
    ),
     );
  }
}
