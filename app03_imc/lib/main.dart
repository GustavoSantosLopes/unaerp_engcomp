import 'dart:math';

import 'package:flutter/material.dart';

void main() {
  runApp(
    const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'IMC',
      home: TelaPrincipal(),
    ),
  );
}

//
// TELA PRINCIPAL
// Stateful Widget = stf + TAB
class TelaPrincipal extends StatefulWidget {
  const TelaPrincipal({Key? key}) : super(key: key);

  @override
  State<TelaPrincipal> createState() => _TelaPrincipalState();
}

class _TelaPrincipalState extends State<TelaPrincipal> {
  //Atributos responsáveis por armazenar os valores
  //dos campos de texto
  var txtPeso = TextEditingController();
  var txtAltura = TextEditingController();

  //Atributo responsável por identificar unicamente
  //o formulário da UI
  var form = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Calculadora IMC'),
        centerTitle: true,
        backgroundColor: Colors.blue.shade900,
      ),
      backgroundColor: Colors.grey.shade300,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(30),
          child: Center(
            //
            // FORMULÁRIO
            //
            child: Form(
              key: form,
              child: Column(
                children: [
                  Icon(
                    Icons.people_alt,
                    size: 100,
                    color: Colors.blue.shade900,
                  ),
                  const SizedBox(height: 30),
                  campoTexto('Peso', txtPeso),
                  const SizedBox(height: 10),
                  campoTexto('Altura', txtAltura),
                  const SizedBox(height: 50),
                  botao('calcular'),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  //
  // CAMPO DE TEXTO
  //
  campoTexto(rotulo, variavel) {
    return TextFormField(
      //Associar a variável de controle
      controller: variavel,
      //Aparência
      style: TextStyle(
        fontSize: 32,
        color: Colors.grey.shade900,
      ),
      //Teclado numérico
      keyboardType: TextInputType.number,
      //Senha
      obscureText: false,
      //Quant. máxima de caracteres
      maxLength: 10,
      decoration: InputDecoration(
        labelText: rotulo,
        labelStyle: TextStyle(
          fontSize: 24,
          color: Colors.grey.shade600,
        ),
        hintText: 'Informe um valor numérico',
        hintStyle: TextStyle(
          fontSize: 18,
          color: Colors.grey.shade400,
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
        ),
      ),
      //
      // Validação da entrada do usuário
      //
      validator: (value) {
        value = value!.
        
        (',', '.');
        //verificar se o usuário digitou um valor
        //numérico
        if (double.tryParse(value) == null) {
          return 'Entre com um valor numérico';
        } else {
          return null;
        }
      },
    );
  }

  //
  // BOTÃO
  //
  botao(rotulo) {
    return SizedBox(
      width: 250,
      height: 50,
      //Tipos de botões
      //  ElevatedButton
      //  TextButton
      //  OutlinedButton
      child: ElevatedButton(
        //comportamento
        onPressed: () {
          //Validação dos campos do formulário
          if (form.currentState!.validate()) {
            //efetuar o cálculo do IMC
            setState(() {
              double peso = double.parse(txtPeso.text.replaceFirst(',', '.'));
              double altura =
                  double.parse(txtAltura.text.replaceFirst(',', '.'));
              double imc = peso / pow(altura, 2);
              caixaDialogo('O valor do IMC é ${imc.toStringAsFixed(2)}');

              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  duration: const Duration(seconds: 3),
                  elevation: 0,
                  content: Text(
                    'O valor do IMC é ${imc.toStringAsFixed(2)}',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.blue.shade900,
                    ),
                  ),
                  margin: const EdgeInsets.fromLTRB(100, 0, 100, 20),
                  behavior: SnackBarBehavior.floating,
                  backgroundColor: Colors.grey.shade400.withOpacity(0.3),
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(20)),
                  ),
                ),
              );
            });
          }
        },
        //aparência
        child: Text(
          rotulo,
          style: const TextStyle(fontSize: 24),
        ),
        style: ElevatedButton.styleFrom(
          primary: Colors.blue.shade900,
        ),
      ),
    );
  }

  //
  // CAIXA DE DIÁLOGO
  //
  caixaDialogo(msg) {
    return showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Calculadora IMC'),
          content: Text(
            msg,
            style: const TextStyle(fontSize: 24),
          ),
          actions: [
            TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                  setState(() {
                    txtPeso.clear();
                    txtAltura.clear();
                  });
                },
                child: const Text('fechar')),
          ],
        );
      },
    );
  }
}
