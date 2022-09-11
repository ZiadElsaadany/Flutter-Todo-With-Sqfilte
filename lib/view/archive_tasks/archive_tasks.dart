import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_with_sql/view/task_widget/task_widget.dart';

import '../../contrioller/provider.dart';
import '../empty_tasks.dart';

class ArchiveTasks extends StatefulWidget {

  @override
  State<ArchiveTasks> createState() => _ArchiveTasksState();
}

class _ArchiveTasksState extends State<ArchiveTasks> {
  @override
  Widget build(BuildContext context) {
    return Consumer<ProviderClass> ( builder: (ctx,provider,_)
    {
      if (provider.ArchivedTasks.isEmpty || provider.ArchivedTasks == []) {
        return  EmptyTasks('No Archived Tasks');
      }
      else {
        return  Expanded(
          child: ListView.separated(itemBuilder: (ctx,index) {
            return Dismissible(
                key: UniqueKey(),
                background:Container(
                  alignment: Alignment.centerLeft,
                  width: double.infinity,
                  decoration:  const BoxDecoration(
                    color: Colors.red,
                  ),
                  child:  const Padding(
                    padding: EdgeInsets.only(left: 10.0),
                    child: Icon(
                      Icons.delete, color: Colors.white,
                      size: 60,
                    ),
                  ),
                ) ,
                onDismissed: (direction) {
                  if(direction ==DismissDirection.startToEnd){
                    provider.deleteData(id:provider.ArchivedTasks[index].id );
                    provider.ArchivedTasks.remove(provider.ArchivedTasks[index]);
                  }
                  setState(() {});
                },
                secondaryBackground:Container(
                  alignment: Alignment.centerLeft,
                  decoration:  BoxDecoration(
                    color: Colors.white.withOpacity(0.7),
                  ),
                ) ,
                confirmDismiss: (d)async{
                  if(d==DismissDirection.endToStart){
                    return false;
                  }
                  return true;
                },
                child: TaskWidget(info:provider.ArchivedTasks[index] ));
          } ,
            itemCount: provider.ArchivedTasks.length,
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
