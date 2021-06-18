

import 'package:apibrasileirao/models/titulo.dart';
import 'package:flutter/painting.dart';

class Time {
  // int id;
  String nome;
  String brasao;
  int pontos;
  Color? cor;
  int idAPI;
  List<Titulo> titulos = [];

  Time({
    // required this.id,
    required this.brasao,
    required this.nome,
    required this.pontos,
    required this.cor,
    required this.titulos,
    required this.idAPI,
  });
}
