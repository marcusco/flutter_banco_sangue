import 'package:flutter/material.dart';

class TipoSanguineoScreen extends StatefulWidget {
  const TipoSanguineoScreen({super.key});

  @override
  State<TipoSanguineoScreen> createState() => _TipoSanguineoScreenState();
}

class _TipoSanguineoScreenState extends State<TipoSanguineoScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Tipo Sanguíneo"),
        titleTextStyle: const TextStyle(
            color: Colors.red, fontSize: 20, fontWeight: FontWeight.bold),
      ),
      body: Card(
        child: Row(
          children: [
            Text("Tipo Sanguíneo",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: const Icon(Icons.add),
      ),
    );
  }
}
