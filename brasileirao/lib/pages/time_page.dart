import 'package:apibrasileirao/models/titulo.dart';
import 'package:flutter/material.dart';

import 'package:apibrasileirao/models/time.dart';
import 'package:provider/provider.dart';

import 'add_titulo_page.dart';

// ignore: must_be_immutable
class TimePage extends StatefulWidget {
  Time time;
  TimePage({
    Key? key,
    required this.time,
  }) : super(key: key);

  @override
  _TimePageState createState() => _TimePageState();
}

class _TimePageState extends State<TimePage> {
  void tituloPage() {
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (_) =>
                // ignore: unnecessary_this
                AddTituloPage(
                  time: widget.time,
                )));
  }



  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          actions: [
            IconButton(
                onPressed: () {
                  tituloPage();
                },
                icon: const Icon(Icons.add))
          ],
          // ignore: cast_nullable_to_non_nullable
          backgroundColor: widget.time.cor as Color,
          title: Text(widget.time.nome),
          centerTitle: true,
          bottom: const TabBar(
            tabs: [
              Tab(
                icon: Icon(Icons.stacked_line_chart),
                text: 'Estatísticas',
              ),
              Tab(
                icon: Icon(Icons.emoji_events),
                text: 'Titulos',
              )
            ],
            indicatorColor: Colors.white,
          ),
        ),
        body: TabBarView(
          children: [
            Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(40),
                  child: Image.network(
                    widget.time.brasao,
                    fit: BoxFit.cover,
                  ),
                ),
                Text(
                  "Pontos: ${widget.time.pontos}",
                  style: const TextStyle(fontSize: 28),
                )
              ],
            ),
            titulos()
          ],
        ),
      ),
    );
  }

  Widget titulos() {

    final time =  Provider.of(context).times.firstWhere((t) => t.nome == widget.time.nome);
    final quantidade = time.titulos.length;

    return quantidade == 0
        // ignore: avoid_unnecessary_containers
        ? Container(
            child: const Center(child: Text('Nenhum Título ainda!')),
          )
        : ListView.separated(
            itemBuilder: (BuildContext context, int index) {
              return ListTile(
                leading: const Icon(Icons.emoji_events),
                title: Text(time.titulos  [index].campeonato),
                trailing: Text(time.titulos  [index].ano) ,
              );
            },
            separatorBuilder: (_, __) => const Divider(),
            itemCount: quantidade);
  }
}
