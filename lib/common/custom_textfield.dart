import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomtextField extends StatelessWidget{
  final TextEditingController controller ;
  final String hintText ;
  const CustomtextField({Key? key,required this.controller,required this.hintText}): super(key: key);
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      decoration: InputDecoration(
        hintText: hintText,
        border: OutlineInputBorder(
          borderSide:   BorderSide(
            color: Colors.black
          )
        ),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: Colors.black,
            )
          )
      ),
      //validator: ,
    );
  }
  
}