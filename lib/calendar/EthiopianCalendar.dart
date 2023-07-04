import 'GregorianCalendar.dart';
import '../utils/Bahirehasab.dart';
import '../utils/util.dart';

class EthiopianCalendar {
  int? year;
  int? month;
  int? day;
  String? holiday_name;
  bool isHoliday = false;
  String? month_name;
  String? day_name;

  EthiopianCalendar({this.year, this.month, this.day}) {
    this.month_name = months[this.month! - 1];
    this.holiday_name =
        getHoliday(months[this.month! - 1], this.day, this.year);
    this.isHoliday = holiday_name != "" ? true : false;

    var gc = toGC2(this.year!, this.month!, this.day!);
    this.day_name = dayss[getDayName(gc.month, gc.day, gc.year)];
  }

  EthiopianCalendar.now() {
    var fixed = fixedFromUnix(DateTime.now().millisecondsSinceEpoch);
    this.year = ((4 * (fixed - ethiopicEpoch) + 1463) ~/ 1461);
    this.month = (((fixed - fixedFromEthiopic(this.year!, 1, 1)) ~/ 30) + 1);
    this.day = fixed + 1 - fixedFromEthiopic(this.year!, this.month!, 1);
    this.month_name = months[(this.month! - 1) % 13];
    this.holiday_name =
        getHoliday(months[this.month! - 1], this.day, this.year);
    this.isHoliday = holiday_name != "" ? true : false;

    var gc = this.toGC();
    this.day_name = dayss[getDayName(gc.month, gc.day, gc.year)];
  }

  GregorianCalendar toGC() {
    return new GregorianCalendar(
        year: DateTime.fromMillisecondsSinceEpoch(
                dateToEpoch(this.year!, this.month!, this.day!))
            .year,
        month: DateTime.fromMillisecondsSinceEpoch(
                dateToEpoch(this.year!, this.month!, this.day!))
            .month,
        day: DateTime.fromMillisecondsSinceEpoch(
                dateToEpoch(this.year!, this.month!, this.day!))
            .day);
  }

  EthiopianCalendar nextMonth() {
    var isLastMonth = this.month == 13 || (this.month == 12 && this.day! > 6);
    return new EthiopianCalendar(
        year: isLastMonth ? this.year! + 1 : this.year,
        month: isLastMonth ? 1 : this.month! + 1,
        day: this.day);
  }

  EthiopianCalendar previousMonth() {
    var isFirstMonth = this.month == 1;
    return new EthiopianCalendar(
        year: isFirstMonth ? this.year! - 1 : this.year,
        month: isFirstMonth ? (this.day! > 6 ? 12 : 13) : this.month! - 1,
        day: this.day);
  }

  EthiopianCalendar nextYear() {
    return EthiopianCalendar(
        year: this.year! + 1, month: this.month, day: this.day);
  }

  EthiopianCalendar previousYear() {
    return EthiopianCalendar(
        year: this.year! - 1, month: this.month, day: this.day);
  }
}
