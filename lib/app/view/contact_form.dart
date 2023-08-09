import 'package:agenda_crud/app/view/contact_form_back.dart';
import 'package:flutter/material.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

class ContactForm extends StatelessWidget {
  ContactForm({super.key});
  final _form = GlobalKey<FormState>();

  Widget fieldName(ContactFormBack back){
    return TextFormField(
      validator: back.validateName,
      onSaved: (newValue) => back.contact!.nome = newValue,
      initialValue: back.contact!.nome,
      decoration: const InputDecoration(
        labelText: 'Nome'
      ),
    );
  }

  Widget fieldEmail(ContactFormBack back){
    return TextFormField(
      validator: back.validateEmail,
      onSaved: (newValue) => back.contact!.email = newValue,
      initialValue: back.contact!.email,
      keyboardType: TextInputType.emailAddress,
      decoration:const InputDecoration(
        labelText: 'E-mail'
      ),
    );
  }

   Widget fieldPhone(ContactFormBack back){
    var mask = MaskTextInputFormatter(mask: '(+224) ###-###-###');
    return TextFormField(
      validator: back.validatePhone,
      onSaved: (newValue) => back.contact!.telefone = newValue,
      initialValue: back.contact!.telefone,
      inputFormatters: [mask],
      keyboardType: TextInputType.number,
      decoration: const InputDecoration(
        labelText: 'Telefone',
        hintText: '(+244) 999-999-999'
      ),
    );
  }

  Widget fieldUrlImage(ContactFormBack back){
    return TextFormField(
      onSaved: (newValue) => back.contact!.urlAvatar = newValue,
      initialValue: back.contact!.urlAvatar,
      decoration: const InputDecoration(
        labelText: 'Endereco Foto',
        hintText: 'http://wwww.site.com'
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    // ignore: no_leading_underscores_for_local_identifiers
    var _back = ContactFormBack(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cadastro de cadastro'),
        actions: [
          IconButton(
            icon: const Icon(Icons.save) ,          
            onPressed: (){
              _form.currentState!.validate();
              _form.currentState!.save();
              if(_back.isValid){
                _back.save();
                Navigator.of(context).pop();
              }
            }
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: Form(
          key: _form,
          child: Column(
            children: [
              fieldName(_back),
              fieldEmail(_back),
              fieldPhone(_back),
              fieldUrlImage(_back),
            ],
          ),
        ),
      ),
    );
  }
}