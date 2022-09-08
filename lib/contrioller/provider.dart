import 'package:flutter/material.dart';
import 'package:todo_with_sql/model/information.dart';
import 'package:todo_with_sql/view/task_widget/task_widget.dart';

class ProviderClass extends ChangeNotifier {
  String title  = ' ' ;
  String date  = ' ' ;
  String time  = ' ' ;

  List<TaskWidget>  HomeTasks= [
   TaskWidget(info: Information(title:'zaid' , date:'ziad' ,  time:'10' ), ),
  ] ;
  List<TaskWidget>  DoneTasks= [] ;
  List<TaskWidget>  AtchivedTasks= [] ;

  addTask(TaskWidget info){
    HomeTasks.add(info);
    notifyListeners();
  }
  addArchiveTask(TaskWidget info){
    AtchivedTasks.add(info);
  notifyListeners();
  }
  addDoneTask(TaskWidget info){
    DoneTasks.add(info);
    notifyListeners();
  }
}
/// 1 --> create dataBase  && create tables 
/// 2 --> open dataBase
/// 3 --> insert to dataBase
/// 4 --> get from dataBase
/// 5 --> Update in dataBase
/// 6 --> delete from dataBase