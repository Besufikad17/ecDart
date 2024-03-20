import 'gregorian_calendar.dart';
import 'package:ecDart/utils/helpers/util.dart';
import 'package:ecDart/utils/constants/strings.dart';

class EthiopianCalendar {
  int? year;
  int? month;
  int? day;
  String? holidayName;
  bool isHoliday = false;
  String? monthName;
  String? dayName;

  EthiopianCalendar({this.year, this.month, this.day}) {
    this.monthName = ecMonths[this.month! - 1];
    this.holidayName =
        getHoliday(ecMonths[this.month! - 1], this.day, this.year);
    this.isHoliday = holidayName != "" ? true : false;

    var gc = toGC2(this.year!, this.month!, this.day!);
    this.dayName = ecDayss[getDayName(gc.month, gc.day, gc.year)];
  }

  EthiopianCalendar.now() {
    var fixed = fixedFromUnix(DateTime.now().millisecondsSinceEpoch);
    this.year = ((4 * (fixed - ethiopicEpoch) + 1463) ~/ 1461);
    this.month = (((fixed - fixedFromEthiopic(this.year!, 1, 1)) ~/ 30) + 1);
    this.day = fixed + 1 - fixedFromEthiopic(this.year!, this.month!, 1);
    this.monthName = ecMonths[(this.month! - 1) % 13];
    this.holidayName =
        getHoliday(ecMonths[this.month! - 1], this.day, this.year);
    this.isHoliday = holidayName != "" ? true : false;

    var gc = this.toGC();
    this.dayName = ecDayss[getDayName(gc.month, gc.day, gc.year)];
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

  List<EthiopianCalendar> getMonth() {
    List<EthiopianCalendar> ecs = [];

    for (int i = 1; i < 31; i++) {
      ecs.add(EthiopianCalendar(year: this.year, month: this.month, day: i));
    }
    return ecs;
  }
}
