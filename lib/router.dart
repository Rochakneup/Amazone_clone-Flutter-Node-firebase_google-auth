import 'package:amazon_clone/features/auth/auth_screen.dart';
import 'package:flutter/material.dart';

import 'features/auth/home.dart';
Route<dynamic>generateRoute(RouteSettings routeSettings)
{
  switch(routeSettings.name){
    case AuthScreen.routename:
      return MaterialPageRoute(builder: (_)=>AuthScreen(),);
    case '/home':
      return MaterialPageRoute(builder: (_) => Home());
    default:
  return MaterialPageRoute(builder: (_)=>Scaffold(
    body: Center(
      child: Text("Screen does not exists"),
    ),
  ),);

  }
}