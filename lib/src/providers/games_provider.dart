import 'package:flutter_peliculas/src/models/game_model.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class GamesProvider{
  String _url = 'api.rawg.io';


Future<List<Game>> _procesarRespuesta(Uri url) async {
    final resp = await http.get(url);
    final decodedData = json.decode(resp.body);
    final games = Games.fromJsonList(decodedData['results']);
    return games.items;
  }

  Future<List<Game>> getMasEsperados() async {
    final url = Uri.https(
      _url,
      'api/games',
      {
        'dates' : '2019-10-10,2020-10-10',
        'ordering' : '-added',
      }
    );
      
    return await _procesarRespuesta(url);
  }
}