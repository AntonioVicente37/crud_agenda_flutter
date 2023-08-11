import 'package:agenda_crud/app/view/contact_details_back.dart';
import 'package:flutter/material.dart';
import '../domain/entities/contact.dart';

// ignore: must_be_immutable
class ContactDetails extends StatelessWidget {
  const ContactDetails({super.key}); 
  showModalError(BuildContext context){
    const alert = AlertDialog(
      title: Text('Alerta!'),
      content: Text('Não foi possivel encontrar um APP compatiível.'),
    );
    showDialog(
      context: context, 
      builder: (BuildContext context){
        return alert;
      }
    );
  }

  @override
  Widget build(BuildContext context) {
    // ignore: no_leading_underscores_for_local_identifiers
    var _back = ContactDetailsBack(context);
    Contact contact = _back.contact!;
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints){
        var width = constraints.biggest.width;
        //var height = constraints.biggest.height; 

        return Scaffold(
          body: ListView(
            padding: const EdgeInsets.all(60),
            children: [
              (Uri.tryParse(contact.urlAvatar!)!.isAbsolute)?
              CircleAvatar(
                backgroundImage: NetworkImage(contact.urlAvatar!),
                radius: width/3,
                ):
             CircleAvatar(
              radius: width/3,
              child: Icon(
                Icons.person,
                size: width /2,
              )
              ), 
              Center(
                child: Text('${contact.nome}',style: const TextStyle(fontSize: 40),),
              ),
            Card(
              child: ListTile(
                title: const Text('Telefone'),
                subtitle: Text('${contact.telefone}'),
                trailing: Container(
                  width: width/4,
                  child: Row(
                    children: [
                      IconButton(onPressed: (){
                        _back.launchSMS(showModalError);
                      },
                      color: Colors.blue, 
                      icon: const Icon(Icons.message)
                      ),
                      IconButton(
                        color: Colors.blue,
                        icon: const Icon(Icons.phone),                        
                        onPressed: () async {
                          _back.launchPhone(showModalError);                         
                        }, 
                      )
                    ],
                  ),
                ),
              ),                          
            ),
            Card(
              child: ListTile(
                title: const Text('E-mail'),
                onTap: (){
                  _back.launchEmail(showModalError);
                },
                subtitle: Text('${contact.email}'),
              ),
            )
            ],
          ),
          floatingActionButton: FloatingActionButton(           
            child: const Icon(Icons.arrow_back),
             onPressed: () {
              _back.goToback();
             },
          ),
        );
      }
    );
  }
}  