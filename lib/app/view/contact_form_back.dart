import 'package:agenda_crud/app/domain/entities/contact.dart';
import 'package:agenda_crud/app/domain/services/contact_service.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';


 class ContactFormBack {
  Contact? contact;
  final _service = GetIt.I.get<ContactService>();
  bool? _nameIsValid;
  bool? _emailIsValid;
  bool? _phnoIsValid;

  bool get isValid => _nameIsValid! && _emailIsValid! && _phnoIsValid!;

  //Diferenciar o novo com a alteração
  ContactFormBack(BuildContext context){
    var parameter = ModalRoute.of(context)?.settings.arguments;
    contact = ((parameter == null)? Contact(): parameter) as Contact?;
  }
  //Salvar
  save() async{
    await _service.save(contact!);
  }
  //Validações
  String? validateName(String? name){
    try {
      _service.validateName(name!);
      _nameIsValid = true;
      return ''; 
    } catch (e) {
      _nameIsValid = false;
      return e.toString();
    }
  }
  ///Email
  String? validateEmail(String? email){
    try {
      _service.validateEmail(email!);
      _emailIsValid = true;
      return ''; 
    } catch (e) {
      _emailIsValid = false;
      return e.toString();
    }
  }
  //Phone
  String? validatePhone(String? phone){
    try {
      _service.validatePhone(phone!);
      _phnoIsValid = true;
      return ''; 
    } catch (e) {
      _phnoIsValid = false;
      return e.toString();
    }
  }

}