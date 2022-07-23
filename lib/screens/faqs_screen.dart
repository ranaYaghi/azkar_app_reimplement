import 'package:flutter/material.dart';

class FaqsScreen extends StatelessWidget {
   FaqsScreen({Key? key , required this.message}) : super(key: key);
String message = 'No Message';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('FAQS'),
        centerTitle: true,
      ),
      body: Center(
        child: Text(message),

      ),
    );
  }
}
