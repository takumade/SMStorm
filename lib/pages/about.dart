import 'package:BulkSender/widgets/drawer_nav.dart';
import 'package:flutter/material.dart';

class AboutPage extends StatelessWidget {
  final title;

  const AboutPage({
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
      body: Container(
        margin: EdgeInsets.only(left: 15.0, right: 15.0, top: 20.0),
        child: ListView(
          children: [
            Text(
                          "About App Name!",
                          style: TextStyle(
                            fontSize: 18.0,
                            fontWeight: FontWeight.bold
                          ),
                        ),
            SizedBox(height: 15.0,),
            Text("Is a bulk message sender for whatsapp and sms. As of now you can send to one contact or many(using csv file)"),
             SizedBox(height: 15.0,),
            Text(
                          "About Developer!",
                          style: TextStyle(
                            fontSize: 18.0,
                            fontWeight: FontWeight.bold
                          ),
                        ),
               SizedBox(height: 15.0,),

               Text("COming Soon!"),            
            SizedBox(
              width: double.infinity,
              child: RaisedButton.icon(
                onPressed: () async {
                  Navigator.pushNamed(context, '/contact');
                },
                icon:Icon(Icons.outgoing_mail),
                label: Text("Contact Us"),)

            )
          ],
        )
      )
         
      );
  }
}

