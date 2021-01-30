
import 'package:BulkSender/pages/about.dart';
import 'package:BulkSender/pages/contact.dart';
import 'package:BulkSender/pages/home.dart';
import 'package:BulkSender/pages/sms.dart';
import 'package:flutter/material.dart';
void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Bulky',
      initialRoute: "/",
      routes: {
        "/": (context) => HomePage(title: 'Bulk Whatsapp Sender'),
        "/sms": (context) => SMSPage(title: "Bulk SMS Sender"),
        "/about": (context) => AboutPage(title: "About Us"),
        "/contact": (context) => ContactPage(title: "Contact Us"),
      },
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
    );
  }
}



