
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_with_sql/contrioller/provider.dart';
import 'package:todo_with_sql/view/home_tasks/home_tasks.dart';
import 'package:todo_with_sql/view/splash/Splash.dart';
import 'package:todo_with_sql/view/task_details/task_details_view.dart';

import 'home/home_screen.dart';


void main(){
  runApp(ChangeNotifierProvider(
      child: MYApp() ,
    create: (ctx)=>ProviderClass(),
  )
  );
}
class MYApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: SplashScreen.route_name,
      routes: {
        TaskDetails.route_name:(ctx)=>TaskDetails(),
        HomeScreen.route_name:(ctx)=>HomeScreen(),
        SplashScreen.route_name:(ctx)=>SplashScreen()
      },

    );
  }
}
