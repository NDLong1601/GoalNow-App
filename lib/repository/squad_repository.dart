import 'package:goalnow_app/model/player/player_squad.dart';
import 'package:goalnow_app/service/api/squad_service.dart';

class SquadRepository {
  final SquadService service;

  SquadRepository(this.service);

  Future<Map<String, List<SquadPlayerModel>>> getSquad(
    int teamId,
  ) async {
    final res = await service.getSquad(teamId: teamId);

    final List sections = res['response']['list'];

    final Map<String, List<SquadPlayerModel>> result = {};

    for (final section in sections) {
      final String title = section['title'];
      final List members = section['members'];

      result[title] = members
          .map((e) => SquadPlayerModel.fromJson(e))
          .toList();
    }

    return result;
  }
}
