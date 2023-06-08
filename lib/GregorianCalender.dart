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
    // TODO: Implement cocnvertor
    return new EthiopianCalender();
  }

  GregorianCalender nextMonth() {
    var isNewYear = this.month == 12;
    return new GregorianCalender.named(
        year: isNewYear ? this.year! + 1 : this.year,
        month: isNewYear ? 1 : this.month,
        day: this.day);
  }

  GregorianCalender previousMonth() {
    return new GregorianCalender.named();
  }

  GregorianCalender nextYear() {
    return GregorianCalender.named();
  }

  GregorianCalender previousYear() {
    return GregorianCalender.named();
  }
}
