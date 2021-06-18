import 'package:flutter/material.dart';

import 'package:apibrasileirao/models/time.dart';
import 'package:apibrasileirao/models/titulo.dart';

// ignore: must_be_immutable
class AddTituloPage extends StatefulWidget {
  Time time;
  ValueChanged<Titulo> onSave;
  AddTituloPage({
    Key? key,
    required this.time,
    required this.onSave,
  }) : super(key: key);

  @override
  _AddTituloPageState createState() => _AddTituloPageState();
}

class _AddTituloPageState extends State<AddTituloPage> {
  final _campeonato = TextEditingController();
  final _ano = TextEditingController();
  final _formyKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Titulo'),
        centerTitle: true,
      ),
      body: Form(
        key: _formyKey,
        child: Column(
          // ignore: avoid_redundant_argument_values
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(24),
              child: TextFormField(
                controller: _ano,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: "Ano",
                ),
                keyboardType: TextInputType.number,
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Informe o ano do título!';
                  }
                },
              ),
            ),
            Padding(
              padding:const  EdgeInsets.symmetric(vertical: 12, horizontal: 24),
              child: TextFormField(
                controller: _campeonato,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: "Campeonato",
                ),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Informe qual é o Campeonato!';
                  }
                  return null;
                },
              ),
            ),
            Expanded(
                child: Container(
              alignment: Alignment.bottomCenter,
              margin: const EdgeInsets.all(24),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                    primary: Colors.blueAccent, padding: const EdgeInsets.all(16)),
                onPressed: () {
                  if (_formyKey.currentState!.validate()) {
                    widget.onSave(
                        Titulo(ano: _ano.text, campeonato: _campeonato.text));
                  }
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  // ignore: prefer_const_literals_to_create_immutables
                  children: [
                   const Icon(Icons.check),
                    const  SizedBox(
                      width: 10,
                    ),
                    // Padding(padding: EdgeInsets.symmetric(vertical: 16)),
                     const Text(
                      "Salvar",
                      style:  TextStyle(fontSize: 20),
                    ),
                  ],
                ),
              ),
            ))
          ],
        ),
      ),
    );
  }
}
