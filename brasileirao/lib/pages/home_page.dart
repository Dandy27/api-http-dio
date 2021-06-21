import 'package:apibrasileirao/pages/home_controller.dart';
import 'package:apibrasileirao/pages/time_page.dart';
import 'package:apibrasileirao/repositores/time_repositores.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  HomeController controller = HomeController(TimesRepository());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Brasileirão',
          style: TextStyle(fontSize: 20),
        ),
        centerTitle: true,
      ),
      body: Consumer<TimesRepository>(
        builder: (context, repositorio, child) {
          return ListView.separated(
              itemBuilder: (BuildContext context, int index) {
                final tabela = repositorio.times;
                return ListTile(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (_) => TimePage(
                                  key: Key(tabela[index].nome),
                                  time: tabela[index],
                                )));
                  },
                  leading: Image.network(tabela[index].brasao),
                  title: Text(tabela[index].nome),
                  trailing: Text(tabela[index].pontos.toString()),
                );
              },
              separatorBuilder: (_, __) => const Divider(),
              itemCount: repositorio.times.length);
        },
      ),
    );
  }
}
