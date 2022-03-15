import 'package:flutter/material.dart';

class WidgetCarro extends StatelessWidget {
  //Atributos que serão usados para receber
  //dados através do construtor
  final String marca;
  final String modelo;
  final String imagem;

  const WidgetCarro(this.marca, this.modelo, this.imagem, {Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      //margens
      //margin: const EdgeInsets.all(40),
      margin: const EdgeInsets.fromLTRB(40, 40, 40, 0),

      //espaçamento interno
      padding: const EdgeInsets.all(30),

      //bordas
      decoration: BoxDecoration(
        border: Border.all(
          width: 2.0,
          color: Colors.black38,
        ),
        color: Colors.grey.shade300,
        borderRadius: BorderRadius.circular(20),
      ),

      width: MediaQuery.of(context).size.width * 0.90,
      height: 380,

      child: Column(
        children: [
          Text(
            marca,
            style: const TextStyle(
              fontSize: 28,
              fontWeight: FontWeight.bold,
              color: Colors.red,
            ),
          ),
          Text(
            modelo,
            style: const TextStyle(
              fontSize: 24,
              color: Colors.red,
            ),
          ),

          //
          // IMAGEM
          //
          Image.asset(
            imagem,
            scale: 1.8,
          ),
          //Image.network('https://picsum.photos/300/240'),
        ],
      ),
    );
  }
}
