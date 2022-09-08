import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_with_sql/contrioller/provider.dart';
import 'package:todo_with_sql/view/empty_tasks.dart';

class HomeTasks extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Consumer<ProviderClass> ( builder: (ctx,provider,_)
    {
      if (provider.HomeTasks.isEmpty || provider.HomeTasks == []) {
      return const EmptyTasks();
      }
      else {
       return  Expanded(
         child: ListView.separated(itemBuilder: (ctx,index) {
           return provider.HomeTasks[index];
         } ,
         itemCount: provider.HomeTasks.length,
           separatorBuilder: (ctx,index)=>const SizedBox(
             height: 20,
           ),
         ),
       );
      }
}
    );
  }
}
