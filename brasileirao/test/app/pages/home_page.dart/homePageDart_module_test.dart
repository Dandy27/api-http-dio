import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_modular_test/flutter_modular_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:apibrasileirao/app/pages/home_page.dart/homePageDart_module.dart';
 
void main() {

  setUpAll(() {
    initModule(HomePageDartModule());
  });
}