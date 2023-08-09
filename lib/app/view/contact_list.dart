import 'package:agenda_crud/app/domain/entities/contact.dart';
import 'package:agenda_crud/app/domain/services/contact_service.dart';
import 'package:agenda_crud/app/my_app.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:mobx/mobx.dart';

part 'contact_list.g.dart';

// ignore: library_private_types_in_public_api
class ContactL = _ContactL with _$ContactL;

abstract class _ContactL with Store{
  final _service = GetIt.I.get<ContactService>();

  //Lista de contatos
  @observable
  Future<List<Contact>>? list;
  //metodo para atualizar a lista de contatos
  @action
  refreshList([dynamic value]){
    list = _service.find();
  }

  _ContactL(){
    refreshList();   
  }
  //metodo para chamar o form salvar/alterar
  goToForm(BuildContext context, [Contact? contact]){
    Navigator.of(context).pushNamed(MyApp.CONTACT_FORM, arguments: contact).then(refreshList);
  }

  gotToDetails(BuildContext context){
    Navigator.of(context).pushNamed(MyApp.CONTACT_DETAILS);
  }

  //excluir
  remove(int id){
    _service.remove(id);
    refreshList();
  }

}