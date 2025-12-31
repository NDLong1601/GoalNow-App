import 'package:goalnow_app/core/enum/enum.dart';
import 'package:goalnow_app/model/player/top_stat_player.dart';
import 'package:goalnow_app/service/api/top_player_service.dart';

class TopPlayerRepository {
  final TopPlayerService service;
  TopPlayerRepository(this.service);

  Future<List<TopStatPlayerModel>> getTopPlayers({
    required TopPlayerTab tab,
    required int leagueId,
  }) async {
    final res = await service.getTopPlayers(tab: tab, leagueId: leagueId);
    final List list = res['response']['players'];
    return list.map((e) => TopStatPlayerModel.fromJson(e)).toList();
  }
}
