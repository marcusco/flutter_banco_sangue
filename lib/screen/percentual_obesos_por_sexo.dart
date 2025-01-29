import 'package:flutter/material.dart';

import '../dto/ObesosPorSexoDTO.dart';
import '../dto/MediaIdadeTipoSanguineoDTO.dart';
import '../service/DoadorService.dart';

class PercentualObesosPorSexo extends StatelessWidget {
  PercentualObesosPorSexo({Key? key}) : super(key: key);
  DoadorService doadorService = DoadorService();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Percentual de obesos entre os homens e mulheres'),
      ),
      body: buildList(),
    );
  }

  Widget buildList() {
    return FutureBuilder<ObesosPorSexoDTO>(
      future: doadorService.percentualObesosPorSexo(),
      builder: (context, snapshot) {
        if (snapshot.hasData &&
            snapshot.connectionState == ConnectionState.done) {
          return buildCard(snapshot.data!);
        } else if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(
            child: CircularProgressIndicator(),
          );
        } else
          return Container();
      },
    );
  }

  Widget buildCard(ObesosPorSexoDTO value) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Center(
              child: Text(
                'Masculino: ${value.percentualMasculino} ' ?? "Sem nome",
                style: const TextStyle(
                  fontSize: 18,
                  color: Colors.redAccent,
                  fontWeight: FontWeight.w600,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            Center(
              child: Text(
                'Feminino: ${value.percentualFeminino}%' ?? "Sem nome",
                style: const TextStyle(
                  fontSize: 18,
                  color: Colors.redAccent,
                  fontWeight: FontWeight.w600,
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
