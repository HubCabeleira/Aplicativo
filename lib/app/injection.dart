import 'package:agenda_crud/app/database/firestore/contact_dao_firestore.dart';
import 'package:agenda_crud/app/domain/services/contactService.dart';
import 'package:agenda_crud/app/database/sqlite/dao/contactImpl.dart';
import 'package:agenda_crud/app/domain/interfaces/contactDao.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

setupInjections() async {
  GetIt getIt = GetIt.I;

  //WidgetsFlutterBinding.ensureInitialized();
  //await Firebase.initializeApp();

  getIt.registerSingleton<ContactDAO>(ContactImple());
  //getIt.registerSingleton<ContactDAO>(ContactDAOFirestoreContactDAOFirestore());
  getIt.registerSingleton<ContactService>(ContactService());
}
