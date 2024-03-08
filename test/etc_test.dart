import 'package:ecDart/calendar/ethiopian_calendar.dart';
import 'package:test/test.dart';

void main() {
  test('testing EthiopianCalendar constructors', () {
    var ec = new EthiopianCalendar(year: 2015, month: 1, day: 1);
    expect(ec.month_name, "መስከረም");
    expect(ec.isHoliday, true);
    expect(ec.holiday_name, "አዲስ አመት");

    var now = new EthiopianCalendar.now();
    expect(now.year, 2015);
    expect(now.month_name, "ሰኔ");
    expect(now.day, 3);
    expect(now.day_name, "ቅዳሜ");
  });

  test('testing toGC()', () {
    var ec = new EthiopianCalendar(year: 2015, month: 10, day: 1);
    var gc = ec.toGC();
    expect(gc.month_name, "June");
    expect(gc.year, 2023);
    expect(gc.day_name, "Thursday");
  });

  test('testing nextMonth() EthiopianCalendar', () {
    var ec = new EthiopianCalendar(year: 2015, month: 1, day: 1);
    var next_month = ec.nextMonth();
    expect(next_month.month_name, "ጥቅምት");
    expect(next_month.year, 2015);

    var ec2 = new EthiopianCalendar(year: 2015, month: 13, day: 5);
    var next_month2 = ec2.nextMonth();
    expect(next_month2.month_name, "መስከረም");
    expect(next_month2.year, 2016);
  });

  test('testing getMonth()', (){
    var now = EthiopianCalendar.now();
    expect(now.getMonth().length, 30);
  });

  test('testing previousMonth() EthiopianCalendar', () {
    var ec = new EthiopianCalendar(year: 2015, month: 1, day: 1);
    var prev_month = ec.previousMonth();
    expect(prev_month.month_name, "ጷጉሜን");
    expect(prev_month.year, 2014);

    var ec2 = new EthiopianCalendar(year: 2015, month: 13, day: 5);
    var prev_month2 = ec2.previousMonth();
    expect(prev_month2.month_name, "ነሐሴ");
    expect(prev_month2.year, 2015);
  });

  test('testing nextYear()', () {
    var ec = new EthiopianCalendar(year: 2015, month: 1, day: 1);
    var next_year = ec.nextYear();
    expect(next_year.year, 2016);
  });

  test('testing previousYear()', () {
    var ec = new EthiopianCalendar(year: 2015, month: 1, day: 1);
    var prev_year = ec.previousYear();
    expect(prev_year.year, 2014);
  });
}
