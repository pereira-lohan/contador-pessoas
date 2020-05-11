import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

//stateless não possui um estado interno, ou seja, são widgets que nunca irão mudar
//stateful
void main() {
  runApp(MaterialApp(
    title: "Contador de Pessoas", //Parâmetros Opcionais
    home: Home(),
    theme: ThemeData(
      primarySwatch: Colors.blue,
    ),
  ));
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _people = 0;
  String _text = "Pode Entrar!";
  void _changePeople(int count) {
    //setState funciona como se fosse um Refresh, Ele avisa ao Flutter que precisa
    //redesenhar a tela, uma coisa interessante sobre o redesenho, quando a tela
    //for grande ele vai redesenhar apenas o que foi modificado
    setState(() {
      _people += count;
      if (_people < 0) {
        _text = "Valor Negativo!";
        _people -= count;
      } else if (_people <= 10) {
        _text = "Pode Entrar!";
      } else {
        _text = "Devido ao Coronavírus, \nSomente 10 pessoas podem entrar";
        _people -= count;
      }
    });
  }

  @override // o build é a função que é sempre chamada quando precisamos redesenhar na tela
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Image.asset("images/original.jpg", fit: BoxFit.cover, height: 1000.0),
        Column(
          //Literalmente coluna para organizar os Widgets um abaixo do outro
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text("Pessoas: $_people",
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    decoration: TextDecoration.none) //Estilo da Fonte
                ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.all(15.0),
                  child: FlatButton(
                      child: Text("+1",
                          style:
                              TextStyle(fontSize: 40.0, color: Colors.white)),
                      onPressed: () {
                        _changePeople(1);
                      }),
                ),
                Padding(
                  padding: EdgeInsets.all(10.0),
                  child: FlatButton(
                      child: Text("-1",
                          style:
                              TextStyle(fontSize: 40.0, color: Colors.white)),
                      onPressed: () {
                        _changePeople(-1);
                      }),
                ),
              ],
            ),
            Text(
              _text,
              style: TextStyle(
                  color: Colors.white,
                  fontStyle: FontStyle.italic,
                  fontSize: 25.0,
                  decoration: TextDecoration.none), //Estilo da Fonte
              textAlign: TextAlign.center, //Alinhamento ao Centro
            ),
          ],
        )
      ],
    );
  }guaba
}
