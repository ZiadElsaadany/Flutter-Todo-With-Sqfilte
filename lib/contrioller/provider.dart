import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';
import 'package:todo_with_sql/model/information.dart';

class ProviderClass extends ChangeNotifier {
  String title = ' ';

  String date = ' ';

  String time = ' ';

  int index = 0;
  Database? database;


  List<Information> HomeTasks = [];

  List<Information> DoneTasks = [];

  List<Information> ArchivedTasks = [];

  List<Map>  tasks= [ ];

  addTask(Information info) {
    HomeTasks.add(info);
    notifyListeners();
  }

  addArchiveTask(Information info) {
    ArchivedTasks.add(info);
    notifyListeners();
  }

  addDoneTask(Information info) {
    DoneTasks.add(info);
    notifyListeners();
  }
  bool setDataLoading = false;
  Future createDataBase() async {
     SetDataLoading();
  database = await openDatabase('todo.db', // database name
        version: 1, onCreate: (Database db, int version) {
      // When creating the db, create the table
      print('dataBase Created');
      db.execute(
              'CREATE TABLE todo ( id INTEGER PRIMARY KEY, title TEXT, time TEXT, date TEXT, description TEXT,type TEXT, sliderValue TEXT)')
          .then((value) => {print('table created')});
    }, onOpen: (db) {
      print('database opened ');
      getDataFromDatabase(db).then((value) {
        database= db;
        tasks = value;
        tasks.forEach((element) {
         if(element['type'] == 'new') {
          addTask(
              Information(
                time: element['time'],
                title: element['title'],
                date: element['date']  ,
                id:element['id'],
              description: element['description'],
              sliderValue: element['sliderValue']
           )
          );
         notifyListeners();
         }
         else if(element['type'] == 'done') {addDoneTask(
             Information(
           time: element['time'],
           title: element['title'],
           date: element['date']  ,
           id:element['id'],
           description: element['description']
         ));notifyListeners();}
         else if(element['type'] == 'Archived') {addArchiveTask(Information(
           time: element['time'],
           title: element['title'],
           date: element['date']  ,
           id:element['id'],
             description: element['description'],
           sliderValue: element['sliderValue']
         ),
         );
          notifyListeners();}
          notifyListeners();
        });
        print (tasks);
         SetDataLoading();
        notifyListeners();

      } );
    });
  }
  Future insertToDataBase(
      {required String title,
        required String time,
        required String date,
        required String description,})
  async {
    return await database!.transaction((txn) async {
      txn.rawInsert(
          'INSERT INTO todo(title, time, date, description, type,sliderValue) VALUES("$title","$time","$date","$description", "new", "0" )');
    });
  }

  void  SetDataLoading(){
    setDataLoading= !setDataLoading;
    notifyListeners();
  }


  Future<List<Map>> getDataFromDatabase(db) async{
 return await  db.rawQuery('SELECT * FROM todo');
}

void  updateData(
  {
  required String type,
    required int id  ,
}
    ) async{
 database!.rawUpdate(
      'UPDATE todo SET type = ? WHERE id   = ?',
      [type, '$id']
 ).then((value) {
notifyListeners();
 });
 notifyListeners();
}

  void  updateSliderData(
      {
        required int id ,
        required String sliderValue
      }
      ) async{
    database!.rawUpdate(
        'UPDATE todo SET sliderValue = ? WHERE id  = ?',
        [sliderValue, '$id']
    ).then((value) {
      notifyListeners();
    });
    notifyListeners();
  }



void deleteData(
  {
  required  int id
}
    ) async{
    database?.rawDelete('DELETE FROM todo WHERE id = ?', [id]).then((value) {
      notifyListeners();
    } );
notifyListeners();
  }

  double numberOfSlider =   0;



}

/// 1 --> create dataBase  && create tables
/// 2 --> open dataBase
/// 3 --> insert to dataBase
/// 4 --> get from dataBase  --> import in open database
/// 5 --> Update in dataBase
/// 6 --> delete from dataBase
