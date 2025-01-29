import 'package:flutter/material.dart';

class MediaIdadeTipoSanguineo extends StatelessWidget {
  const MediaIdadeTipoSanguineo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Média de idade para cada tipo sanguíneo'),
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
