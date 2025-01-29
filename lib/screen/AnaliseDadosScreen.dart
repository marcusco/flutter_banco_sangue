import 'package:flutter/material.dart';

import 'package:flutter_banco_sangue/service/DoadorService.dart';

import '../domain/Doador.dart';
import 'Estatisticas.dart';

class AnaliseDadosScreen extends StatelessWidget {
  AnaliseDadosScreen({super.key});

  DoadorService doadorService = new DoadorService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Banco de Sangue'),
        actions: [buildEstatistica(context)],
      ),
      body: Container(child: buidList()),
    );
  }

  Widget buildEstatistica(BuildContext context) {
    return ElevatedButton(
      onPressed: () => {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => Estatisticas()),
        )
      },
      child: Text("Estatisticas"),
    );
  }

  Widget buidList() {
    return FutureBuilder<List<Doador>?>(
      future: doadorService.loadJson(),
      builder: (context, snapshot) {
        if (snapshot.hasData &&
            snapshot.connectionState == ConnectionState.done) {
          return ListView.builder(
            itemCount: snapshot.data!.length,
            itemBuilder: (context, index) {
              return buildCardDoador(snapshot.data![index]);
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

  Widget buildCardDoador(Doador doador) {

    return Card(
      color: Colors.deepOrange,
      child: Column(

        children: [
          Center(
            child: Text(
              doador.nome ?? "Sem nome",
              style: const TextStyle(
                fontSize: 20,
                color: Colors.white,
                fontWeight: FontWeight.w900,
              ),
              textAlign: TextAlign.center,
            ),
          ),
          buildText('Tipo', doador.tipoSanguineo),
          buildText('Cpf', doador.cpf),
          buildText('Mãe', doador.mae),
          buildText('Fixo', doador.telefoneFixo),
          buildText('Celular', doador.celular),
        ],
      ),
    );
  }

  Widget buildText( String titulo, String? value){
    return Text(
      '${titulo}: ${value}' ?? "Sem nome",
      style: const TextStyle(
        fontSize: 15,
        color: Colors.white,
        fontWeight: FontWeight.w400,
      ),
      textAlign: TextAlign.center,
    );
  }
}
