import 'package:amazon_clone/common/custom_textfield.dart';
import 'package:amazon_clone/constants/global_variables.dart';
import 'package:flutter/material.dart';

import '../../common/custom_button.dart';
import 'auth_screen.dart';


enum Auth {
  signin,
  signup,
}
class Home extends StatefulWidget{
  static const String routename = '/auth';
  const Home({Key? key}) :super(key:key);
  @override
  State<StatefulWidget> createState()=>HomeState();
}
class HomeState extends State<Home> {

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: GlobalVariables.greyBackgroundCOlor,
      body:SafeArea(
        child: Padding(
          padding: EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Home"  ,style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.w500
              ),),
Container(
  child: GestureDetector(onTap: (){
    Navigator.pushNamed(context,'/auth' );
  },child: Text("Log out")),
)
            ],
          ),
        ),
      ) ,

    );
  }
}
