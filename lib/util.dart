import 'Bahirehasab.dart';

Iterable<Map<String, dynamic>> getHolidays(int year) {
  var bh = new Bahirehasab.named(year: year);
  var tensae = bh.getSingleBeal("ትንሳኤ");
  var seklet = bh.getSingleBeal("ስቅለት");

  List<Map<String, dynamic>> holidays = [
    {"name": "አዲስ አመት", "month": "መስከረም", "day": 1},
    {"name": "መስቀል", "month": "መስከረም", "day": 17},
    {"name": "መውሊድ", "month": "ጥቅምት", "day": 29},
    {"name": "ገና", "month": "ታኅሳስ", "day": 29},
    {"name": "ጥምቀት", "month": "ጥር", "day": 11},
    {"name": "አደዋ", "month": "የካቲት", "day": 23},
    {"name": "የሰራተኞች ቀን", "month": "ሚያዝያ", "day": 23},
    {"name": "የአርበኞች ቀን", "month": "ሚያዝያ", "day": 27},
    {
      "name": "ትንሳኤ",
      "month": tensae!["month"] as String,
      "day": tensae["date"] as int
    },
    {
      "name": "ስቅለት",
      "month": seklet!["month"] as String,
      "day": seklet["date"] as int
    },
    {"name": "ኢደ አል አደሃ", "month": "ኃምሌ", "day": 23}
  ];

  return holidays;
}

String getHoliday(String? month, int? day, int? year) {
  Iterable<Map<String, dynamic>> holidays = getHolidays(year!);
  for (var i = 0; i < holidays.length; i++) {
    if (holidays.elementAt(i)["month"] == month &&
        holidays.elementAt(i)["day"] == day) {
      return holidays.elementAt(i)["name"];
    }
  }
  return "";
}
