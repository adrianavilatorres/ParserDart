import 'package:filmparser/models/game.dart';
import 'package:filmparser/parser/game.dart';
import 'package:http/http.dart' as http;
import 'package:html/parser.dart';

class GamesParser implements Games {
  static const domain = 'vandal.elespanol.com';
  static const topUrl = 'rankings/videojuegos';

  _getTopGamesUrl() => Uri.http(domain, topUrl);

  @override
  Future<List<Game>> getTopGameList() async {
    var games = <Game>[];
    var url = _getTopGamesUrl();
    var response = await http.get(url);
    if (response.statusCode == 200) {
      var document = parse(response.body);
      var gamesHref = document.querySelectorAll('table.table');
      for (var anchor in gamesHref) {
        String nombre, plataforma, puesto, puntuacion;

        nombre = anchor.querySelector('td.ta14b a').innerHtml;
        print(nombre);

        plataforma = anchor.querySelector('td.ta14b span').innerHtml;
        print(plataforma);

        puesto = anchor.querySelector('div.tcenter b').innerHtml;
        print(puesto);

        puntuacion = anchor.querySelector('div.fleft_desktop a').innerHtml;
        print(puntuacion);

        games.add(Game(nombre.trim(), plataforma.trim(), puesto.trim(),
            puntuacion.trim()));
      }
    }
    return games;
  }

  @override
  Future<Game> gameParse(String url) async {}
}
