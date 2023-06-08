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

  EthiopianCalender.named({this.year, this.month, this.day}) {
    this.month_name = months[this.month! - 1];
    this.holiday_name =
        getHoliday(months[this.month! - 1], this.day, this.year);
    this.isHoliday = holiday_name != "" ? true : false;
  }

  EthiopianCalender() {
    var gc = new GregorianCalender();
    var ec = gc.toEc();

    this.year = ec.year;
    this.month = ec.month;
    this.day = ec.day;
    this.month_name = months[this.month! - 1];
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
    var isNewYear = this.month == 13 || (this.month == 12 && this.day! > 6);
    return new EthiopianCalender.named(
        year: isNewYear ? this.year! + 1 : this.year,
        month: isNewYear ? 1 : this.month! + 1,
        day: this.day);
  }

  EthiopianCalender previousMonth() {
    return new EthiopianCalender.named();
  }

  EthiopianCalender nextYear() {
    return EthiopianCalender.named();
  }

  EthiopianCalender previousYear() {
    return EthiopianCalender.named();
  }
}
