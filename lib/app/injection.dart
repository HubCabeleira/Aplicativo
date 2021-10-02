import 'package:agenda_crud/app/domain/interfaces/contactDao.dart';
import 'package:agenda_crud/app/database/sqlite/dao/contactImpl.dart';
import 'package:agenda_crud/app/domain/services/contactService.dart';
import 'package:get_it/get_it.dart';

setupInjections() {
  GetIt getIt = GetIt.I;
  getIt.registerSingleton<ContactDAO>(ContactImple());
  getIt.registerSingleton<ContactService>(ContactService());
}
