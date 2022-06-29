import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:tg_softwareapp/models/material_training_model.dart';
import 'package:tg_softwareapp/services/general_service.dart';

class MaterialTrainingService extends GeneralService {
  Future<List<TrainingMaterial>> getById({required int gameId}) async {
    final response = await http.get(
        Uri.parse(
            url + 'trainingMaterials/game/' + gameId.toString() + '/trainings'),
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
        });

    if (response.statusCode == 200) {
      final Map<String, dynamic> jsonResponse = json.decode(response.body);
      final List<TrainingMaterial> materials = jsonResponse['content']
          .map<TrainingMaterial>((json) => TrainingMaterial.fromJson(json))
          .toList();
      return materials;
    } else {
      throw Exception('Failed to load games');
    }
  }

  Future<List<TrainingMaterial>> getByGamer(int gamerId) async {
    final response = await http.get(
        Uri.parse(url + 'trainingMaterials/player/' + gamerId.toString()),
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
        });
    if (response.statusCode == 200) {
      final Map<String, dynamic> jsonResponse = json.decode(response.body);
      final List<TrainingMaterial> materials = jsonResponse['content']
          .map<TrainingMaterial>((json) => TrainingMaterial.fromJson(json))
          .toList();
      return materials;
    } else {
      throw Exception('Failed to load games');
    }
  }

  Future<List<TrainingMaterial>> getByCoach(int coachId) async {
    final response = await http.get(
        Uri.parse(url +
            'trainingMaterials/coach/' +
            coachId.toString() +
            '/trainings'),
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
        });
    if (response.statusCode == 200) {
      final Map<String, dynamic> jsonResponse = json.decode(response.body);
      final List<TrainingMaterial> materials = jsonResponse['content']
          .map<TrainingMaterial>((json) => TrainingMaterial.fromJson(json))
          .toList();
      return materials;
    } else {
      throw Exception('Failed to load games');
    }
  }

  Future<TrainingMaterial> addMaterial(
      {required String title,
      required String trainingDescription,
      required double value,
      required String trainingCoverUri,
      required int gameId,
      required int coachId}) async {
    final response =
        await http.post(Uri.parse(url + 'trainingMaterials/$gameId'),
            headers: {
              'Content-Type': 'application/json',
              'Accept': 'application/json',
            },
            body: json.encode({
              'title': title,
              'trainingDescription': trainingDescription,
              'trainingCoverUri': trainingCoverUri,
              'value': value,
            }));
    if (response.statusCode == 200) {
      final Map<String, dynamic> jsonResponse = json.decode(response.body);
      final TrainingMaterial material = TrainingMaterial.fromJson(jsonResponse);
      final anotherResponse = await http.put(
          Uri.parse(url +
              'trainingMaterials/' +
              material.trainingMaterialId.toString() +
              ',/coach/' +
              coachId.toString()),
          headers: {
            'Content-Type': 'application/json',
            'Accept': 'application/json',
          });
      if (anotherResponse.statusCode == 200) {
        final Map<String, dynamic> jsonAnotherResponse =
            json.decode(anotherResponse.body);
        final TrainingMaterial anotherMaterial =
            TrainingMaterial.fromJson(jsonAnotherResponse);
        return anotherMaterial;
      } else {
        throw Exception('Failed to load games second service');
      }
    } else {
      throw Exception('Failed to load games first service');
    }
  }
}
