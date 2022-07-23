import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class InfoScreen extends StatelessWidget {
   InfoScreen({Key? key}) : super(key: key);

  String _message ='No Message';
  @override
  Widget build(BuildContext context) {
    //instance to get done current route porperties
    //خصائص الانتقال الي وصلتتني لهاد الويدجت
   ModalRoute? modalRoute = ModalRoute.of(context);
   if(modalRoute != null && modalRoute.settings.arguments!= null){
     //casting on null error
     print(modalRoute.settings.arguments);

     // عشان ما اعمل كاستنغ لاشي مش subtype of map
     //  لما تكون argumnets موجودة بس فاضية  بتكون نوعها مش  subtype of map

 if(modalRoute.settings.arguments is Map<String, dynamic>){
   Map<String ,dynamic >  map = modalRoute.settings.arguments as Map<String , dynamic>;
   if(map.containsKey('message')){

     _message = map['message'];
   }
 }

   }
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('عن التطبيق'),
        leading: IconButton(
          onPressed: () =>Navigator.pop(context),
          icon: Icon(Icons.arrow_back_ios),
        ),
      ),

      body: Center(
        child: Text(_message , style: GoogleFonts.nunito()),
      ),
    );
  }
}
