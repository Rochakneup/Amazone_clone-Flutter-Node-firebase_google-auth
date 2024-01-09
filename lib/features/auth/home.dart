import 'package:amazon_clone/common/custom_textfield.dart';
import 'package:amazon_clone/constants/global_variables.dart';
import 'package:flutter/material.dart';

import '../../common/custom_button.dart';


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
  Auth _auth = Auth.signup;
  final _signUpFormkey = GlobalKey<FormState>();
  final _signInFormkey = GlobalKey<FormState>();
  final TextEditingController _emailcontroller = TextEditingController();
  final TextEditingController _passwordcontroller = TextEditingController();
  final TextEditingController _namecontroller = TextEditingController();
  @override
  void dispose() {
    _emailcontroller.dispose();
    _passwordcontroller.dispose();
    _namecontroller.dispose();

  }
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
              ListTile(
                tileColor: _auth == Auth.signup ? GlobalVariables.backgroundColor:GlobalVariables.greyBackgroundCOlor,
                title: Text("Create Account", style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),),
                leading: Radio(
                    activeColor: GlobalVariables.secondaryColor,
                    value: Auth.signup ,
                    groupValue:_auth,
                    onChanged: (Auth? val){
                      setState(() {
                        _auth = val!;
                      });

                    }
                ),
              ),
              if(_auth == Auth.signup)
                Container(
                  padding: EdgeInsets.all(8),
                  color: GlobalVariables.backgroundColor,
                  child: Form(
                    key: _signUpFormkey,
                    child: Column(
                      children: [
                        CustomtextField(controller: _emailcontroller, hintText: 'Email',),
                        SizedBox(height: 10,),
                        CustomtextField(controller: _passwordcontroller, hintText: 'Password',),
                        SizedBox(height: 10,),
                        CustomtextField(controller: _namecontroller, hintText: 'name',),
                        SizedBox(height: 10,),
                        Custombutton(
                          text: 'Sign Up',
                          onTap: (){

                          },
                        ),


                      ],


                    ),
                  ),

                ),


              ListTile(
                tileColor: _auth == Auth.signin ? GlobalVariables.backgroundColor:GlobalVariables.greyBackgroundCOlor,
                title: Text("Sign-in.", style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),),
                leading: Radio(
                    activeColor: GlobalVariables.secondaryColor,
                    value: Auth.signin ,
                    groupValue:_auth,
                    onChanged: (Auth? val){
                      setState(() {
                        _auth = val!;
                      });

                    }
                ),
              ),
              if(_auth == Auth.signin)
                Container(
                  padding: EdgeInsets.all(8),
                  color: GlobalVariables.backgroundColor,
                  child: Form(
                    key: _signUpFormkey,
                    child: Column(
                      children: [
                        CustomtextField(controller: _emailcontroller, hintText: 'Email',),
                        SizedBox(height: 10,),
                        CustomtextField(controller: _passwordcontroller, hintText: 'Password',),
                        SizedBox(height: 10,),

                        Custombutton(
                          text: 'Sign in',
                          onTap: (){

                          },
                        )
                      ],

                    ),

                  ),
                ),
              Padding(
                padding: const EdgeInsets.only( top: 20),
                child: Container(
                  child: Custombuttongoogle(
                    text: 'Sign in With Google',

                    onTap: (){

                    },
                  ),
                ),
              )
            ],
          ),
        ),
      ) ,

    );
  }
}
