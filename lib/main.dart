import 'package:azkar_app_reimplement/screens/home_screen.dart';
import 'package:azkar_app_reimplement/screens/info_screen.dart';
import 'package:azkar_app_reimplement/screens/launch_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {

    return MaterialApp(
    debugShowCheckedModeBanner: false,
      localizationsDelegates: const [
        //
        // delegate => const static variable refer to private class that conatins some properities
        //delegate=> instance from private class
        //التحكم باتجاه النصوص
        GlobalWidgetsLocalizations.delegate,
        //إدارة المحتوى النصي الخاص ب Material Widgets
        GlobalMaterialLocalizations.delegate,
        //إدارة المحتوى النصي الخاص ب Cupertino Widgets
        GlobalCupertinoLocalizations.delegate
      ],
      //supported languages
      supportedLocales: const[
        Locale('ar'),
        Locale('en')
      ] ,
      //current language
      //if the chosen lang is not within supportedLocales then the first one in the list will be the language
      locale:const Locale('ar') ,
      title: 'Flutter Demo',

      initialRoute: '/launch_screen',
      routes:{

       '/launch_screen':(context) => const LaunchScreen(),
        '/home_screen' :(context) => const HomeScreen(),
        '/info_screen' : (context) =>  InfoScreen()
      } ,
    );
  }
}
