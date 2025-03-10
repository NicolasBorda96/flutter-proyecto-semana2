import 'package:flutter/material.dart';

class ResultadoPage extends StatelessWidget {
  final int edad, peso, estatura;
  final bool genero;
  String resultado = "", mensaje = "";
  double valor = 0;
  Color color = Colors.white;

  ResultadoPage(
      {required this.edad,
      required this.peso,
      required this.estatura,
      required this.genero});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Calculadora IMC"),
      ),
      body: _body(context),
    );
  }

  Widget _body(BuildContext context) {
    _calculo();
    return Column(
      children: [
        Container(
          alignment: Alignment.centerLeft,
          padding: const EdgeInsets.fromLTRB(10, 20, 0, 20),
          child: Text(
            "Resultado",
            style: TextStyle(fontSize: 50, fontWeight: FontWeight.bold),
          ),
        ),
        Expanded(
          child: Container(
            margin: EdgeInsets.all(10),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              color: Colors.grey[800],
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Center(
                  child: Text(
                    "$resultado",
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: color),
                  ),
                ),
                Center(
                  child: Text(
                    "$valor",
                    style: TextStyle(fontSize: 90, fontWeight: FontWeight.bold),
                  ),
                ),
                Center(
                  child: Text(
                    "$mensaje",
                    style: TextStyle(fontSize: 20),
                    textAlign: TextAlign.center,
                  ),
                )
              ],
            ),
          ),
        ),
        Container(
          height: 90,
          padding: EdgeInsets.fromLTRB(0, 10, 0, 0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Expanded(
                child: ElevatedButton(
                  style: ButtonStyle(
                      backgroundColor:
                          MaterialStateProperty.all<Color>(Colors.pink)),
                  onPressed: () {
                    Navigator.pop(context);
                  },
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

  void _calculo() {
    valor = estatura / 100;
    valor *= valor;
    valor = peso / valor;
    valor = double.parse(valor.toStringAsFixed(1));
    if (valor < 18.5) {
      resultado = "Bajo peso".toUpperCase();
      mensaje = "Tiene un peso corporal bajo. ¡Ten cuidado!";
      color = Colors.yellow;
    } else if (valor < 24.9) {
      resultado = "Peso normal".toUpperCase();
      mensaje = "Tiene un peso corporal normal. ¡Buen trabajo!";
      color = Colors.green;
    } else if (valor < 29.9) {
      resultado = "Sobrepeso".toUpperCase();
      mensaje = "Tiene sobrepeso. ¡Es momento de tomar medidas!";
      color = Colors.yellow;
    } else if (valor < 34.5) {
      resultado = "Obesidad grado I".toUpperCase();
      mensaje = "Tiene obesidad nivel 1. ¡Ten cuidado, esto es una enfermedad!";
      color = Colors.amber;
    } else if (valor < 39.9) {
      resultado = "Obesidad grado II".toUpperCase();
      mensaje = "Tiene obesidad nivel 2. ¡Mucho cuidado, esto es grave!";
      color = Colors.orange;
    } else {
      resultado = "Obesidad grado III".toUpperCase();
      mensaje = "Tiene obesidad nivel 3. ¡Peligro, zona roja!";
      color = Colors.red;
    }
  }
}
