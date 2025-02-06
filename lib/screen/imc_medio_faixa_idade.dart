import 'package:flutter/material.dart';
import 'package:flutter_banco_sangue/service/DoadorService.dart';

import '../dto/ImcFaixaPorIdadeDTO.dart';

class ImcMedioFaixaIdade extends StatelessWidget {
  ImcMedioFaixaIdade({Key? key}) : super(key: key);

  DoadorService doadorService = DoadorService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Imc médio por faixa de idade'),
        ),
        body: buildList());
  }

  Widget buildList() {
    return FutureBuilder<List<ImcFaixaPorIdadeDTO>?>(
      future: doadorService.imcMedioPorFaixaIdade(),
      builder: (context, snapshot) {
        if (snapshot.hasData &&
            snapshot.connectionState == ConnectionState.done) {
          return ListView.builder(
            itemCount: snapshot.data!.length,
            itemBuilder: (context, index) {
              return buildText(snapshot.data![index]);
            },
          );
        } else if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(
            child: CircularProgressIndicator(),
          );
        } else
          return Container();
      },
    );
  }

  Widget buildText(ImcFaixaPorIdadeDTO value) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Text(
              'Faixa: ${value.faixa} ',
              style: const TextStyle(
                fontSize: 18,
                color: Colors.redAccent,
                fontWeight: FontWeight.w600,
              ),
              textAlign: TextAlign.center,
            ),
            Text(
              'Soma IMC: ${value.somaImc.toStringAsFixed(2)}',
              style: const TextStyle(
                fontSize: 18,
                color: Colors.redAccent,
                fontWeight: FontWeight.w600,
              ),
              textAlign: TextAlign.center,
            ),
            Text(
              'Média IMC: ${value.mediaImc.toStringAsFixed(2)}',
              style: const TextStyle(
                fontSize: 18,
                color: Colors.redAccent,
                fontWeight: FontWeight.w600,
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
