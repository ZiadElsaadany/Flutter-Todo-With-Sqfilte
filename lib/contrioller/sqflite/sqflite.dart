import 'package:sqflite/sqflite.dart';

/// 1 --> create dataBase  && create tables
/// 2 --> open dataBase
/// 3 --> insert to dataBase
/// 4 --> get from dataBase
/// 5 --> Update in dataBase
/// 6 --> delete from dataBas
late Database database;
 createDataBase() async{
   database = await openDatabase(
      'todo.db', // database name
      version: 1,
      onCreate: (Database db, int version) async {
        // When creating the db, create the table
        print('dataBase Created');
        await db.execute(
         'CREATE TABLE todo(id INTEGER PRIMARY KEY, title TEXT, time TEXT, date TEXT)'
        ).then((value) => {print ('table created')}).catchError((e){
          print ('error when created table ${e.toString()}');
        });
      } ,
    onOpen: (db){
        print ('database opened ');
    }
  );
}
 insertToDataBase(){
   database.transaction((txn) async {
     txn.rawInsert(
      'INSERT INTO todo(title, time, date) VALUES("first task","time1","date1")')
         .then((value) => {print ('rwo added')}).
     catchError((e){print ('error when insert row ${e.toString()}');});
   } );
}
void InsertToDataBase(){}