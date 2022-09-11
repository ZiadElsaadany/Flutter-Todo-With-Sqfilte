import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_with_sql/contrioller/provider.dart';
import 'package:todo_with_sql/view/empty_tasks.dart';
import 'package:todo_with_sql/view/task_widget/task_widget.dart';

class HomeTasks extends StatefulWidget {
  @override
  State<HomeTasks> createState() => _HomeTasksState();
}

class _HomeTasksState extends State<HomeTasks> {
  @override
  Widget build(BuildContext context) {
    return Consumer<ProviderClass>(builder: (ctx, provider, _) {
      return Expanded(
        child: provider.setDataLoading
            ? const Center(
                child: CircularProgressIndicator(
                  color: Colors.red,
                ),
              )
            : provider.HomeTasks.isNotEmpty ? ListView.separated(
                    itemBuilder: (ctx, index) {
                      return Dismissible(
                        key: UniqueKey() ,
                        onDismissed: (value) {
                          if (value == DismissDirection.startToEnd) {
                            provider.deleteData(id:provider.HomeTasks[index].id );
                            setState(() {
                              provider.HomeTasks.remove(provider.HomeTasks[index]);
                            });
                          }
                        },
                        background: Container(
                          alignment: Alignment.centerLeft,
                          width: double.infinity,
                          decoration: const BoxDecoration(
                            color: Colors.red
                          ),
                          child: const Padding(
                            padding: EdgeInsets.only(left: 10.0),
                            child: Icon(
                              Icons.delete,
                              color: Colors.white,
                              size: 60,
                            ),
                          ),
                        ),
                        secondaryBackground: Container(
                          alignment: Alignment.centerLeft,
                          decoration: BoxDecoration(
                            color: Colors.white.withOpacity(0.7),
                          ),
                        ),
                        child: TaskWidget(info: provider.HomeTasks[index]),
                        confirmDismiss: (d) async {
                          if (d == DismissDirection.endToStart) {
                            return false;
                          }
                          return true;
                        },
                      );
                    },
                    itemCount: provider.HomeTasks.length,
                    separatorBuilder: (ctx, index) => const SizedBox(
                      height: 20,
                    ),
                  )
                :  EmptyTasks('Please add some tasks'),
      );
    });
  }
}

/*
if (provider.HomeTasks.isEmpty || provider.HomeTasks == []) {

      } else {
 */
