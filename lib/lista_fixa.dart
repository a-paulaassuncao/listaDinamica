import 'package:flutter/material.dart';

class ListaApp extends StatelessWidget {
  final List<String> itens = ['Item 1', 'Item 2', 'Item 3'];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Aplicativo Listas',
      home: Scaffold(
        appBar: AppBar(
          title: Text('Listas'),
          backgroundColor: Colors.deepPurple,
          centerTitle: true,
        ),
        body: ListView.builder(
          itemCount: itens.length,
          itemBuilder: (context, index) {
            return ListTile(
              onTap: () {},
              title: Text(
                itens[index],
                style: TextStyle(color: Colors.deepPurpleAccent),
              ),
              subtitle: Text("Texto"),
              leading: CircleAvatar(
                backgroundColor: Colors.deepPurpleAccent,
                child: IconTheme(
                  child: Icon(Icons.add_task),
                  data: IconThemeData(color: Colors.white),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}