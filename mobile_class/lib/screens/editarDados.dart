import 'package:flutter/material.dart';
import 'package:mobile_class/screens/cadastro_disciplinas.dart';
import 'package:mobile_class/screens/disciplina.dart';

class editarDados extends StatelessWidget {
  TextEditingController nameeController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Perfil'),

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
                    controller: nameeController,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'fulano de tal',
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.all(10),
                  child: TextField(
                    controller: emailController,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),

                      labelText: 'fuladodetal@gmail.com',
                    ),
                    keyboardType: TextInputType.emailAddress,
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
                        showAlertDialog2(context);
                      },
                    )),
              ],
            ))
    );
  }
}

showAlertDialog2(BuildContext context) {

  TextEditingController passwordController = TextEditingController();
  // set up the button
  Widget Login = TextField(
    obscureText: true,
    controller: passwordController,
    decoration: InputDecoration(
      border: OutlineInputBorder(),
    ),
  );
  Widget Botao = RaisedButton(

      textColor: Colors.white,
      color: Colors.blue,
      child: Text('Editar'),
        onPressed: () => Navigator.push(
          context,
          MaterialPageRoute(
            builder: (ctx) => FutureDemoPage(),
          ),
        ),

  );



  // set up the AlertDialog
  AlertDialog alert = AlertDialog(
    title: Text("Informe sua senha para concluir"),
    // view
    actions: [
      Login,
      Botao,
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
class FutureDemoPage extends StatelessWidget {

  Future<String> getData() {
    return Future.delayed(Duration(seconds: 2), () {
      return "Alterado com sucesso!";

      // throw Exception("Custom Error");

    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text(''),
        ),

        body: FutureBuilder(

          builder: (ctx, snapshot) {
            // Checking if future is resolved or not
            if (snapshot.connectionState == ConnectionState.done) {
              // If we got an error
              if (snapshot.hasError) {
                return Center(
                  child: Text(
                    '${snapshot.error} occured',
                    style: TextStyle(fontSize: 18),
                  ),
                );

                // if we got our data
              } else if (snapshot.hasData) {
                // Extracting data from snapshot object
                final data = snapshot.data as String;
                return Center(
                  child: Text(
                    '$data',
                    style: TextStyle(fontSize: 18),
                  ),
                );
              }
            }

            // Displaying LoadingSpinner to indicate waiting state
            return Center(
              child: CircularProgressIndicator(),

            );
          },


          // Future that needs to be resolved
          // inorder to display something on the Canvas
          future: getData(),
        ),


      ),
    );
  }


}
