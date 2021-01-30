

import 'package:BulkSender/models/to_whatsapp.dart';
import 'package:BulkSender/widgets/drawer_nav.dart';
import 'package:BulkSender/widgets/load_contacts.dart';
import 'package:flutter/material.dart';
import 'package:toast/toast.dart';

class HomePage extends StatefulWidget {
  final title;
  

  const HomePage({
    Key key,
    this.title,
  }) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String messageType = "single";
  
  var messageController = TextEditingController();
  var numberController = TextEditingController();
  var whatsappController = WhatsApp(
              message: "");



  
  @override
  Widget build(BuildContext context) {
    

    return Scaffold(
      appBar: AppBar(
        title: Text(this.widget.title),
      ),
      drawer:  ScreenDrawerNav(),
      body: ListView(
        children: [
          Container(
            margin: EdgeInsets.only(left: 15.0, right: 15.0, top: 20.0),
            child: Column(        
                     mainAxisSize: MainAxisSize.min,
                     
                      children: <Widget>[

                        Text(
                          "WhatsApp Bulk Message Sender",
                          style: TextStyle(
                            fontSize: 18.0,
                            fontWeight: FontWeight.bold
                          ),
                        ),
                        SizedBox(height: 20.0,),
                    
                        TextFormField(
                              controller: messageController,
                              maxLines: 10,
                              decoration: InputDecoration(
                                hintText: "Enter message",
                                labelText: "Message",
                                border: OutlineInputBorder(),
                             
                              ),
                          ),
                        Row(
                          children: <Widget>[
                            Text("Type: "),
                            Radio(
                              value: "single", 
                              groupValue: this.messageType, 
                              onChanged: (String val){


                                setState(() => {
                                  this.messageType = val
                                });

                            }),
                            Text("Single"),
                            Radio(
                              value: "bulk", 
                              groupValue: this.messageType, 
                              onChanged: (String val){
                                setState(() => {
                                  this.messageType = val
                                });

                            }),
                            Text("Bulk")
                           
                          ],),
                          this.messageType == "single" ?
                          Flexible(
                                              child: TextFormField(
                                controller: numberController,
                                keyboardType: TextInputType.phone,
                                decoration: InputDecoration(
                                  
                                  hintText: "Enter phone e.g 263771721721",
                                  labelText: "Phone",
                                  border: OutlineInputBorder(),
                                  icon: Icon(Icons.phone),
                                ),
                            ),
                          ):
                          LoadContactsWidget(whatsappController: whatsappController),
                          SizedBox(
                            width: double.infinity,
                            child: Container(
                              margin: EdgeInsets.only(top: 30.0),
                              child: RaisedButton.icon(
                                color: Colors.green[400],
                                padding: EdgeInsets.only(top: 10.0, bottom: 10.0),
                                onPressed: () async {
                                  this.whatsappController.txtMessage = messageController.text;
                                  String phone = numberController.text;
                                  String status = "";

                                  if (this.messageType == "single"){
                                      status = await this.whatsappController.sendToWhatsapp(phone);
                                  }else if (this.messageType == "bulk"){
                                      status = await this.whatsappController.sendToBulk();
                                  }

                                  Toast.show(status, context, duration: Toast.LENGTH_LONG, gravity:  Toast.BOTTOM);
    
                                },
                                icon: Icon(Icons.outgoing_mail), 
                                label: Text("Send"),),
                            )
                          )
                       
                       
                      ],
                    ),
                  ),
        ],
      ),

         
      );
  }
}

