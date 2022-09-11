import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_with_sql/contrioller/provider.dart';
import 'package:todo_with_sql/model/information.dart';
import 'package:todo_with_sql/view/task_details/divider/container_divider.dart';
import 'package:todo_with_sql/view/task_details/icon/icon_widget.dart';
import 'package:todo_with_sql/view/task_details/text_widget/header_widget.dart';
import 'package:todo_with_sql/view/task_details/text_widget/secondary_text_widget.dart';

class TaskDetails extends StatefulWidget {
  static const String route_name = 'details';
  @override
  State<TaskDetails> createState() => _TaskDetailsState();
}

class _TaskDetailsState extends State<TaskDetails> {
  @override
  Widget build(BuildContext context) {
    var args = ModalRoute.of(context)!.settings.arguments as Information;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Container(
            margin: const EdgeInsets.only(right: 50),
            decoration: const BoxDecoration(
              // color: Colors.blueAccent,
              // gradient:    LinearGradient(colors: [Colors.green,Colors.black],
              //   stops: [0,0.9]
              // ) ,
              color: Colors.deepOrange,
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(50),
                bottomRight: Radius.circular(50),
              ),
            ),
            height: MediaQuery.of(context).size.height * .16,
            child: const Center(
                child: Text(
              'Task Details',
              style: TextStyle(
                  fontWeight: FontWeight.bold, letterSpacing: 2, fontSize: 25),
            ))),
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back_ios_rounded,
            size: 25,
            color: Colors.black,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        toolbarHeight: MediaQuery.of(context).size.height * .16,
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              HeaderWidget(text: 'what is to be done?'),
              const SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  SecondaryTextWidget(text: args.title),
                  IconWidget(icon: const Icon(Icons.title)),
                ],
              ),
              ContainerDivider(args.id),
              const SizedBox(
                height: 10,
              ),
              Center(
                  child: Container(
                      padding: const EdgeInsets.all(5),
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.grey),
                          borderRadius: BorderRadius.circular(10)),
                      child: HeaderWidget(text: 'Due Date'))),
              const SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  SecondaryTextWidget(text: args.date),
                  const SizedBox(
                    height: 5,
                  ),
                  IconWidget(icon: const Icon(Icons.date_range_sharp)),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  SecondaryTextWidget(text: args.time),
                  const SizedBox(
                    height: 5,
                  ),
                  IconWidget(icon: const Icon(Icons.timer)),
                ],
              ),
              ContainerDivider(args.id),
              const SizedBox(
                height: 10,
              ),
              Center(
                  child: Container(
                      padding: const EdgeInsets.all(5),
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.grey),
                          borderRadius: BorderRadius.circular(10)),
                      child: HeaderWidget(text: 'Description'))),
              Padding(
                padding: const EdgeInsets.only(top: 5),
                child:
                    Center(child: SecondaryTextWidget(text: args.description)),
              ),
              Provider.of<ProviderClass>(context, listen: false).index == 1
                  ? Container(
                      width: double.infinity,
                      margin: const EdgeInsets.symmetric(
                          horizontal: 30, vertical: 10),
                      padding: const EdgeInsets.all(20),
                      decoration: BoxDecoration(
                          // gradient: const LinearGradient(
                          //   colors: [Colors.green , Colors.black]
                          // ),
                          color: Colors.deepOrange,
                          borderRadius: BorderRadius.circular(20)),
                      child: const Center(
                        child: Text(
                          'Done!',
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 20),
                        ),
                      ),
                    )
                  : Column(
                      children: [
                        const SizedBox(
                          height: 20,
                        ),
                        Container(
                          width: double.infinity,
                          margin: const EdgeInsets.symmetric(
                              horizontal: 30, vertical: 10),
                          padding: const EdgeInsets.all(20),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              border: Provider.of<ProviderClass>(context)
                                          .numberOfSlider !=
                                      100
                                  ? Border.all(color: Colors.grey)
                                  : Border.all(color: Colors.green)),
                          child: Center(
                              child: args.id == 1
                                  ? const Text(
                                      'Done!',
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 20),
                                    )
                                  : Column(
                                      children: [
                                        Text(
                                          '${double.parse(args.sliderValue).round()} %',
                                          style: const TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 18),
                                        ),
                                        Slider(
                                          activeColor: args.sliderValue ==
                                                  '25.0'
                                              ? Colors.grey
                                              : args.sliderValue ==
                                        '50.0'
                                                  ? Colors.green
                                                      .withOpacity(0.4)
                                                  : args.sliderValue ==
                                              '75.0'
                                                      ? Colors.green
                                                          .withOpacity(0.6)
                                                      : args.sliderValue ==
                                              '100.0'
                                                          ? Colors.green
                                                          : Colors.grey,
                                          divisions: 4,
                                          value: double.parse(args.sliderValue),
                                          onChanged: (value) {

                                            Provider.of<ProviderClass>(context,
                                                listen: false).updateSliderData(
                                                id: args.id, sliderValue: value.toString()) ;

                                            args.sliderValue= value.toString();

                                            setState(() {});
                                          },
                                          min: 0,
                                          max: 100,
                                        ),
                                        Text(
                                          args.sliderValue ==
                                              '25.0'
                                              ? 'Keep On'
                                              : args.sliderValue ==
                                              '50.0'
                                                  ? 'Keep On'
                                                  : args.sliderValue ==
                                              '75.0'
                                                      ? 'Keep On ❤ '
                                                      : args.sliderValue ==
                                              '100.0'
                                                          ? 'Congratulations 🎉 '
                                                          : ' 😔 ',
                                          style: TextStyle(
                                              fontSize: 15,
                                              fontWeight: FontWeight.bold,
                                              color: Provider.of<ProviderClass>(
                                                              context)
                                                          .numberOfSlider ==
                                                      100
                                                  ? Colors.green
                                                  : Provider.of<ProviderClass>(
                                                                  context)
                                                              .numberOfSlider ==
                                                          25
                                                      ? Colors.grey
                                                      : Colors.black),
                                        ),
                                      ],
                                    )),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                      ],
                    )
            ],
          ),
        ),
      ),
    );
  }
}
