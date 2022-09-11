import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_with_sql/contrioller/provider.dart';
import 'package:todo_with_sql/home/bottom_sheet/bottom_sheet_view.dart';
import 'package:todo_with_sql/view/all_tasks/all_tasks_screen.dart';
import 'package:todo_with_sql/view/archive_tasks/archive_tasks.dart';
import 'package:todo_with_sql/view/done_tasks/done_tasks.dart';
import 'package:todo_with_sql/view/home_tasks/home_tasks.dart';

class HomeScreen extends StatefulWidget {
  static const String route_name = 'Home';
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Widget> screens = [HomeTasks(), const DoneTasks(), ArchiveTasks(),AllTasksScreen()] ;

@override
initState(){
 super.initState();
  Future.delayed(Duration.zero,()async{
    Provider.of<ProviderClass>(context,listen: false).createDataBase();
  });
}
   @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Container(
          decoration:   BoxDecoration(
            color: Colors.deepOrange.withOpacity(0.8),
            borderRadius:const BorderRadius.only
              (bottomLeft: Radius.circular(90),
                bottomRight:  Radius.circular(90) ,
            ),
          ),
            height: MediaQuery.of(context).size.height*.12,
            child:  Center(child: Text(
              Provider.of<ProviderClass>(context).index==3?'All Tasks':
              'To do List',style:
            TextStyle(fontWeight: FontWeight.bold, letterSpacing: 2,fontSize: 25),))),
        toolbarHeight: MediaQuery.of(context).size.height*.13 ,
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      bottomNavigationBar: BottomNavigationBar(
        items:  const [
          BottomNavigationBarItem(
              icon: Icon(Icons.menu,size: 40),label: 'Home',
          ),
          BottomNavigationBarItem(icon: Icon(Icons.done,size: 40),
            label: 'Done',
          ),
          BottomNavigationBarItem(icon: Icon(Icons.archive,size:40),label: 'Archive',
          ),
          BottomNavigationBarItem(icon: Icon(Icons.select_all_rounded,size:40),label: 'All Tasks',
          ),
        ],
         showSelectedLabels: true,
        unselectedItemColor: Colors.black,
        selectedItemColor: Colors.deepOrange,
        currentIndex: Provider.of<ProviderClass>(context).index,
        onTap: (index){
          Provider.of<ProviderClass>(context,listen: false).index = index;
          setState(() {});
        },
      ),
      body:Provider.of<ProviderClass>(context).index  !=3? Column(
        children: [const SizedBox(
          height: 30,
        ),
          screens[Provider.of<ProviderClass>(context).index],
        ],
      ):  AllTasksScreen()  ,
      floatingActionButtonLocation: FloatingActionButtonLocation.miniCenterTop,
      floatingActionButton: Provider.of<ProviderClass>(context).index==0?
      Padding(
        padding: const EdgeInsets.only(right: 8.0),
        child: FloatingActionButton(
          backgroundColor: Colors.black,
          shape: const StadiumBorder(
           side:  BorderSide(
              color: Colors.white,
             width: 2
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
          child: const Padding(
            padding: EdgeInsets.all(8.0),
            child: Icon(Icons.add,size: 35,)
          ),
        ),
      ): null,
    );
  }
}

