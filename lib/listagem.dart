import 'package:flutter/material.dart';
import 'Livro.dart';
import 'Cadastro.dart';


class ListaScreen extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return new ListaScreenState();
  }
}

class ListaScreenState extends State<ListaScreen> {
  
  List<Livro> livros = new List<Livro>();

  _cadastro_pagina() async {
    var livro = await Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) => Cadastro()));
    print(livro);

    //adicionar validação de campo aqui
    if(livro.nome != null && livro.nome != "" ){
      setState(() {
        livros.add(livro);
      });
    }
  }


  Widget getItem(Livro livro) {
      return new Row(children: [
        
        IconButton(
            icon: Icon(Icons.star_border, color: Colors.blue,),
            //buildStar(livro.classificacao),
            iconSize: 42.0,
            onPressed: () {
              setState((){
                //ação;
              });
            },
          ),
          new Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                livro.nome,
                style: TextStyle(fontWeight: FontWeight.bold)
              ),
              Text(
                livro.statusLeitura,
                style: TextStyle(color: Colors.grey[700])
              )
            ],
          ),
          
        ],
      );
  }

  @override
  void initState() {
    print(livros);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: new AppBar(
          title: new Text("Meus Livros")
        ),
        body: Column(
          
          mainAxisSize: MainAxisSize.max,
          children: <Widget>[
            Expanded (child: 
            ListView.builder(
              padding: EdgeInsets.all(8.0),
              itemCount: livros.length, 
              itemBuilder: (_, indice) {
                return getItem(livros[indice]);
              },
              )
            ,)
          ]
        ),
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add),
          onPressed: () { 
            _cadastro_pagina();
          },
        )
      );

  }

}