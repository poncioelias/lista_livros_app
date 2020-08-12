import 'package:flutter/material.dart';

class Cadastro extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Cadastro")
      ),
      body: Container(
        child: Center(
          child: 
          RaisedButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: 
              Text("Salvar")
          )
        ,),

      )
    );
  }

}