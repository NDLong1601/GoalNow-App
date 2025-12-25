import 'package:add_2_calendar/add_2_calendar.dart';
import 'package:goalnow_app/model/match/match.dart';


/// Helper class for calendar operations
class CalendarHelper {
  /// Add match to calendar
  static void addMatchToCalendar(MatchModel match) {
    final event = Event(
      title: '${match.home.name} vs ${match.away.name}',
      description: 'Football match',
      location: 'Football Stadium',
      startDate: match.time,
      endDate: match.time.add(const Duration(hours: 2)),
    );
    // Add event to calendar
    Add2Calendar.addEvent2Cal(event);
  }
}
