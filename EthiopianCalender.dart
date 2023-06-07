import './GregorianCalender.dart';

class EthiopianCalender {
  int? year;
  int? month;
  int? day;
  bool? isHoliday;
  String? holiday_name;
  String? month_name;

  static const List<String> days = [
    "ሰኞ",
    "ማግሰኞ",
    "ረቡዕ",
    "ሐሙስ",
    "አርብ",
    "ቅዳሜ",
    "እሁድ",
  ];

  EthiopianCalender.named({this.year, this.month, this.day}) {
    this.month_name = days[this.day! - 1];
  }

  EthiopianCalender() {
    var gc = new GregorianCalender();
    var ec = gc.toEc();

    this.year = DateTime.now().year;
    this.month = DateTime.now().month;
    this.day = DateTime.now().day;
    this.isHoliday = false;
  }

  GregorianCalender toGC() {
    var ec = new EthiopianCalender();
    return new GregorianCalender();
  }

  EthiopianCalender nextMonth() {
    return new EthiopianCalender.named();
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
