import './GregorianCalender.dart';
import './Bahirehasab.dart';
import './util.dart';

class EthiopianCalender {
  int? year;
  int? month;
  int? day;
  String? holiday_name;
  bool isHoliday = false;
  String? month_name;

  EthiopianCalender({this.year, this.month, this.day}) {
    this.month_name = months[this.month! - 1];
    this.holiday_name =
        getHoliday(months[this.month! - 1], this.day, this.year);
    this.isHoliday = holiday_name != "" ? true : false;
  }

  EthiopianCalender.now() {
    var fixed = fixedFromUnix(DateTime.now().millisecondsSinceEpoch);
    this.year = ((4 * (fixed - ethiopicEpoch) + 1463) ~/ 1461);
    this.month = (((fixed - fixedFromEthiopic(this.year!, 1, 1)) ~/ 30) + 1);
    this.day = fixed + 1 - fixedFromEthiopic(this.year!, this.month!, 1);
    this.month_name = months[(this.month! - 1) % 13];
    this.holiday_name =
        getHoliday(months[this.month! - 1], this.day, this.year);
    this.isHoliday = holiday_name != "" ? true : false;
  }

  GregorianCalender toGC() {
    var ec = new EthiopianCalender();
    // TODO: Implement convertor
    return new GregorianCalender();
  }

  EthiopianCalender nextMonth() {
    var isLastMonth = this.month == 13 || (this.month == 12 && this.day! > 6);
    return new EthiopianCalender(
        year: isLastMonth ? this.year! + 1 : this.year,
        month: isLastMonth ? 1 : this.month! + 1,
        day: this.day);
  }

  EthiopianCalender previousMonth() {
    var isFirstMonth = this.month == 1;
    return new EthiopianCalender(
        year: isFirstMonth ? this.year! - 1 : this.year,
        month: isFirstMonth ? (this.day! > 6 ? 12 : 13) : this.month! - 1,
        day: this.day);
  }

  EthiopianCalender nextYear() {
    return EthiopianCalender(
        year: this.year! + 1, month: this.month, day: this.day);
  }

  EthiopianCalender previousYear() {
    return EthiopianCalender(
        year: this.year! - 1, month: this.month, day: this.day);
  }
}
