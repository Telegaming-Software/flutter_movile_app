import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:tg_softwareapp/models/gamer.dart';
import 'package:tg_softwareapp/services/general_service.dart';

class GamerService extends GeneralService {
  Future<Gamer> loginGamer(String email, String password) async {
    final response = await http.post(Uri.parse(url + 'players/login'),
        body: jsonEncode({
          'email': email,
          'password': password,
        }),
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
        });

    if (response.statusCode == 200) {
      final Map<String, dynamic> jsonResponse = json.decode(response.body);
      final Gamer gamer = Gamer.fromJson(jsonResponse);
      return gamer;
    } else {
      throw Exception('Failed to load gamer');
    }
  }

  Future<Gamer> registerGamer(
      String name, String email, String password, String birthDate) async {
    final response = await http.post(Uri.parse(url + 'players'),
        body: jsonEncode({
          "name": name,
          "email": email,
          "password": password,
          "birthDate": birthDate,
          "balance": 0.00
        }),
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
        });

    if (response.statusCode == 200) {
      final Map<String, dynamic> jsonResponse = json.decode(response.body);
      final Gamer gamer = Gamer.fromJson(jsonResponse);
      return gamer;
    } else {
      print(response);
      throw Exception('Failed to load gamer');
    }
  }
}
