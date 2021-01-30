import 'package:BulkSender/models/to_whatsapp.dart';
import 'package:BulkSender/widgets/drawer_nav.dart';
import 'package:flutter/material.dart';
import 'package:toast/toast.dart';

class ContactPage extends StatefulWidget {
  final title;
  


  const ContactPage({
    Key key,
    this.title,
  }) : super(key: key);

  @override
  _ContactPageState createState() => _ContactPageState();
}

class _ContactPageState extends State<ContactPage> {
  var whatsappController = WhatsApp(
              message: "");
  final nameTxtController = TextEditingController();
  final topicTxtController = TextEditingController();
  final messageTxtController = TextEditingController();


  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text(this.widget.title),
      ),
      drawer:  ScreenDrawerNav(),
      body: Container(
        margin: EdgeInsets.only(left: 15.0, right: 15.0, top: 20.0),
        child: ListView(
          children: [
            Text(
                          "Send Us a Message!",
                          style: TextStyle(
                            fontSize: 18.0,
                            fontWeight: FontWeight.bold
                          ),
                        ),
            SizedBox(height: 15.0,),
            TextFormField(
              controller: nameTxtController,
              decoration: InputDecoration(
                hintText: "Full Name",
                icon: Icon(Icons.person),
                labelText: "Full Name",
                border: OutlineInputBorder()
              )

            ),
            SizedBox(height: 15.0,),
            TextFormField(
              controller: topicTxtController,
              decoration: InputDecoration(
                hintText: "Enter Subject Here",
                icon: Icon(Icons.topic),
                labelText: "Subject",
                border: OutlineInputBorder()
              )

            ),
            SizedBox(height: 15.0,),
            TextFormField(
              controller: messageTxtController,
              maxLines: 10,
              decoration: InputDecoration(
                
                hintText: "Enter Message Here",
                icon: Icon(Icons.message),
                labelText: "Message",
                border: OutlineInputBorder()
              )

            ),
            SizedBox(height: 15.0,),
            SizedBox(
              width: double.infinity,
              child: RaisedButton.icon(
                onPressed: () async {
                  final name = this.nameTxtController.text;
                  final topic = this.topicTxtController.text;
                  final message = this.messageTxtController.text;

                  final text ="$name\n\n*$topic*\n\n$message";
                  this.whatsappController.txtMessage = text;
                  await this.whatsappController.sendToWhatsapp("263778548832");

                   Toast.show("Message Sent!", context, duration: Toast.LENGTH_LONG, gravity:  Toast.BOTTOM);


                },
                icon:Icon(Icons.outgoing_mail),
                label: Text("Send"),)

            )
          ],
        )
      )
         
      );
  }
}

