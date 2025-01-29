import 'package:flutter/material.dart';

import '../dto/QuantidadeDoadoresPorTipoSanguineoDTO.dart';
import '../service/DoadorService.dart';

class QuantidadeDoadoresTipoSanguineo extends StatelessWidget {
   QuantidadeDoadoresTipoSanguineo({Key? key}) : super(key: key);
   DoadorService doadorService = DoadorService();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Quantidade doadores para cada tipo sanguíneo receptor'),
        ),
        body: Container(
          child:  buidList(),
        )
    );
  }

  Widget buidList() {
    return FutureBuilder<List<QuantidadeDoadoresPorTipoSanguineoDTO>?>(
      future: doadorService.quantidadeDoadoresTipoSanguineo(),
      builder: (context, snapshot) {
        if (snapshot.hasData &&
            snapshot.connectionState == ConnectionState.done) {
          return ListView.builder(
            itemCount: snapshot.data!.length,
            itemBuilder: (context, index) {
              return buildCard(snapshot.data![index]);
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
  Widget buildCard(QuantidadeDoadoresPorTipoSanguineoDTO value){
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Text(
              'Tipo sanguineo: ${value.tipoSanguineo} ' ?? "Sem nome",
              style: const TextStyle(
                fontSize: 18,
                color: Colors.redAccent,
                fontWeight: FontWeight.w600,
              ),
              textAlign: TextAlign.center,
            ),
            Text(
              'Receptores: ${value.receber}' ?? "Sem nome",
              style: const TextStyle(
                fontSize: 18,
                color: Colors.redAccent,
                fontWeight: FontWeight.w600,
              ),
              textAlign: TextAlign.center,
            ),
            Text(
              'Quantidade: ${value.quantidade}' ?? "Sem nome",
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
