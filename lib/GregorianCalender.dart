import './EthiopianCalender.dart';
import './util.dart';

const List<String> _months = [
  "January",
  "Feburary",
  "March",
  "April",
  "May",
  "June",
  "July",
  "August",
  "September",
  "October",
  "November",
  "December"
];

class GregorianCalender {
  int? year;
  int? month;
  int? day;
  String? month_name;
  String? day_name;

  GregorianCalender({this.year, this.month, this.day}) {
    this.month_name = _months[(this.month! - 1) % 12];
    this.day_name = getDayName(this.month!, this.day!, this.year!);
  }

  GregorianCalender.now() {
    this.year = DateTime.now().year;
    this.month = DateTime.now().month;
    this.day = DateTime.now().day;
    this.month_name = _months[(this.month! - 1) % 12];
    this.day_name = getDayName(this.month!, this.day!, this.year!);
  }

  EthiopianCalender toEc() {
    var datetime = new DateTime(this.year!, this.month!, this.day!);
    var fixed = fixedFromUnix(datetime.millisecondsSinceEpoch);
    var eyear = ((4 * (fixed - ethiopicEpoch) + 1463) ~/ 1461);
    var emonth = (((fixed - fixedFromEthiopic(eyear, 1, 1)) ~/ 30) + 1);
    var eday = fixed + 1 - fixedFromEthiopic(eyear, emonth, 1);
    return new EthiopianCalender(year: eyear, month: emonth, day: eday);
  }

  GregorianCalender nextMonth() {
    var isLastMonth = this.month == 12;
    return new GregorianCalender(
        year: isLastMonth ? this.year! + 1 : this.year,
        month: isLastMonth ? 1 : this.month! + 1,
        day: this.day);
  }

  GregorianCalender previousMonth() {
    var isFirstMonth = this.month == 1;
    return new GregorianCalender(
        year: isFirstMonth ? this.year! - 1 : this.year,
        month: isFirstMonth ? 12 : this.month! - 1,
        day: this.day);
  }

  GregorianCalender nextYear() {
    return GregorianCalender(
        year: this.year! + 1, month: this.month, day: this.day);
  }

  GregorianCalender previousYear() {
    return GregorianCalender(
        year: this.year! - 1, month: this.month, day: this.day);
  }
}
