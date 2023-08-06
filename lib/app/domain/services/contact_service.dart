import 'package:agenda_crud/app/domain/exception/domain_layer_exception.dart';
import 'package:get_it/get_it.dart';

import '../../database/sqlite/interfaces/contact_dao.dart';
import '../entities/contact.dart';

class ContactService{
  var _dao = GetIt.I.get<ContactDAO>();
  save(Contact contact){
    validateName(contact.nome!);
    validateEmail(contact.email!);
    _dao.save(contact);
  }

  remove(int id){
    _dao.remove(id);
  }

  Future<List<Contact>> find(){
    return _dao.find();
  }

  //Validar Nome
  validateName(String name){
    var min = 3;
    var max = 50;

    if(name == null){
      throw DomainLayerException('O nome é obrigatorio');
    }else if(name.length < min){
      throw DomainLayerException('O nome deve possuir pelo menos $min caracteres');
    }else if(name.length > max){
      throw DomainLayerException('O nome deve possuir no maximo $max caracteres');
    }
  }
  //Validar Email
  validateEmail(String email){
    if(email == null){
      throw DomainLayerException('O e-mail é obrigatorio');
    }else if(!email.contains('@')){
      throw DomainLayerException('O e-mail tem que conter o @');
    }
  }
  //Validar Telefone
  validatePhone(String phone){
    //var format = RegExp();
   /*  if(phone == null){
      throw DomainLayerException('O telefone é obrigatorio');
    }else if(!format.hashCode(phone)){
      throw DomainLayerException('Formato invalido. O formato deve ser');
    } */
  }
}