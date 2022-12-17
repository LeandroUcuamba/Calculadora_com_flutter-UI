import 'package:flutter_application_3/home_page.dart';
import 'package:flutter/material.dart';

void main(){
  runApp(MyWidget());
}

class MyWidget extends StatelessWidget {
  const MyWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
     return(
       MaterialApp(
          home:HomePage()
       )
     );
  }
}