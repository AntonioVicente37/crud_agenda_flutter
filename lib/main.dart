import 'package:agenda_crud/app/injection.dart';
import 'package:flutter/material.dart';

import 'app/my_app.dart';

void main(){
  setupInjection();
  runApp(const MyApp());
}

