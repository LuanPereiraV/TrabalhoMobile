import 'package:flutter/material.dart';
import 'package:mobile_class/screens/cadastro_disciplinas.dart';
import 'package:mobile_class/screens/editarDados_usuario.dart';
import 'package:mobile_class/screens/editar_Disciplinas.dart';

class Disciplina {
  final String title;
  final String description;

  const Disciplina(this.title, this.description);
}

class DisciplinasScreen extends StatelessWidget {
  const DisciplinasScreen({Key? key, required this.disciplinas}) : super(key: key);

  final List<Disciplina> disciplinas;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Todos'),
          actions:[
            IconButton(
            onPressed: (){
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => editarDados(),
                ),
              );
            },
            icon: Icon(Icons.person),
            )
          ]

    ),

      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => CadastroDisciplinas(),
            ),
          );
        },
        child: const Icon(Icons.add),
        backgroundColor: Colors.blue,
      ),
      body: ListView.builder(
        itemCount: disciplinas.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(disciplinas[index].title),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => DetailScreen(disciplina: disciplinas[index]),

                ),
              );
            },
          );
        },
      ),
    );
  }
}

class DetailScreen extends StatelessWidget {
  const DetailScreen({Key? key, required this.disciplina}) : super(key: key);

  final Disciplina disciplina;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(disciplina.title),
          actions:[
            IconButton(
              onPressed: (){
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => editarDisciplinas(),
                  ),
                );
              },
              icon: Icon(Icons.settings),
            ),
            IconButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => HomePage(),
                    ),
                );
              },
              icon: Icon(Icons.timer),

            )
          ]

      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Text(disciplina.description),
      ),

    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool _running = true;

  Stream<String> _clock() async* {

    while (_running) {
      await Future<void>.delayed(Duration(seconds: 1));
      DateTime _now = DateTime.now();
      yield "${_now.hour} : ${_now.minute} : ${_now.second}";
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text('Cronômetro'),
      ),
        body: Center(

          child: StreamBuilder(
            stream: _clock(),
            builder: (context, AsyncSnapshot<String> snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {

                return CircularProgressIndicator();

              }
              return Text(
                snapshot.data!,
                style: TextStyle(fontSize: 50, color: Colors.blue),
              );
              },
          )

        )
    );

  }
}

