import 'package:agenda_crud/app/view/contact_form.dart';
import 'package:flutter/material.dart';

import 'view/constact_list.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  static const HOME = '/';
  static const CONTACT_FORM = 'contact-form';

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(        
        primarySwatch: Colors.blue,
        //useMaterial3: true,
      ),
      routes:{
        HOME : (context) => ContactList(),
        CONTACT_FORM: (context) => ContactForm(),
      }
    );
  }
}
