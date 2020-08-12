import 'package:flutter/material.dart';
import 'package:smooth_star_rating/smooth_star_rating.dart';
import 'Livro.dart';

class Cadastro extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<Cadastro> {
  var rating = 0.0;

  final _form = GlobalKey<FormState>();
  String _nome, _classificacao;

  List<Livro> livros = new List<Livro>();
  TextEditingController controller =  new TextEditingController();

  void adicionaLivro(String nome, String classificacao) {

    setState(() {
      livros.add(Livro(nome, classificacao));
    });
    print(nome);
    print(classificacao);

    //controller.clear(); 
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      debugShowCheckedModeBanner: false,
      home: Scaffold(

        appBar: new AppBar(
            leading: IconButton(
              icon: Icon(Icons.arrow_back_ios, color: Colors.white),
              onPressed: () => Navigator.pop(context,Livro(null, null)),
            ), 
          title: new Text("Cadastrar Livro"),
          actions: [
            IconButton(
              icon: Icon(Icons.save),
              onPressed: () {
                _form.currentState.save();
                print(_nome);
                print(_classificacao);
                //print(livros.toString());
                adicionaLivro(_nome,_classificacao);
                //Navigator.of(context).pop();
                Navigator.pop(context,Livro(_nome, _classificacao));
              },
            )
          ],
        ),

        body: 
          Form( 
          key: _form,  
          child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                Container(
                  padding: EdgeInsets.all(8.0),
                  child: 
                  TextFormField(
                    decoration: InputDecoration(
                      labelText: "Nome do Livro"
                    ),
                    validator: (input) => null ? 'Preencha o nome' : null,
                    onSaved: (input) => _nome = input,
                  )
                ),    

                SmoothStarRating(
                  rating: rating,
                  isReadOnly: false,
                  size: 80,
                  filledIconData: Icons.star,
                  halfFilledIconData: Icons.star_half,
                  defaultIconData: Icons.star_border,
                  starCount: 3,
                  allowHalfRating: true,
                  spacing: 2.0,
                  onRated: (valor) => _classificacao = valor.toString(),
                ),
            ]),
          )
      ),
    );
  }
}