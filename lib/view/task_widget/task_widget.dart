import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_with_sql/contrioller/provider.dart';
import 'package:todo_with_sql/model/information.dart';

class TaskWidget extends StatelessWidget {
Information  info  ;
TaskWidget({required this.info});
  @override
  Widget build(BuildContext context) {
    return Consumer<ProviderClass>(
      builder: (ctx,provider,_)=> Container(
        margin: const EdgeInsets.only(top: 10 ,  left: 10, right: 10),
        decoration: BoxDecoration(
          border: Border.all(color: Colors.black,width: 1),
          borderRadius: BorderRadius.circular(30)
        ),
        height: MediaQuery.of(context).size.height*0.15,
        width: double.infinity,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                 const Text('Time',style: TextStyle(color: Colors.grey,fontSize: 18, fontWeight: FontWeight.bold),),
                Container(
                  margin: const EdgeInsets.only(left: 5,top: 10),
                  padding: const EdgeInsets.only(top: 15 ,right: 15 ,left: 15,bottom:15),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
border: Border.all(color: Colors.red)
                  ),
                   child: Text(info.time,style: const
                   TextStyle(color: Colors.black,fontSize: 18,fontWeight: FontWeight.bold),

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
                   Text(info.title, overflow: TextOverflow.ellipsis,
                     style: const TextStyle(color: Colors.black
                   ,fontSize: 20,
                     fontWeight: FontWeight.bold,
                   ),
                     softWrap: false,


                   ),
                  const SizedBox(height: 10,),
                  Center(
                    child: Text(info.date,style: const TextStyle(color: Colors.grey
                      ,fontSize: 15,
                      fontWeight: FontWeight.bold,

                    ),),
                  ),
                ],
              ),
            ),
             IconButton(
                 onPressed: (){
                   provider.addDoneTask(TaskWidget(info: info));
                 },
                 icon : const Icon (Icons.check_rounded, size: 40,color: Colors.red,) ),
             Padding(
               padding: const EdgeInsets.only(right: 8.0),
               child: IconButton(icon: const Icon( Icons.archive_outlined,size: 40,color: Colors.red,), onPressed: (){
                 provider.addArchiveTask(TaskWidget(info: info));
               },),
             )
          ],
        ),
      ),
    );
  }
}
