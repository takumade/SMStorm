import 'package:BulkSender/widgets/drawer_nav.dart';
import 'package:flutter/material.dart';

class SMSPage extends StatelessWidget {
  final title;

  const SMSPage({
    Key key,
    this.title,
  }) : super(key: key);

  
  @override
  Widget build(BuildContext context) {
    

    return Scaffold(
      appBar: AppBar(
        title: Text(this.title),
      ),
      drawer:  ScreenDrawerNav(),
      body: Center(
        child: Text("Coming Soon!")
      )
         
      );
  }
}

