import 'package:ecDart/calendar/ethiopian_calendar.dart';
import 'package:ecDart/utils/constants/strings.dart';

class Bahirehasab {
  int? year;

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
    if (returnName) return ecDays[result];
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
    int meskerem1 = int.parse(getMeskeremOne(returnName: false));
    int month = yebealeMetkihWer();
    int date;
    int? dayTewsak;
    yeeletTewsak.forEach((el) {
          if (el['key'] == ecDays[(meskerem1 + metkih - 1) % 7])
            dayTewsak = el['value'];
        });
    String monthName = dayTewsak! + metkih > 30 ? 'የካቲት' : 'ጥር';
    if (month == 2) {
      // ጥቅምት
      monthName = 'የካቲት';
      int tikimt1 = (meskerem1 + 2) % 7;
      int metkihElet = (tikimt1 + metkih - 1) % 7;
      yeeletTewsak.forEach((el) {
            if (el['key'] == ecDays[metkihElet])
              dayTewsak = el['value'];
          });
    }
    date = metkih + dayTewsak!;
    return {"month": monthName, "date": date % 30 == 0 ? 30 : date % 30};
  }

  List get allAtswamat {
    Map<String, dynamic> mebajaHamer = nenewe;
    List result = [];
    yebealTewsak.forEach((beal, numOfDays) {
      result.add({
        "beal": beal,
        "day": {
          "month": ecMonths[ecMonths.indexOf(mebajaHamer['month']) +
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
    if (yebealTewsak.keys.contains(holidayName)) {
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
        int? target = yebealTewsak[holiday_name];
        beal = {
          "month": ecMonths[ecMonths.indexOf(mebajaHamer['month']) +
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
