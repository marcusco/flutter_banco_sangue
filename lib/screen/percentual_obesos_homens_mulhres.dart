import 'package:flutter/material.dart';

class PercentualObesosHomensMulhres extends StatelessWidget {
  const PercentualObesosHomensMulhres({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Percentual de obesos entre os homens e mulheres'),
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
