import 'package:BulkSender/models/to_whatsapp.dart';
import 'package:flutter/material.dart';
import 'package:toast/toast.dart';

class LoadContactsWidget extends StatefulWidget {
  const LoadContactsWidget({
    Key key,
    @required this.whatsappController,
  }) : super(key: key);

  final WhatsApp whatsappController;

  @override
  _LoadContactsWidgetState createState() => _LoadContactsWidgetState();
}

class _LoadContactsWidgetState extends State<LoadContactsWidget> {

  var csvFormat = "";
  static const csvFormatList = <String>[
    "Going Left",
    "Going Down",
  ];

  final List<DropdownMenuItem<String>> _csvFormatDropDownItems = csvFormatList
  .map((value) =>    
            DropdownMenuItem<String>(
              child: Text(value), 
              value: value
            )
  ).toList();


  @override
  Widget build(BuildContext context) {
    return Row(
          children: [
            RaisedButton.icon(
                onPressed: () async {
                  bool status = await this.widget.whatsappController.loadFile();

                  if (status){
                    Toast.show("File Loaded", context, duration: Toast.LENGTH_LONG, gravity:  Toast.BOTTOM);
                  }else{
                    Toast.show("Error somewhere", context, duration: Toast.LENGTH_LONG, gravity:  Toast.BOTTOM);
                                      }

                }, 
                icon: Icon(Icons.file_upload), 
                label: Text("Load File('csv')"),
                ),

                Container(
                  margin: EdgeInsets.only(left: 16.0),
                  child: DropdownButton(
                    hint: Text("Select file format..."),
                    items: _csvFormatDropDownItems, 
                    onChanged: (String val){
                      this.widget.whatsappController.fileFormat = val;
                      setState(() {
                        this.csvFormat = val; 
                      });
                    }),
                )
          ],
    );
  }
}
