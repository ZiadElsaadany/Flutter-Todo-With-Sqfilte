
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_with_sql/contrioller/provider.dart';

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
      home: HomeScreen(),
    );
  }
}
