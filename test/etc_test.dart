import 'package:ecDart/EthiopianCalender.dart';
import 'package:test/test.dart';

void main() {
  test('testing creating EthiopianCalender object', () {
    var ec = new EthiopianCalender.named(year: 2015, month: 1, day: 1);
    expect(ec.month_name, "መስከረም");
    expect(ec.isHoliday, true);
    expect(ec.holiday_name, "አዲስ አመት");
  });

  test('testing nextMonth() EthiopianCalender', () {
    var ec = new EthiopianCalender.named(year: 2015, month: 1, day: 1);
    var next_month = ec.nextMonth();
    expect(next_month.month_name, "ጥቅምት");
    expect(next_month.year, 2015);

    var ec2 = new EthiopianCalender.named(year: 2015, month: 13, day: 5);
    var next_month2 = ec2.nextMonth();
    expect(next_month2.month_name, "መስከረም");
    expect(next_month2.year, 2016);
  });
}
