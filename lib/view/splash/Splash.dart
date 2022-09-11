import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../home/home_screen.dart';

class SplashScreen extends StatefulWidget {
  static const String route_name=  'Splash' ;
  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  late Timer timer ;

  goNext( )=> Navigator.pushReplacementNamed(context,HomeScreen.route_name );

  startDelay(){
    timer=Timer(const Duration(
        milliseconds: 3000
    ), ()=> goNext()
    );
  }
  @override
  void initState() {
    super.initState();
    startDelay()  ;
  }
  @override
  void dispose() {
    timer.cancel() ;
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
                const Text( 'Welcome!',
            style: TextStyle(
              fontSize: 40 ,
              color: Colors.brown,
              fontWeight: FontWeight.bold,
              letterSpacing: 2
            ),
          ),
          const Spacer(flex: 2,),
          Center(child: ClipRRect(
              borderRadius: const BorderRadius.only(
                  bottomRight: Radius.circular(50) , 
                  bottomLeft:Radius.circular(50),topRight: Radius.circular(20),
              topLeft: Radius.circular(20)
              ),
              child: Image.asset('assets/images/icon.jpg',height: 150,))),
          const Spacer(flex: 2,),
          const Padding(
            padding: EdgeInsets.only(bottom: 60.0),
            child: Text('Ziad Elsaadany',style:TextStyle(
                color:  Colors.brown ,
                fontSize: 22,
                fontWeight: FontWeight.bold
            ),),
          ),
          const Spacer(flex: 1,),
        ],
      ),
    );
  }
}
