import 'package:agenda_crud/app/injection.dart';
import 'package:flutter/material.dart';
import 'app/myApp.dart';

void main() {
  setupInjections();
  runApp(MyApp());
}
