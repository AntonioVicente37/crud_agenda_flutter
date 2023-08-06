
import 'package:agenda_crud/app/database/sqlite/interfaces/contact_dao.dart';
import 'package:get_it/get_it.dart';

import 'database/sqlite/dao/contact_dao_impl.dart';

setupInjection(){
  GetIt getIt = GetIt.I;

  getIt.registerSingleton<ContactDAO>(ContactDAOImpl());
}