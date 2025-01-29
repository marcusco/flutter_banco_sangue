import 'package:flutter/material.dart';
import 'package:flutter_banco_sangue/service/DoadorService.dart';

import '../dto/DoadoresPorEstadoDTO.dart';

class DoadoresPorEstado extends StatelessWidget {
  DoadoresPorEstado({Key? key}) : super(key: key);

  DoadorService doadorService = new DoadorService();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Doadores por estado', style: TextStyle(
          fontSize: 22,
          color: Colors.red,
          fontWeight: FontWeight.w600,
        ),),

    ),
      body: Container(
        color: Colors.white,
        child: buidList()
      ),
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

   Widget buildText(DoadoresPorEstadoDTO value){
     return Card(
       child: Padding(
         padding: const EdgeInsets.all(8.0),
         child: Column(
           children: [
             Text(
               'Doadores por estado: ${value.estado} ' ?? "Sem nome",
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
