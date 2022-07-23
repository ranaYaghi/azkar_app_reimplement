import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class LaunchScreen extends StatefulWidget {
  const LaunchScreen({Key? key}) : super(key: key);

  @override
  State<LaunchScreen> createState() => _LaunchScreenState();
}

class _LaunchScreenState extends State<LaunchScreen> {
  void initState() {
    
    super.initState();
    print('init State');
    //TODO: Navigate to HomeScreen after 3 sec
    // 3 تواني   حدث مستقبلي بعد تأخير مدته

      Future.delayed( const Duration(seconds: 3) , (){
         print('3 sec finished');
         //Navigator.pushNamed(context, '/home_screen');
         //*****************************
         //ِA =>B=> C=> D
         //I'm in B
         //pop for B
         //تظهر A سريعا
         //Push for C
         //Navigator.popAndPushNamed(context, '/home_screen');
        //******************************
        Navigator.pushReplacementNamed(context,  '/home_screen');
       // Navigator.pushNamedAndRemoveUntil(context, newRouteName, (route) => false)
      });
  }

  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    print('build');
    return Scaffold(
      body: Container(
        alignment: Alignment.center,
        decoration: const BoxDecoration(
            gradient: LinearGradient(
                begin: AlignmentDirectional.topCenter,
                end: AlignmentDirectional.bottomCenter,
                colors: [Color(0xFF94B49F), Color(0xFFCEE5D0),Color(0xFFFCF8E8) , Color(0xFFECB390)])),
        child: Text(
          ' تطبيق المسبحة',
          style: GoogleFonts.arefRuqaa(fontSize: 30  , color: Colors.white, fontWeight:  FontWeight.bold ),
        ),
      ),
    );
  }
}
