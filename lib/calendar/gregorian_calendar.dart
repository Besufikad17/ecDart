import 'ethiopian_calendar.dart';
import 'package:ecDart/utils/helpers/util.dart';
import 'package:ecDart/utils/constants/strings.dart';

class GregorianCalendar {
  int? year;
  int? month;
  int? day;
  String? monthName;
  String? dayName;

  GregorianCalendar({this.year, this.month, this.day}) {
    this.monthName = ecMonths[(this.month! - 1) % 12];
    this.dayName = gcDays[getDayName(this.month!, this.day!, this.year!)];
  }

  GregorianCalendar.now() {
    this.year = DateTime.now().year;
    this.month = DateTime.now().month;
    this.day = DateTime.now().day;
    this.monthName = ecMonths[(this.month! - 1) % 12];
    this.dayName = gcDays[getDayName(this.month!, this.day!, this.year!)];
  }

  EthiopianCalendar toEc() {
    var datetime = new DateTime(this.year!, this.month!, this.day!);
    var fixed = fixedFromUnix(datetime.millisecondsSinceEpoch);
    var eyear = ((4 * (fixed - ethiopicEpoch) + 1463) ~/ 1461);
    var emonth = (((fixed - fixedFromEthiopic(eyear, 1, 1)) ~/ 30) + 1);
    var eday = fixed + 1 - fixedFromEthiopic(eyear, emonth, 1);
    return new EthiopianCalendar(year: eyear, month: emonth, day: eday);
  }

  GregorianCalendar nextMonth() {
    var isLastMonth = this.month == 12;
    return new GregorianCalendar(
        year: isLastMonth ? this.year! + 1 : this.year,
        month: isLastMonth ? 1 : this.month! + 1,
        day: this.day);
  }

  GregorianCalendar previousMonth() {
    var isFirstMonth = this.month == 1;
    return new GregorianCalendar(
        year: isFirstMonth ? this.year! - 1 : this.year,
        month: isFirstMonth ? 12 : this.month! - 1,
        day: this.day);
  }

  GregorianCalendar nextYear() {
    return GregorianCalendar(
        year: this.year! + 1, month: this.month, day: this.day);
  }

  GregorianCalendar previousYear() {
    return GregorianCalendar(
        year: this.year! - 1, month: this.month, day: this.day);
  }
}
