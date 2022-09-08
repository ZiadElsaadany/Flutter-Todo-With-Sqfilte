import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../contrioller/provider.dart';
import '../empty_tasks.dart';

class DoneTasks extends StatelessWidget {
  const DoneTasks({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<ProviderClass> ( builder: (ctx,provider,_)
    {
      if (provider.DoneTasks.isEmpty || provider.DoneTasks == []) {
        return EmptyTasks();
      }
      else {
        return   Expanded(
          child: ListView.separated(itemBuilder: (ctx,index) {
            return provider.DoneTasks[index];
          } ,
            itemCount: provider.DoneTasks.length,
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
