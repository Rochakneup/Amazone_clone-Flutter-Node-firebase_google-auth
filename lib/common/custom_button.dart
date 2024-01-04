 import 'package:amazon_clone/constants/global_variables.dart';
import 'package:flutter/material.dart';
 class Custombutton extends StatelessWidget{
   final String text ;
   final VoidCallback onTap;
   
   const Custombutton({Key? key, required this.text, required this.onTap,}): super(key: key);
   @override
   Widget build(BuildContext context) {
     return ElevatedButton(onPressed: onTap,
       child: Text(text,),
       style: ElevatedButton.styleFrom(
         minimumSize: const Size(double.infinity,50)
     ),);
   }
   }
 class Custombuttongoogle extends StatelessWidget{
   final String text ;
   final VoidCallback onTap;

   const Custombuttongoogle({Key? key, required this.text, required this.onTap,}): super(key: key);
   @override
   Widget build(BuildContext context) {
     return ElevatedButton(onPressed: onTap,
       child: Text(text, ),
       style: ElevatedButton.styleFrom(
primary: GlobalVariables.selectedNavBarColor,
           minimumSize: const Size(double.infinity,50)
       ),);
   }
 }
