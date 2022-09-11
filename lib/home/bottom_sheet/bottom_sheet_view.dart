import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:provider/provider.dart';
import 'package:todo_with_sql/contrioller/provider.dart';
import 'package:todo_with_sql/home/bottom_sheet/text_field_component.dart';
import 'package:todo_with_sql/model/information.dart';

class BottomSheetWidget extends StatefulWidget {
  @override
  State<BottomSheetWidget> createState() => _BottomSheetWidgetState();
}

class _BottomSheetWidgetState extends State<BottomSheetWidget> {
  TextEditingController titlecontroller = TextEditingController();
  TextEditingController timecontroller = TextEditingController();
  TextEditingController datecontroller = TextEditingController();
  TextEditingController descriptionContorller = TextEditingController();
  GlobalKey<FormState> formController = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Consumer<ProviderClass>(
      builder: (cotext, provider, _) => Form(
        key: formController,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0,horizontal: 20),
          child: SingleChildScrollView(
            child: SizedBox(
              height: MediaQuery.of(context).size.height * 0.83,
              child: Column(
                children: [
                  const SizedBox(
                    height: 10,
                  ),
                  TextFieldWidget(
                      controller: titlecontroller,
                      icon: const Icon(Icons.title),
                      textLabel: 'Task Title',
                      errorText: 'Please enter a Task Title',
                      ontab: () {} ,
                  index: 0,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  TextFieldWidget(
                    controller: timecontroller,
                    icon: const Icon(Icons.timer),
                    textLabel: 'Task Time',
                    errorText: 'Please enter a Task Time',
                    ontab: ( ) {},
                    index: 1,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  TextFieldWidget(
                    controller: datecontroller,
                    icon: const Icon(Icons.date_range_sharp),
                    errorText: 'Please enter a Task Date',
                    ontab: () {},
                    index:2 ,
                    textLabel: 'Task Date',
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  TextFieldWidget(
                      controller: descriptionContorller,
                      icon: const Icon(Icons.wb_incandescent_outlined),
                      textLabel: 'Task Description',
                      errorText: 'Please enter a Task Description',
                      ontab: () {},
                      index: 3,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      style: ButtonStyle(
                          padding:
                              MaterialStateProperty.all(EdgeInsets.all(13)),
                          shape:
                              MaterialStateProperty.all<RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                          )),
                          backgroundColor:
                              MaterialStateProperty.all(Colors.red)),
                      onPressed: () {
                               if (formController.currentState?.validate() == true) {
                          provider.insertToDataBase(
                              title: titlecontroller.text,
                              time: timecontroller.text,
                              date: datecontroller.text,
                              description: descriptionContorller.text);
                          provider.addTask(
                              Information(
                                  time: timecontroller.text,
                                  title: titlecontroller.text,
                                  date: datecontroller.text,
                                  description: descriptionContorller.text ,
                              )
                          );
                          Navigator.pop(context);
                          Fluttertoast.showToast(
                            msg: "Task Added",
                            // toastLength: Toast.LENGTH_SHORT,
                            gravity: ToastGravity.CENTER,
                            timeInSecForIosWeb: 1,
                            backgroundColor: Colors.black,
                            textColor: Colors.white,
                            fontSize: 20.0,

                          );

                          setState(() {});

                        }
                      },
                      child: const Text(
                        'ADD Task',
                        style: TextStyle(fontSize: 20),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
