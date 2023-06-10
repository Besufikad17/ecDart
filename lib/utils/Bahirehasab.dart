import '../calendar/EthiopianCalendar.dart';

const List<String> days = ["ሰኞ", "ማግሰኞ", "ረቡዕ", "ሐሙስ", "አርብ", "ቅዳሜ", "እሁድ"];

const List<String> dayss = ["እሁድ", "ሰኞ", "ማግሰኞ", "ረቡዕ", "ሐሙስ", "አርብ", "ቅዳሜ"];

const List<String?> months = [
  "መስከረም",
  "ጥቅምት",
  "ኅዳር",
  "ታኅሳስ",
  "ጥር",
  "የካቲት",
  "መጋቢት",
  "ሚያዝያ",
  "ግንቦት",
  "ሰኔ",
  "ኃምሌ",
  "ነሐሴ",
  "ጷጉሜን"
];

class Bahirehasab {
  int? year;

  static const List<String> evangelists = ["ዮሐንስ", "ማቴዎስ", "ማርቆስ", "ሉቃስ"];

  List<Map<String, dynamic>> _yeeletTewsak = [
    {"key": "አርብ", "value": 2},
    {"key": "ሐሙስ", "value": 3},
    {"key": "ረቡዕ", "value": 4},
    {"key": "ማግሰኞ", "value": 5},
    {"key": "ሰኞ", "value": 6},
    {"key": "እሁድ", "value": 7},
    {"key": "ቅዳሜ", "value": 8},
  ];

  Map<String, int> _yebealTewsak = {
    "ነነዌ": 0,
    "ዓቢይ ጾም": 14,
    "ደብረ ዘይት": 41,
    "ሆሣዕና": 62,
    "ስቅለት": 67,
    "ትንሳኤ": 69,
    "ርክበ ካህናት": 93,
    "ዕርገት": 108,
    "ጰራቅሊጦስ": 118,
    "ጾመ ሐዋርያት": 119,
    "ጾመ ድህነት": 121,
  };

  static const int ameteFida = 5500;
  static const int tinteAbekte = 11;
  static const int tinteMetkih = 19;

  int get ameteAlem => ameteFida + this.year!;
  int get wenber => ((ameteAlem % 19) - 1) < 0 ? 0 : (ameteAlem % 19) - 1;
  int get abekte => (wenber * tinteAbekte) % 30;
  int get metkih => wenber == 0 ? 30 : (wenber * tinteMetkih) % 30;

  Bahirehasab.named({this.year});

  Bahirehasab() {
    this.year = new EthiopianCalendar().year;
  }

  String getEvangelist({bool returnName = false}) {
    int evangelist;
    evangelist = ameteAlem % 4;
    if (returnName) {
      return evangelists[evangelist];
    }
    return evangelist.toString();
  }

  String getMeskeremOne({bool returnName = false}) {
    int rabeet = ameteAlem ~/ 4;
    int result = (ameteAlem + rabeet) % 7;
    if (returnName) return days[result];
    return result.toString();
  }

  int yebealeMetkihWer() {
    if (metkih > 14) {
      return 1;
    } else {
      return 2;
    }
  }

  Map<String, dynamic> get nenewe {
    String meskerem1 = getMeskeremOne(returnName: true);
    int month = yebealeMetkihWer();
    int date;
    int? dayTewsak;
    _yeeletTewsak.forEach((el) => {
          if (el['key'] == days[(days.indexOf(meskerem1) + metkih - 1) % 7])
            dayTewsak = el['value']
        });
    String monthName = dayTewsak! + metkih > 30 ? 'የካቲት' : 'ጥር';
    if (month == 2) {
      // ጥቅምት
      monthName = 'የካቲት';
      String tikimt1 = days[(days.indexOf(meskerem1) + 2) % 7];
      String metkihElet = days[(days.indexOf(tikimt1) + metkih - 1) % 7];
      _yeeletTewsak.forEach((el) => {
            if (el['key'] == days[days.indexOf(metkihElet)])
              dayTewsak = el['value']
          });
    }
    date = metkih + dayTewsak!;
    return {"month": monthName, "date": date % 30 == 0 ? 30 : date % 30};
  }

  List get allAtswamat {
    Map<String, dynamic> mebajaHamer = nenewe;
    List result = [];
    _yebealTewsak.forEach((beal, numOfDays) {
      result.add({
        "beal": beal,
        "day": {
          "month": months[months.indexOf(mebajaHamer['month']) +
              (mebajaHamer['date'] + numOfDays) ~/ 30 as int],
          "date": (mebajaHamer['date'] + numOfDays) % 30 == 0
              ? 30
              : (mebajaHamer['date'] + numOfDays) % 30
        }
      });
    });
    return result;
  }

  bool isMovableHoliday(String holidayName) {
    if (_yebealTewsak.keys.contains(holidayName)) {
      return true;
    } else {
      throw new Exception("Invalid beal name!!");
    }
  }

  Map<String, dynamic>? getSingleBeal(String holiday_name) {
    Map<String, dynamic>? beal;
    try {
      bool status = isMovableHoliday(holiday_name);
      if (status) {
        Map<String, dynamic> mebajaHamer = nenewe;
        int? target = _yebealTewsak[holiday_name];
        beal = {
          "month": months[months.indexOf(mebajaHamer['month']) +
              ((mebajaHamer['date'] + target) ~/ 30) as int],
          "date": (mebajaHamer['date'] + target) % 30 == 0
              ? 30
              : (mebajaHamer['date'] + target) % 30
        };
      }
    } catch (e) {
      print(e.toString());
    }
    return beal;
  }
}
