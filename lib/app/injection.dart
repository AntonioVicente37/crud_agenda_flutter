
import 'package:agenda_crud/app/database/sqlite/interfaces/contact_dao.dart';
import 'package:agenda_crud/app/domain/services/contact_service.dart';
import 'package:get_it/get_it.dart';

import 'database/sqlite/dao/contact_dao_impl.dart';

setupInjection(){
  GetIt getIt = GetIt.I;

  getIt.registerSingleton<ContactDAO>(ContactDAOImpl());
  getIt.registerSingleton<ContactService>(ContactService());
}