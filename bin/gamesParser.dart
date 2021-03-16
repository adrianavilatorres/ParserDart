import 'dart:io' as output;
import 'package:filmparser/parser/gameParser.dart';

void main(List<String> arguments) async {
  var parser = GamesParser();
  var games = await parser.getTopGameList();
  String ruta = "juegos.txt";
  var file = new output.File(ruta);
  var salida = file.openWrite();
  games.forEach((game) {
    print('Insertando ${game.nombre}');
    salida.write(
        'NOMBRE DEL JUEGO: ${game.nombre}, PLATAFORMA: ${game.plataforma}, RANKING: ${game.puesto}, PUNTUACION: ${game.puntuacion},\n');
  });
  salida.close();
}
