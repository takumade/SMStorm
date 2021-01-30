


import 'dart:convert';
import 'dart:io';

import 'package:csv/csv.dart';
import 'package:file_picker/file_picker.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:whatsapp_unilink/whatsapp_unilink.dart';

class WhatsApp {

  String message;
  String csvFileFormat = "";
  List<dynamic> numbers = [];

  WhatsApp({
    this.message,
  });

  set txtMessage(String message){
    this.message = message;
  }

  set fileFormat(String format){
    this.csvFileFormat = format;
  }

  sendToWhatsapp(String phone) async {
    final link = WhatsAppUnilink(
      phoneNumber: phone,
      text: this.message,
    );

    await launch('$link'); 
  }

  Future<String> sendToBulk() async {

        String status = "";

       if (this.numbers.isEmpty){
          status = "Please select contacts";
          return status;
       }
    
        if (this.csvFileFormat == "Going Down"){
            for (var number in this.numbers){
              print(number[0]);
                // this.sendToWhatsapp(number[0]);
            }
        }else if (this.csvFileFormat ==  "Going Left"){
            for (var number in this.numbers[0]){
                 print(number);
                // this.sendToWhatsapp(number);
            }
        }

        status = "Complete";
        return status;
  }

  Future<bool> loadFile() async {
      FilePickerResult result = await FilePicker.platform.pickFiles(
              type: FileType.custom,
              allowedExtensions: ['csv'],
            );
      if (result != null) {
        PlatformFile file = result.files.first;

        final input = File(file.path).openRead();
        final fields = await input
            .transform(utf8.decoder)
            .transform(new CsvToListConverter())
            .toList();

        this.numbers = fields;

        return true;

   }else{
     return false;
   }
 }
}
