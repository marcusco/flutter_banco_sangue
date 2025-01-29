import 'package:flutter/material.dart';

class PossiveisDoadoresTipoSanguineo extends StatelessWidget {
  const PossiveisDoadoresTipoSanguineo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Possíveis doadores para cada tipo sanguíneo receptor'),
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
