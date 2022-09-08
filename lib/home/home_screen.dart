import 'package:flutter/material.dart';
import 'package:todo_with_sql/home/bottom_sheet/bottom_sheet_view.dart';
import 'package:todo_with_sql/view/archive_tasks/archive_tasks.dart';
import 'package:todo_with_sql/view/done_tasks/done_tasks.dart';
import 'package:todo_with_sql/view/home_tasks/home_tasks.dart';

class HomeScreen extends StatefulWidget {
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Widget> screens = [HomeTasks(), const DoneTasks(), ArchiveTasks()] ;

int index = 0 ;
@override
initState(){
  super.initState();

}
   @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Container(
          margin: const EdgeInsets.all(10),
          decoration:  BoxDecoration(
            color: Colors.red.withOpacity(0.8),
            borderRadius:const BorderRadius.only
              (bottomLeft: Radius.circular(20),
                bottomRight:  Radius.circular(20) ,
            topRight: Radius.circular(90),
            topLeft: Radius.circular(90)
            ),
          ),
            height: MediaQuery.of(context).size.height*.15 ,
            child: const Center(child: Text('Todo List App',style: TextStyle(fontWeight: FontWeight.bold, letterSpacing: 2,fontSize: 25),))),
        toolbarHeight: MediaQuery.of(context).size.height*.13 ,
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      bottomNavigationBar: BottomNavigationBar(
        items:  const [
          BottomNavigationBarItem(icon: Icon(Icons.menu,size: 40),label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.done,size: 40),label: 'Done'),
          BottomNavigationBarItem(icon: Icon(Icons.archive,size:40),label: 'Archive'),
        ],
         showSelectedLabels: true,
        unselectedItemColor: Colors.grey,
        selectedItemColor: Colors.red,

        currentIndex: index,
        onTap: (index){
          this.index = index;
          setState(() {

          });
        },
      ),
      body: Column(
        children: [
          SizedBox(height: 30,),
          screens[index],
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.black,
        shape: const StadiumBorder(
         side:  BorderSide(
            color: Colors.white,
           width: 5
          )
        ),
        onPressed: (){
          showModalBottomSheet(context: context,
              builder: (context)=>BottomSheetWidget()
          , shape:  RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(40.0),
            ),
          );

          },
        child: Icon(Icons.add),
      ),
    );
  }
}

