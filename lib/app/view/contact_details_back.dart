
import 'package:agenda_crud/app/domain/entities/contact.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class ContactDetailsBack{
  BuildContext context;
  Contact? contact;

  ContactDetailsBack(this.context){
    var parameter = ModalRoute.of(context)?.settings.arguments;
    contact = ((parameter == null)? Contact(): parameter) as Contact?;
  }

  goToback(){
    Navigator.of(context).pop();
  }

_launchApp(String url, Function(BuildContext context) showModalError) async {   
  // ignore: deprecated_member_use
  await canLaunch(url) ? await launch(url): showModalError;  
  }

  launchPhone(Function(BuildContext context) showModalError){
    _launchApp('tel:${contact?.telefone}', showModalError);
  }

  launchSMS(Function(BuildContext context) showModalError){
    _launchApp('sms:${contact?.telefone}', showModalError);
  }

  launchEmail(Function(BuildContext context) showModalError){
    _launchApp('mailto:${contact?.email}', showModalError);
  }
}