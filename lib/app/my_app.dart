import 'package:agenda_crud/app/view/contact_details.dart';
import 'package:agenda_crud/app/view/contact_form.dart';
import 'package:flutter/material.dart';

import 'view/constact_list.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  // ignore: constant_identifier_names
  static const HOME = '/';
  // ignore: constant_identifier_names
  static const CONTACT_FORM = 'contact-form';  
  // ignore: constant_identifier_names
  static const CONTACT_DETAILS = 'contact-details';

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(        
        primarySwatch: Colors.blue,
        //useMaterial3: true,
      ),
      routes:{
        HOME : (context) => ContactList(),
        CONTACT_FORM: (context) => ContactForm(),
        CONTACT_DETAILS: (context) => ContactDetails(),
      }
    );
  }
}
