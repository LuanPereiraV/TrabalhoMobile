import 'package:flutter/material.dart';
import 'package:mobile_class/screens/cadastro_disciplinas.dart';
import 'package:mobile_class/screens/disciplina.dart';

class editarDisciplinas extends StatelessWidget {
  TextEditingController nameController = TextEditingController();
  TextEditingController datetimeController = TextEditingController();
  TextEditingController linkController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Disciplina'),

        ),
        body: Padding(
            padding: EdgeInsets.all(10),
            child: ListView(
              children: <Widget>[
                Container(
                    alignment: Alignment.center,
                    padding: EdgeInsets.all(10),
                    child: Text(
                      'Editar dados',
                      style: TextStyle(
                          color: Colors.blue,
                          fontWeight: FontWeight.w500,
                          fontSize: 30),
                    )),

                Container(
                  padding: EdgeInsets.all(10),
                  child: TextField(
                    controller: nameController,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Programação para Dispositivos Móveis',
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.all(10),
                  child: TextField(
                    controller: datetimeController,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),

                      labelText: '01/10 - 18:30',
                    ),
                    keyboardType: TextInputType.datetime,
                  ),
                ),
                Container(
                  padding: EdgeInsets.all(10),
                  child: TextField(
                    controller: linkController,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),

                      labelText: 'https://meet.google.com/uyk-tiur-wgn',
                    ),
                    keyboardType: TextInputType.url,
                  ),
                ),
                Container(
                    height: 40,
                    padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                    child: RaisedButton(
                      textColor: Colors.white,
                      color: Colors.blue,
                      child: Text('Concluir'),
                      onPressed: () {
                        showAlertDialog3(context);
                      },
                    )),
              ],
            ))
    );
  }

showAlertDialog3(BuildContext context) {

  // set up the button
  Widget OK = TextButton(
    child: Text("OK"),
    onPressed: () {
      Navigator.pop(
        context,
      );
    },
  );

  // set up the AlertDialog
  AlertDialog alert = AlertDialog(
    title: Text("Dados alterados com sucesso!", style: TextStyle( fontWeight: FontWeight.bold )),
    content: Text("Disciplina: " + nameController.text + "\n\n"
        + "Data e Hora: " + datetimeController.text + "\n\n" + "Link: " + linkController.text,  style: TextStyle(
        fontWeight: FontWeight.bold)),
    // view
    actions: [
      OK,
    ],
  );

  // show the dialog
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return alert;
    },
  );
}
}
