import 'package:apibrasileirao/pages/home_controller.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  var controller = HomeController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Brasileirão',
          style: TextStyle(fontSize: 28),
        ),
        centerTitle: true,
      ),
      body: ListView.separated(
          itemBuilder: (BuildContext context, int index) {
            final tabela = controller.tabela;
            return ListTile(
              leading: Image.network(tabela[index].brasao),
              title: Text(tabela[index].nome),
              trailing: Text(tabela[index].pontos.toString()),
            );
          },
          separatorBuilder: (_, __) => Divider(),
          itemCount: controller.tabela.length),
    );
  }
}
