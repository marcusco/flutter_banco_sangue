import 'package:flutter/material.dart';
import 'package:flutter_banco_sangue/screen/percentual_obesos_homens_mulhres.dart';
import 'package:flutter_banco_sangue/screen/possiveis_doadores_tipo_sanguineo.dart';

import 'DoadoresPorEstado.dart';
import 'imc_medio_faixa_idade.dart';
import 'media_idade_tipo_sanguineo.dart';

class NavDrawer extends StatelessWidget {
  const NavDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          DrawerHeader(
            child: Text(
              '',
              style: TextStyle(color: Colors.white, fontSize: 25),
            ),
            decoration: BoxDecoration(
                color: Colors.redAccent,
                image: DecorationImage(
                    fit: BoxFit.fill,
                    image: AssetImage('assets/images/banco-de-sangue.jpg'))),
          ),
          ListTile(
            leading: Icon(Icons.accessibility_outlined),
            title: Text('Doadores por estado'),
            onTap: () =>
                {
                  Navigator.of(context).pop(),
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => DoadoresPorEstado()),
                  )
                },
          ),
          ListTile(
            leading: Icon(Icons.account_circle),
            title: Text('IMC médio em cada faixa de idade'),
            onTap: () =>
            {
              Navigator.of(context).pop(),
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => ImcMedioFaixaIdade()),
              )
            },
          ),
          ListTile(
            leading: Icon(Icons.adb_sharp),
            title: Text('Percentual de obesos entre os homens e mulheres'),
            onTap: () =>
            {
              Navigator.of(context).pop(),
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => PercentualObesosHomensMulhres()),
              )
            },
          ),
          ListTile(
            leading: Icon(Icons.border_color),
            title: Text('Média de idade para cada tipo sanguíneo'),
            onTap: () =>
            {
              Navigator.of(context).pop(),
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => MediaIdadeTipoSanguineo()),
              )
            },
          ),
          ListTile(
            leading: Icon(Icons.abc_outlined),
            title: Text('Possíveis doadores para cada tipo sanguíneo receptor'),
            onTap: () =>
            {
              Navigator.of(context).pop(),
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => PossiveisDoadoresTipoSanguineo()),
              )
            },
          ),
          ListTile(
            leading: Icon(Icons.exit_to_app),
            title: Text('Volta a tela principal'),
            onTap: () => {Navigator.of(context).pop()},
          ),
        ],
      ),
    );
  }
}
