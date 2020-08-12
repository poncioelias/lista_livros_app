import 'package:flutter/material.dart';
import 'listagem.dart';

void main() {
  runApp(new ListaLivrosApp());
}

class ListaLivrosApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      home: new ListaScreen()
    );
  }

}

