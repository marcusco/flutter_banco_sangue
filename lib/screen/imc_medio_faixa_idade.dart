import 'package:flutter/material.dart';

class ImcMedioFaixaIdade extends StatelessWidget {
  const ImcMedioFaixaIdade({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Imc médio por faixa de idade'),

      ),
        body: Container(
          child:  Text(
            'Side menu',
            style: TextStyle(color: Colors.white, fontSize: 25),
          ),
        )
    );
  }
}
