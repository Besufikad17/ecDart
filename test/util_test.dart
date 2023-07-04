import 'package:test/test.dart';
import 'package:ecDart/utils/util.dart';

void main() {
  test('testing getHolidays()', () {
    var holidays = getHolidays(2015);
    print(holidays.elementAt(8));
    expect(holidays.elementAt(8)["month"], "ሚያዝያ");
    expect(holidays.elementAt(8)["day"], 8);
  });

  test('testing getHoliday()', () {
    var holiday = getHoliday("የካቲት", 23, 2015);
    expect(holiday, "አደዋ");
  });

  test('testing getGreatestMultiple()', () {
    var greatest_multiple = getGreatestMultiple(7, -26);
    expect(greatest_multiple, -28);
  });

  test('testing getDayName()', () {
    var day_name = getDayName(6, 8, 2023);
    expect(day_name, 4);
  });

  test('testing getCurrentMonth()', () {
    expect(getCurrentMonth().length, 30);
  });
}
