import 'package:agenda_crud/app/domain/entities/contact.dart';
import 'package:agenda_crud/app/my_app.dart';
import 'package:flutter/material.dart';

import '../database/sqlite/dao/contact_dao_impl.dart';

class ContactList extends StatelessWidget {
  const ContactList({super.key});
  /* final lista = [
    {'nome':'Carlos','telefone':'(+244) 963 223 233','avatar':'https://cdn.pixabay.com/photo/2013/07/13/10/07/man-156584_1280.png'},
    {'nome':'Maria','telefone':'(+244) 982 234 245','avatar':'https://cdn.pixabay.com/photo/2017/03/01/22/18/avatar-2109804_1280.png'},
    {'nome':'Filomena','telefone':'(+244) 913 456 231', 'avatar': 'https://cdn.pixabay.com/photo/2021/01/06/10/10/woman-5893922_1280.jpg'},
  ]; */

  Future<List<Contact>> _buscar() async {
    return ContactDAOImpl().find();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: _buscar(),
        builder: (context, futuro){
          if (futuro.hasData) {
            var lista = futuro.data;
            Scaffold(
              appBar: AppBar(
                title: const Text('Lista de contacto'),
                actions: [
                  IconButton(
                      onPressed: () {
                        Navigator.of(context).pushNamed(MyApp.CONTACT_FORM);
                      },
                      icon: const Icon(Icons.add))
                ],
              ),
              body: ListView.builder(
                itemCount: lista?.length,
                itemBuilder: (context, i) {
                  var contato = lista?[i];
                  var avatar = CircleAvatar(
                    backgroundImage: NetworkImage(contato!.urlAvatar!),
                  );
                  return ListTile(
                    leading: avatar,
                    //leading: const Icon(Icons.person),
                    title: Text(contato!.nome!),
                    subtitle: Text(contato!.telefone!),
                    trailing: Container(
                      width: 100,
                      child: Row(
                        children: [
                          IconButton(
                              onPressed: () {}, icon: const Icon(Icons.edit)),
                          IconButton(
                              onPressed: () {}, icon: const Icon(Icons.delete))
                        ],
                      ),
                    ),
                  );
                },
              ),
            );
          } else {
            const Scaffold();
          }
          return const Divider();
        }
      );
  }
}
