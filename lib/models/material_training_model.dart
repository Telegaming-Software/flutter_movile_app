import 'package:tg_softwareapp/models/game_model.dart';

class TrainingMaterial {
  int? trainingMaterialId;
  String? title;
  String? trainingDescription;
  String? trainingCoverUri;
  Game? game;

  TrainingMaterial(
      {this.trainingMaterialId,
      this.title,
      this.trainingDescription,
      this.trainingCoverUri,
      this.game});

  TrainingMaterial.fromJson(Map<String, dynamic> json) {
    trainingMaterialId = json['trainingMaterialId'];
    title = json['title'];
    trainingDescription = json['trainingDescription'];
    trainingCoverUri = json['trainingCoverUri'];
    game = json['game'] != null ? Game.fromJson(json['game']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['trainingMaterialId'] = trainingMaterialId;
    data['title'] = title;
    data['trainingDescription'] = trainingDescription;
    data['trainingCoverUri'] = trainingCoverUri;
    if (game != null) {
      data['game'] = game!.toJson();
    }
    return data;
  }
}
