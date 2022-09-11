import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:provider/provider.dart';
import 'package:todo_with_sql/contrioller/provider.dart';
import 'package:todo_with_sql/model/information.dart';
import 'package:todo_with_sql/view/task_details/task_details_view.dart';

class TaskWidget extends StatefulWidget {
Information  info  ;
TaskWidget({required this.info});

  @override
  State<TaskWidget> createState() => _TaskWidgetState();
}

class _TaskWidgetState extends State<TaskWidget> {
  @override
  Widget build(BuildContext context) {
    return Consumer<ProviderClass>(
      builder: (ctx,provider,_)=> 
          GestureDetector(
            onTap: ( ) { 
              Navigator.of(context).pushNamed(TaskDetails.route_name,
              arguments: Information(
                  time:widget.info.time , title: widget.info.title,
                  date: widget.info.date,
                description: widget.info.description,
                id: widget.info.id,
                sliderValue: widget.info.sliderValue
              )
              );
            } ,
            child: Container(
        margin: const EdgeInsets.only(top: 10 ,  left: 10, right: 10),
        decoration: BoxDecoration(
            border: Border.all(
               color: provider.index!=1?Colors.grey:Colors.green,
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
                    Text(
                     'Time',
                     style: TextStyle(
                         color:provider.index==1? Colors.green:Colors.grey,
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

              Provider.of<ProviderClass>(context).index==1?
              const Padding(
                padding: EdgeInsets.all(20.0),
                child: Text('Done!', style: TextStyle(
                    color: Colors.green,
                    fontSize: 20,
                    fontWeight: FontWeight.w900,
                    letterSpacing: 1
                ),),
              ):Padding(
                padding: const EdgeInsets.only(right: 5),
                child: IconButton(
                     onPressed: (){
                       provider.addDoneTask( widget.info);
                       Fluttertoast.showToast(
                         msg: "Task done",
                         // toastLength: Toast.LENGTH_SHORT,
                         gravity: ToastGravity.CENTER,
                         timeInSecForIosWeb: 1,
                         backgroundColor: Colors.green,
                         textColor: Colors.white,
                         fontSize: 20.0,

                       );
                       provider.index==2?
                       provider.ArchivedTasks.remove( widget.info):
                       provider.HomeTasks.remove( widget.info);
                       provider.updateData(type: 'done', id:widget.info.id);
                       setState(() {});
                     },
                     icon : const Icon (Icons.check_circle_rounded, size: 35,
                       color: Colors.deepOrange,) ),
              ),

              Provider.of<ProviderClass>(context).index==1?
                  const Text(''):
              Provider.of<ProviderClass>(context).index==2?
                  const Padding(
                    padding: EdgeInsets.all(10.0),
                    child: Text(''),
                  ):
              Padding(
                 padding: const EdgeInsets.only(right: 8.0),
                 child: IconButton(
                   icon: const Icon(
                     Icons.archive,size: 35,color: Colors.deepOrange,),
                   onPressed: (){
                   provider.addArchiveTask(widget.info);
                   Fluttertoast.showToast(
                     msg: "Task Archived",
                     // toastLength: Toast.LENGTH_SHORT,
                     gravity: ToastGravity.CENTER,
                     timeInSecForIosWeb: 1,
                     backgroundColor: Colors.grey,
                     textColor: Colors.white,
                     fontSize: 20.0,
                   );
                   provider.updateData(type: 'Archived', id: widget.info.id);
                   provider.HomeTasks.remove(widget.info) ;
                   setState(() {});
                 },),
               )
            ],
        ),
      ),
          ),
    );
  }
}
