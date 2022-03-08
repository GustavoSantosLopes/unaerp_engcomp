import 'package:flutter/material.dart';

void main() {
  runApp(
    const MaterialApp(
      title: 'Meu primeiro App',
      home: TelaPrincipal(),
    ),
  );
}

//
//TELA PRINCIPAL
//Stateless = stl+TAB
class TelaPrincipal extends StatelessWidget {
  const TelaPrincipal({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //BARRA DE TÍTULO
      appBar: AppBar(
        title: const Text('Meu App'),
        centerTitle: true,
        backgroundColor: Colors.blue.shade900,
      ),

      backgroundColor: Colors.grey.shade200,

      //CORPO
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          const Text('Hello Flutter!', style: TextStyle(fontSize: 32)),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              Icon(Icons.directions_car, size: 54, color: Colors.red),
              Icon(Icons.directions_bus, size: 54),
              Icon(Icons.directions_train, size: 54),
              Icon(Icons.directions_bike, size: 54),
              Icon(Icons.directions_boat, size: 54),
            ],
          ),
          const Text('Hello Flutter!', style: TextStyle(fontSize: 32)),
          const Text('Hello Flutter!', style: TextStyle(fontSize: 32)),
          const Text('Hello Flutter!', style: TextStyle(fontSize: 32)),
          Container(
            //largura = 80% da largura do dipositivo
            width: MediaQuery.of(context).size.width * 0.80,

            height: 100,
            color: Colors.yellow,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                Icon(Icons.front_hand),
                Center(
                  child: Text('Hello'),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
