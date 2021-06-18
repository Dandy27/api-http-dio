import 'package:apibrasileirao/models/time.dart';
import 'package:apibrasileirao/repositores/time_repositores.dart';

class HomeController {
  TimesRepository timesRepository;

  List<Time> get tabela => timesRepository.times;

  HomeController(
    this.timesRepository,
  );
}
