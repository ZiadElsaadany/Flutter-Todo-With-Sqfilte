import 'package:flutter/material.dart';

class EmptyTasks extends StatelessWidget {
  const EmptyTasks({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
     return Center(
       child: Column(
         mainAxisAlignment: MainAxisAlignment.center,
        children: const [
          Icon(Icons.menu, size: 100,color: Colors.grey,),
          Text('NO tasks yet, Please add some tasks', style: TextStyle(
            color: Colors.grey,
            fontWeight: FontWeight.bold,
            fontSize: 18
          ),) ,
        ],
    ),
     );
  }
}
