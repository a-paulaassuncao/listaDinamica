import 'package:flutter/material.dart';

void main() => runApp(listaDinamicaTela());

class listaDinamicaTela extends StatelessWidget {
  listaDinamicaTela({super.key});
  

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Lista Dinâmica',
      home: TelaInicial(),
    );
  }
}

class TelaInicial extends StatefulWidget {
  const TelaInicial({super.key});

  @override
  State<TelaInicial> createState() => _TelaInicialState();
}

List<String> elementosLista = [];

final TextEditingController _textController = TextEditingController();

class _TelaInicialState extends State<TelaInicial> {
  List<String> elementosLista = [];

  void _adicionarElemento() {
    setState(() {
      elementosLista.add('Elemento ${elementosLista.length + 1}');
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Listas'),
        backgroundColor: Colors.deepOrange,
        centerTitle: true,
      ),
      body: ListView.separated(
        itemBuilder: (context, index) {
          return ListTile(
            leading: CircleAvatar(
              backgroundColor: Colors.deepOrangeAccent,
              child: IconTheme(
                child: Icon(Icons.pin),
                data: IconThemeData(color: Colors.white),
              ),
            ),
            title: Text(
              elementosLista[index],
              style: TextStyle(color: Colors.deepOrange),
            ),
          );
        },
        separatorBuilder: (context, index) => Divider(
          color: Colors.deepOrange,
        ),
        itemCount: elementosLista.length,
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.deepOrange,
        child: Icon(Icons.add),
        onPressed: () {
          _mostrarDialogoText();
        },
      ),
    );
  }

  void _mostrarDialogoText() {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('Adicionar item'),
            content: TextField(
              controller: _textController,
              decoration: InputDecoration(hintText: 'Digite uma frase'),
            ),
            actions: [
              TextButton(
                child: Text('Cancelar'),
                onPressed: () {
                  Navigator.of(context).pop();
                  _textController.clear();
                },
              ),
              TextButton(
                child: Text('Adicionar'),
                onPressed: () {
                  setState(() {
                    elementosLista.add(_textController.text);
                  });
                  Navigator.of(context).pop();
                  _textController.clear();
                },
              ),
            ],
          );
        });
  }
}
