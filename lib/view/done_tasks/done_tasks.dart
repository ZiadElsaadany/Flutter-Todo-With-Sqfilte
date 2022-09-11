import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_with_sql/view/task_widget/task_widget.dart';

import '../../contrioller/provider.dart';
import '../empty_tasks.dart';

class DoneTasks extends StatefulWidget {
  const DoneTasks({Key? key}) : super(key: key);

  @override
  State<DoneTasks> createState() => _DoneTasksState();
}

class _DoneTasksState extends State<DoneTasks> {
  @override
  Widget build(BuildContext context) {
    return Consumer<ProviderClass> ( builder: (ctx,provider,_)
    {
      if (provider.DoneTasks.isEmpty || provider.DoneTasks == []) {
        return  EmptyTasks('No Done Tasks');
      }
      else {
        return   Expanded(
          child: ListView.separated(itemBuilder: (ctx,index) {
            return Dismissible(key: UniqueKey(),
                onDismissed: (direction) {
              if(direction ==DismissDirection.startToEnd){
                provider.deleteData(id:provider.DoneTasks[index].id );
                provider.DoneTasks.removeAt(index);
              }
              setState(() {
              });
            },
              confirmDismiss: (d)async{
                if(d==DismissDirection.endToStart){
                  return false;
                }
                return true;
              },
              background:Container(
                alignment: Alignment.centerLeft,
                width: double.infinity,
                decoration:  const BoxDecoration(
                  color: Colors.red
                ),
                child:  const Padding(
                  padding: EdgeInsets.only(left: 10.0),
                  child: Icon(
                    Icons.delete, color: Colors.white,
                    size: 60,
                  ),
                ),
              ) ,
              secondaryBackground:Container(
                alignment: Alignment.centerLeft,
                decoration:  BoxDecoration(
                  color: Colors.white.withOpacity(0.7),
                ),
              ) ,
                child: TaskWidget( info:provider.DoneTasks[index] ,),
            );
          } ,
            itemCount: provider.DoneTasks.length,
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
