import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_with_sql/contrioller/provider.dart';
import 'package:todo_with_sql/view/task_widget/task_done_all_widget.dart';

import '../task_widget/task_widget.dart';

class AllTasksScreen extends StatefulWidget {
  @override
  State<AllTasksScreen> createState() => _AllTasksScreenState();
}

class _AllTasksScreenState extends State<AllTasksScreen> {
  @override
  Widget build(BuildContext context) {
    return Consumer<ProviderClass>(builder: (context, provider, _) {
      return Container(
        color: Colors.white,
        child: Column(
          children:  [
            const SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 30.0),
              child: Row(
                children: [
             const      Text('New Tasks:   ',style: TextStyle(
                    color: Colors.black ,
                    fontSize: 18,
                    fontWeight: FontWeight.bold ,
                    letterSpacing: 2
                  ),),
                  Text('${provider.HomeTasks.length}',style: const TextStyle(
                      color: Colors.grey ,
                      fontSize: 18,
                      fontWeight: FontWeight.bold ,
                      letterSpacing: 2
                  ),),
                ],
              ),
            )  ,
            Expanded(
              flex: 1,
              child: SizedBox(
                height: MediaQuery.of(context).size.height*0.2,
                child:
                provider.HomeTasks.length!=0?
                ListView.separated(
                  physics: const BouncingScrollPhysics(),
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (ctx, index) {
                    return SizedBox(
                        width:
                        MediaQuery.of(context).size.width*0.9
                        ,child: TaskWidget(info: provider.HomeTasks[index]));
                  },
                  itemCount: provider.HomeTasks.length,
                  separatorBuilder: (ctx, index) => const SizedBox(
                    width: 10,
                  ),
                ) :
                 Column(
                   mainAxisAlignment: MainAxisAlignment.center,
                   children: const [
                     Icon(Icons.menu,size: 40,color: Colors.grey,),
                     Text('No New Tasks',style: TextStyle(
                       fontWeight: FontWeight.bold,
                       fontSize: 18,
                       color: Colors.grey
                     ),),
                   ],
                 )
              ),
            ),
            const SizedBox(
              height: 5,
            ),
            const Divider(
              color: Colors.grey,
              thickness: 2,
              indent: 70,
              endIndent: 70,
            ),
            const SizedBox(
              height: 15,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 30.0),
              child: Row(
                children: [
                  const      Text('Done Tasks:   ',style: TextStyle(
                      color: Colors.black ,
                      fontSize: 18,
                      fontWeight: FontWeight.bold ,
                      letterSpacing: 2
                  ),),
                  Text('${provider.DoneTasks.length}',style: const TextStyle(
                      color: Colors.green ,
                      fontSize: 18,
                      fontWeight: FontWeight.bold ,
                      letterSpacing: 2
                  ),),
                ],
              ),
            )  ,
            provider.DoneTasks.length!=0?
            Expanded(
              flex:3 ,
              child: ListView.builder(
                physics: const BouncingScrollPhysics(),
                scrollDirection: Axis.vertical,
                itemBuilder: (ctx, index) {
                  return SizedBox(
                      width:
                      provider.DoneTasks.length==1?
                      MediaQuery.of(context).size.width*1:
                      MediaQuery.of(context).size.width*0.9
                      ,child: TaskDoneAll(
                      info: provider.DoneTasks[index]));
                },
                itemCount: provider.DoneTasks.length,
              ),
            ) :  Expanded(
              flex: 3,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [

                  Icon(Icons.menu,size: 40,color: Colors.grey,),
                  Text('No New Tasks',style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.grey,
                      fontSize: 18
                  ),),
                ],
              ),
            )
            ,
          ],
        ),
      ) ;
    });
  }
}
