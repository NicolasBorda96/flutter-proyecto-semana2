import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Calculadora IMC"),
      ),
      body: _body(),
    );
  }

  Widget _body() {
    return Column(
      children: [
        Expanded(
          child: Row(
            children: [
              _buttonGenero("male"),
              _buttonGenero("female"),
            ],
          ),
        ),
        Expanded(
          child: Container(
            color: Colors.red,
          ),
        ),
        Expanded(
          child: Row(
            children: [
              Expanded(
                child: Container(
                  color: Colors.orange,
                ),
              ),
              Expanded(
                child: Container(
                  color: Colors.amber,
                ),
              ),
            ],
          ),
        ),
        Container(
          height: 100,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Expanded(
                child: ElevatedButton(
                  style: ButtonStyle(
                      backgroundColor:
                          MaterialStateProperty.all<Color>(Colors.pink)),
                  onPressed: () {},
                  child: Text(
                    "Calcular",
                    style: TextStyle(
                      fontSize: 28,
                    ),
                  ),
                ),
              ),
            ],
          ),
        )
      ],
    );
  }

  Widget _buttonGenero(String genero) {
    return Expanded(
      child: Container(
        margin: EdgeInsets.all(15),
        child: ElevatedButton(
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(
                genero == "male" ? Colors.blue : Colors.pink),
            padding: MaterialStateProperty.all(EdgeInsets.all(10)),
            shape: MaterialStateProperty.all(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
              ),
            ),
          ),
          onPressed: () {},
          child: Column(
            children: [
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(0, 5, 0, 0),
                  child: Image(
                    image: AssetImage("assets/$genero.png"),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(5),
                child: Text(
                  genero == "male" ? "Hombre" : "Mujer",
                  style: TextStyle(fontSize: 18),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
