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
  static const String main='/main';
  static const String webView='/webView';
  // static const String form='/form';
  // static const String users='/users';
  // static const String settings='/settings';
  // static const String infoProfile='/infoProfile';
  // static const String availableSurveys='/availableSurveys';
  // static const String completedSurveys='/completedSurveys';
  static myRoutes(){
    return {
      login:(context)=>LoginForm(),
      main:(_)=>MainScreen(),
      // dashboard:(_)=>DashboardScreen(),
      // form:(_)=>FormScreen(),
      // users:(_)=>UsersScreen(),
      // infoProfile:(_)=>InfoProfileScreen(),
      // availableSurveys:(_)=>AvailableformsScreen(),
      // completedSurveys:(_)=>FilledformsScreen(),
      // webView:(_)=>WebviewScreen(),
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