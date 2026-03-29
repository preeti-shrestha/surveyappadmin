import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:surveyadmin/pages/dashboard/dashboard_screen.dart';
import 'package:surveyadmin/pages/forms/viewform_screen.dart';
import 'package:surveyadmin/pages/main_screen.dart';
import 'package:surveyadmin/pages/users/activeusers_screen.dart';

import '../pages/userlogin/login_screen.dart';
import '../pages/webview/webview_screen.dart';
class RouteHelper{
  static String login='/';
  static const String main='/dashboard';
  static const String webView='/webView';
  static myRoutes(){
    return {
      login:(context)=>LoginForm(),
      main:(_)=>MainScreen(),
    };
  }
  static myGenerateRoutes(RouteSettings settings){
    switch(settings.name){
      case webView:{
        String link=settings.arguments as String;
        return MaterialPageRoute(
            builder: (context)=>WebviewScreen(
              link:link
            )
        );
      }
    }
  }
}
