import 'package:flutter/material.dart';
import 'package:mobile_class/screens/cadastro_usuarios.dart';


class SucessoCadastro extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Qual é o link?",
      home: Scaffold(
        body: Center(
          child: Text(
            "Disciplina registrada!",
            style: TextStyle(fontSize: 42),
          ),
        ),
      ),
    );
  }
}

class CadastroDisciplinas extends StatelessWidget {
  TextEditingController nameController = TextEditingController();
  TextEditingController datetimeController = TextEditingController();
  TextEditingController linkController = TextEditingController();
  CadastroUsuarios CaUs = new CadastroUsuarios();

  @override
  Widget build(BuildContext context) {

    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text("Seja Bem-Vindo" + CaUs.nameeController.text, style: TextStyle(color: Colors.black)),
          leading: Builder(
            builder: (BuildContext context) {
              return IconButton(
                icon: const Icon(Icons.book),
                onPressed: () { Scaffold.of(context).openDrawer(); },
                tooltip: MaterialLocalizations.of(context).openAppDrawerTooltip,
              );

            },

          ),

        ),
        body: Padding(
            padding: EdgeInsets.all(10),
            child: ListView(
              children: <Widget>[
                Container(
                    alignment: Alignment.center,
                    padding: EdgeInsets.all(10),
                    child: Text(
                      'Qual é o link?',
                      style: TextStyle(
                          color: Colors.blue,
                          fontWeight: FontWeight.w500,
                          fontSize: 30),
                    )),
                Container(
                    alignment: Alignment.center,
                    padding: EdgeInsets.all(10),
                    child: Text(
                      'Registrar Disciplina',
                      style: TextStyle(fontSize: 20),
                    )),
                Container(
                  padding: EdgeInsets.all(10),
                  child: TextField(
                    controller: nameController,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Disciplina',
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.all(10),
                  child: TextField(
                    controller: datetimeController,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Date e Hora',
                    ),
                    keyboardType: TextInputType.datetime,
                  ),
                ),
                Container(
                  padding: EdgeInsets.fromLTRB(10, 10, 10, 0),
                  child: TextField(
                    controller: linkController,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Link da aula',
                    ),
                    keyboardType: TextInputType.url,
                  ),
                ),
                Container(
                    height: 70,
                    padding: EdgeInsets.fromLTRB(10, 20, 10, 0),
                    child: RaisedButton(
                      textColor: Colors.white,
                      color: Colors.blue,
                      child: Text('Cadastrar'),
                      onPressed: () {
                        print(nameController.text);
                        print(datetimeController.text);
                        print(linkController.text);
                        Navigator.push(
                          context,
                          showAlertDialog3(context),
                        );
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
      title: Text("Disciplina registrada com sucesso!", style: TextStyle( fontWeight: FontWeight.bold )),
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