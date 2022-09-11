class Information {
  String title;
  String  time;
  String date ;
  String description ;
  int id  ;
  String sliderValue ;
  Information(

  {
    required this.time ,
    required this.title,
    required this.date,
    required this.description,
    this.id=0,
    this.sliderValue = '0'
}

      );
}