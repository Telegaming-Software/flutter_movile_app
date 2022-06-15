import 'package:http/http.dart' as http;
import 'package:tg_softwareapp/models/game_model.dart';
import 'dart:convert';
import 'package:tg_softwareapp/services/general_service.dart';

class GameService extends GeneralService {
  Future<List<Game>> getAllGames() async {
    final response = await http.get(Uri.parse(url + 'games'), headers: {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
    });

    if (response.statusCode == 200) {
      final Map<String, dynamic> jsonResponse = json.decode(response.body);
      final List<Game> games = jsonResponse['content']
          .map<Game>((json) => Game.fromJson(json))
          .toList();
      return games;
    } else {
      throw Exception('Failed to load games');
    }
  }
}
