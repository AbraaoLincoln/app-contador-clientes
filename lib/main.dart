import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(title: 'Contador', home: MyHome());
  }
}

class MyHome extends StatefulWidget {
  @override
  _MyHomeState createState() => _MyHomeState();
}

class _MyHomeState extends State<MyHome> {
  var msg = "pode entrar";
  var qtdClientes = 0;

  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      Image.asset(
        "imagens/show.jpg",
        fit: BoxFit.cover,
        height: 1000,
      ),
      Column(
        children: [
          Text("Contador de Pessoas $qtdClientes", textAlign: TextAlign.center),
          Padding(
              padding: EdgeInsets.fromLTRB(100, 0, 100, 0),
              child: Row(children: [
                ElevatedButton(onPressed: addCliente, child: Text("+1")),
                ElevatedButton(onPressed: removerCliente, child: Text("-1"))
              ], mainAxisAlignment: MainAxisAlignment.spaceAround)),
          Text(msg)
        ],
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
      )
    ]);
  }

  void addCliente() {
    setState(() {
      if (qtdClientes < 20) qtdClientes++;
      if (qtdClientes >= 20) msg = "lotado";
    });
  }

  void removerCliente() {
    setState(() {
      if (qtdClientes > 0) {
        qtdClientes--;
        msg = "pode entrar";
      }
    });
  }
}
