import 'package:flutter/material.dart';
import 'package:flutter_banco_sangue/service/DoadorService.dart';

import '../dto/MediaIdadeTipoSanguineoDTO.dart';

class MediaIdadeTipoSanguineo extends StatelessWidget {
   MediaIdadeTipoSanguineo({Key? key}) : super(key: key);

  DoadorService doadorService = DoadorService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Média de idade para cada tipo sanguíneo'),
        ),
        body: Container(
          child:  buidList(),
        ),

    );
  }

  Widget buidList() {
    return FutureBuilder<List<MediaIdadeTipoSanguineoDTO>?>(
      future: doadorService.mediaIdadeTipoSanguineo(),
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

   Widget buildCard(MediaIdadeTipoSanguineoDTO value){
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
               'Percentual: ${value.mediaIdade}%' ?? "Sem nome",
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
