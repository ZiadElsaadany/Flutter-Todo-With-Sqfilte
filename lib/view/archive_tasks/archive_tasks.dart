import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../contrioller/provider.dart';
import '../empty_tasks.dart';

class ArchiveTasks extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Consumer<ProviderClass> ( builder: (ctx,provider,_)
    {
      if (provider.AtchivedTasks.isEmpty || provider.AtchivedTasks == []) {
        return EmptyTasks();
      }
      else {
        return  Expanded(
          child: ListView.separated(itemBuilder: (ctx,index) {
            return provider.AtchivedTasks[index];
          } ,
            itemCount: provider.AtchivedTasks.length,
            separatorBuilder: (ctx,index)=>SizedBox(
              height: 20,
            ),
          ),
        );
    }
    }
    );
  }
}
