import 'package:agenda_crud/app/domain/entities/contact.dart';
import 'package:agenda_crud/app/view/contact_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

class ContactList extends StatelessWidget {
  ContactList({super.key});
  final _back = ContactL();

  CircleAvatar circleAvatar(String url) {
    return (Uri.tryParse(url)!.isAbsolute)
        ? CircleAvatar(backgroundImage: NetworkImage(url))
        : const CircleAvatar(child: Icon(Icons.person));
  }

  Widget iconEditButton(onPressed) {
    return IconButton(
        icon: const Icon(Icons.edit),
        color: Colors.orange,
        onPressed: onPressed);
  }

  Widget iconRemoveButton(BuildContext context, remove) {
    return IconButton(
      icon: const Icon(Icons.delete),
      color: Colors.red,
      onPressed: () {
        showDialog(
            context: context,
            builder: (context) => AlertDialog(
                  title: const Text('Excluir'),
                  content: const Text('Confirmar a Exclusão'),
                  actions: [
                    ElevatedButton(
                      child: const Text('Não'),
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                    ),
                    ElevatedButton(
                      onPressed: remove,
                      child: const Text('Sim'))
                  ],
                ));
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Lista de contacto'),
          actions: [
            IconButton(
              onPressed: () {
                _back.goToForm(context);
                //Navigator.of(context).pushNamed(MyApp.CONTACT_FORM);
              },
              icon: const Icon(Icons.add),
            )
          ],
        ),
        body: Observer(builder: (context) {
          return FutureBuilder(
              future: _back.list,
              builder: (context, futuro) {
                if (!futuro.hasData) {
                  return const Center(child: CircularProgressIndicator());
                } else {
                  List<Contact> lista = futuro.data!;
                  return ListView.builder(
                    itemCount: lista.length,
                    itemBuilder: (context, i) {
                      var contato = lista[i];
                      return ListTile(
                        leading: circleAvatar(contato.urlAvatar!),
                        title: Text(contato.nome!),
                        onTap: () {
                          //Navigator.of(context).pushNamed(MyApp.CONTACT_DETAILS);
                          _back.gotToDetails(context);
                        },
                        subtitle: Text(contato.telefone!),
                        trailing: Container(
                          width: 100,
                          child: Row(
                            children: [
                              iconEditButton(() {
                                _back.goToForm(context, contato);
                              }),
                              iconRemoveButton(context, () {
                                _back.remove(contato.id!);
                                Navigator.of(context).pop();
                              })
                            ],
                          ),
                        ),
                      );
                    },
                  );
                }
              });
        }));
  }
}
