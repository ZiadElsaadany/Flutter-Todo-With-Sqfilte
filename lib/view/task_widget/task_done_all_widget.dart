import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_with_sql/contrioller/provider.dart';
import 'package:todo_with_sql/model/information.dart';
import 'package:todo_with_sql/view/task_details/task_details_view.dart';

class TaskDoneAll extends StatefulWidget {
  Information  info  ;
  TaskDoneAll({required this.info});

  @override
  State<TaskDoneAll> createState() => _TaskDoneAll();
}

class _TaskDoneAll extends State<TaskDoneAll> {
  @override
  Widget build(BuildContext context) {
    return Consumer<ProviderClass>(
      builder: (ctx,provider,_)=>
          Container(
            margin: const EdgeInsets.only(top: 10 ,  left: 30, right: 30,bottom: 5),
            decoration: BoxDecoration(
                border: Border.all(
                    color: Colors.green,
                    width: 2),

                borderRadius: BorderRadius.circular(25)
            ),
            height: MediaQuery.of(context).size.height*0.15,
            width: double.infinity,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      'Time',
                      style: TextStyle(
                          color:Colors.green,
                          fontSize: 18, fontWeight: FontWeight.bold),),
                    Container(
                      margin: const EdgeInsets.only(left: 5,top: 10),
                      padding: const EdgeInsets.only(top: 10 ,right: 10 ,left: 10,bottom:10),
                      decoration: BoxDecoration(
                        color: Colors.deepOrange.withOpacity(0.8),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Text(widget.info.time,style:
                      const TextStyle(
                          color:Colors.white,fontSize: 15,fontWeight: FontWeight.bold),
                      ),
                    ),
                  ],
                ),
                const SizedBox(width: 10,),
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(widget.info.title, overflow: TextOverflow.ellipsis,
                        style:  const TextStyle(
                          color: Colors.black
                          ,fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 10,),
                      Center(
                        child: Text(widget.info.date,style:  const TextStyle(
                          color: Colors.grey
                          ,fontSize: 17,
                          fontWeight: FontWeight.bold,

                        ),),
                      ),
                    ],
                  ),
                ),

                const Padding(
                  padding: EdgeInsets.all(20.0),
                  child: Text('Done!', style: TextStyle(
                      color: Colors.green,
                      fontSize: 20,
                      fontWeight: FontWeight.w900,
                      letterSpacing: 1
                  ),),
                )
              ],
            ),
          ),
    );
  }
}
