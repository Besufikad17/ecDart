import 'Bahirehasab.dart';

const int ethiopicEpoch = 2796;
const int unixEpoch = 719163;
const int dayMilliSec = 86400000;

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

int getGreatestMultiple(int n, int x) {
  var multiple = n;
  var multiplier = -1;
  while (true) {
    if (multiple < x) {
      break;
    }
    multiple = n * multiplier;
    multiplier--;
  }
  return multiple;
}

int getDayName(int? month, int? day, int? year) {
  month = month! > 2 ? month - 2 : month + 10;
  var D = int.parse(year.toString().substring(2, 4));
  var C = int.parse(year.toString().substring(0, 2));
  var F =
      (day! + (((13 * month) - 1) / 5) + D + (D / 4) + (C / 4) - 2 * C).toInt();
  if (F < 0) {
    var r = F - getGreatestMultiple(7, F);
    return r;
  } else {
    return F % 7;
  }
}

int fixedFromUnix(int ms) => (unixEpoch + (ms ~/ 86400000));

int fixedFromEthiopic(int year, int month, int day) {
  return (ethiopicEpoch -
      1 +
      365 * (year - 1) +
      (year ~/ 4) +
      30 * (month - 1) +
      day);
}

int dateToEpoch(int year, int month, int day) {
  return (fixedFromEthiopic(year, month, day) - unixEpoch) * dayMilliSec;
}
