import '../models/game.dart';

abstract class Games {
  Future<List<Game>> getTopGameList();
  Future<Game> gameParse(String url);
}
