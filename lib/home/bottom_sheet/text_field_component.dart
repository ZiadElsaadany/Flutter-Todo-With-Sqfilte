import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TextFieldWidget extends StatefulWidget {
 TextEditingController controller ;
 String textLabel ;
 String errorText;
 Icon icon ;
 Function()  ontab;
 int index;
 TextFieldWidget({
   required this.controller,
   required this.icon,
   required this.textLabel,
   required this.errorText,
   required this.ontab,
   required this.index
});

  @override
  State<TextFieldWidget> createState() => _TextFieldWidgetState();
}

class _TextFieldWidgetState extends State<TextFieldWidget> {
  @override
  Widget build(BuildContext context) {
    return    TextFormField(
      maxLines: widget.index==3?3:widget.index==0?1:1,
      controller: widget.controller,
      decoration:  InputDecoration(
          focusedBorder:  OutlineInputBorder(
            borderRadius: BorderRadius.circular(20),
            borderSide: const BorderSide(color: Colors.red, width: 2.0),
          ),
          label:  Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(widget.textLabel,style: const TextStyle(
                fontSize: 20,
                letterSpacing: 2
            ),),
          ),
          labelStyle: const TextStyle(color: Colors.black),
          prefixIcon: Icon( widget.icon.icon,color: Colors.deepOrange,size: widget.index==3?38:25,),
          border: OutlineInputBorder(
              borderSide: const BorderSide(
                  color: Colors.red,
                  width: 7.0),
              borderRadius: BorderRadius.circular(10)
          )
      ),
      onFieldSubmitted: (text){
        widget.controller.text = text ;
        setState(() { });
      } ,
      readOnly: widget.index==1||widget.index==2?true:false,
      validator: (text) {
        if(text == null || text.isEmpty)  {
          return widget.errorText;
        }
      },
      onTap: (){
     if(widget.index==1){
       showTimePicker(

         builder: (context, child) {
           return Theme(
               data: Theme.of(context).copyWith(
             colorScheme: const ColorScheme.light(
               primary: Colors.deepOrange, // <-- SEE HERE
               onPrimary: Colors.white, // <-- SEE HERE
               onSurface: Colors.black, // <-- SEE HERE
             ),
             textButtonTheme: TextButtonThemeData(
               style: TextButton.styleFrom(
                 primary: Colors.deepOrange, // button text color
               ),
             ),
           ), child: child!,);
         },
           context: context, initialTime: TimeOfDay.now()).then((value) {
         widget.controller.text = value!.format(context).toString();

           } ,
       );
       setState(() {

       });
     }else if(widget.index==2){
       showDatePicker(
           builder: (context, child) {
             return Theme(
               data: Theme.of(context).copyWith(
                 colorScheme: const ColorScheme.light(
                   primary: Colors.deepOrange, // <-- SEE HERE
                   onPrimary: Colors.white, // <-- SEE HERE
                   onSurface: Colors.black, // <-- SEE HERE
                 ),
                 textButtonTheme: TextButtonThemeData(
                   style: TextButton.styleFrom(
                     primary: Colors.deepOrange, // button text color
                   ),
                 ),
               ), child: child!,);
           },
         context: context,
           initialDate: DateTime.now(),
           firstDate:
           DateTime.now().subtract(const Duration(days: 365),),
           lastDate: DateTime.now().add(const Duration(days: 365)))
           .then((value) {
        widget.controller.text = '${value!.year.toString()}-${value.month.toString()}-${value.day.toString()}';
       });
       setState(() {});
     }
      },
    );
  }
}
