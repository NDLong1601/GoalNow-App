import 'package:goalnow_app/core/enum/enum.dart';
import 'package:goalnow_app/core/network/api_endpoint.dart';

extension TopPlayerTabX on TopPlayerTab {
  String get endpoint {
    switch (this) {
      case TopPlayerTab.goal:
        return ApiEndpoint.topGoal;
      case TopPlayerTab.assist:
        return ApiEndpoint.topAssist;
    }
  }

  String get label {
    switch (this) {
      case TopPlayerTab.goal:
        return 'Goals';
      case TopPlayerTab.assist:
        return 'Assists';
    }
  }
}
