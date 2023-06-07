import 'Bahirehasab.dart';

Iterable<Map<String, Map<String, dynamic>>> getHolidays(int year) {
  var bh = new Bahirehasab.named(year: year);
  var tensae = bh.getSingleBeal("ትንሳኤ");
  var seklet = bh.getSingleBeal("ስቅለት");

  List<Map<String, Map<String, dynamic>>> holidays = [
    {
      "አዲስ አመት": {"month": "መስከረም", "day": 1},
    },
    {
      "መስቀል": {"month": "መስከረም", "day": 17},
    },
    {
      "አዲስ አመት": {"month": "ጥቅምት", "day": 29},
    },
    {
      "ገና": {"month": "ታኅሳስ", "day": "29"},
    },
    {
      "ጥምቀት": {"month": "ጥር", "day": 11}
    },
    {
      "አደዋ": {"month": "የካቲት", "day": 23}
    },
    {
      "የሰራተኞች ቀን": {"month": "ሚያዝያ", "day": 23}
    },
    {
      "የአርበኞች ቀን": {"month": "ሚያዝያ", "day": 27}
    },
    {
      "ትንሳኤ": {
        "month": tensae!["month"] as String,
        "day": tensae["date"] as int
      },
    },
    {
      "ስቅለት": {
        "month": seklet!["month"] as String,
        "day": seklet["date"] as int
      }
    },
    {
      "ኢደ አል አደሃ": {"month": "ኃምሌ", "day": 23}
    },
  ];

  return holidays;
}
