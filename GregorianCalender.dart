import './EthiopianCalender.dart';

class GregorianCalender {
  int? year;
  int? month;
  int? day;
  bool? isHoliday;

  GregorianCalender.named({this.year, this.month, this.day});

  GregorianCalender() {
    this.year = DateTime.now().year;
    this.month = DateTime.now().month;
    this.day = DateTime.now().day;
    this.isHoliday = false;
  }

  EthiopianCalender toEc() {
    var gc = new GregorianCalender();

    return new EthiopianCalender();
  }
}
