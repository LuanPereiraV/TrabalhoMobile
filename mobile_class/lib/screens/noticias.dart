import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class NoticiasUni extends StatelessWidget {
  Future<String> getPosts() async {
    var resp = await http.get(Uri.parse('https://jsonplaceholder.typicode.com/posts'));
    return resp.body;
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<String>(
        future: getPosts(),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return Scaffold(
              body: Center(
                child: Text(
                  'Aconteceu um erro',
                  style: TextStyle(fontSize: 20),
                ),
              ),
            );
          } else if (snapshot.hasData) {
            var news = json.decode(snapshot.requireData);
            return Scaffold(
              appBar: AppBar(
                title: Text('Noticias'),
                leading: Builder(
                  builder: (BuildContext context) {
                    return IconButton(
                      icon: const Icon(Icons.arrow_back),
                      onPressed: () {
                        Navigator.pop(
                          context
                        );
                      },
                      tooltip: MaterialLocalizations.of(context).openAppDrawerTooltip,
                    );
                  },
                ),
              ),
              body: ListView.builder(
                itemCount: news.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(news[index]['title']),
                    subtitle: Text(news[index]['body']),
                    onTap: () {

                    },
                  );
                },
              ),
            );
          } else {
            return Scaffold(
              body: Center(
                  child: CircularProgressIndicator(),
              ),
            );
          }
        },
    );
  }
}