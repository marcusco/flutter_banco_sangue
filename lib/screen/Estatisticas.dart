import 'package:flutter/material.dart';
import 'package:flutter_banco_sangue/service/DoadorService.dart';

import '../dto/DoadoresPorEstadoDTO.dart';

class Estatisticas extends StatelessWidget {
   Estatisticas({Key? key}) : super(key: key);

  DoadorService doadorService = new DoadorService();
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: buidList()
    );
  }

   Widget buidList() {
     return FutureBuilder<List<DoadoresPorEstadoDTO>?>(
       future: doadorService.doadoresPorEstado(),
       builder: (context, snapshot) {
         if (snapshot.hasData &&
             snapshot.connectionState == ConnectionState.done) {
           return ListView.builder(
             itemCount: snapshot.data!.length,
             itemBuilder: (context, index) {
               return Card(
                 color: Colors.deepOrange,
                   child: buildText(snapshot.data![index]));
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

   Widget buildText(DoadoresPorEstadoDTO value){
     return Text(
       'Doadores por estado: ${value.estado} quantidade: ${value.quantidade}' ?? "Sem nome",
       style: const TextStyle(
         fontSize: 18,
         color: Colors.white,
         fontWeight: FontWeight.w600,
         backgroundColor: Colors.deepOrange
       ),
       textAlign: TextAlign.justify,
     );
   }
}
