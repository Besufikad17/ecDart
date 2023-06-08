import 'dart:math';

import 'package:ecDart/GregorianCalender.dart';
import 'package:test/test.dart';

void main() {
  test('testing GregorianCalender constructors', () {
    var gc = new GregorianCalender(year: 2023, month: 6, day: 8);
    expect(gc.year, 2023);
    expect(gc.month_name, "June");
    expect(gc.day_name, "Thursday");

    var now = new GregorianCalender.now();
    expect(now.year, 2023);
    expect(now.month_name, "June");
    expect(now.day_name, "Thursday");
  });

  test('testing toEC()', () {
    var gc = new GregorianCalender(year: 2023, month: 6, day: 9);
    var ec = gc.toEc();
    expect(ec.year, 2015);
    expect(ec.month_name, "ሰኔ");
    expect(ec.day, 1);
  });

  test('testing nextMonth()', () {
    var gc = new GregorianCalender(year: 2023, month: 6, day: 8);
    var next_month = gc.nextMonth();
    expect(next_month.month_name, "July");

    var gc2 = new GregorianCalender(year: 2023, month: 12, day: 8);
    var next_month2 = gc2.nextMonth();
    expect(next_month2.year, 2024);
    expect(next_month2.month_name, "January");
  });
  test('testing prevMonth()', () {
    var gc = new GregorianCalender(year: 2023, month: 6, day: 8);
    var prev_month = gc.previousMonth();
    expect(prev_month.month_name, "May");

    var gc2 = new GregorianCalender(year: 2023, month: 1, day: 8);
    var prev_month2 = gc2.previousMonth();
    expect(prev_month2.year, 2022);
    expect(prev_month2.month_name, "December");
  });
  test('testing nextYear()', () {
    var gc = new GregorianCalender(year: 2023, month: 6, day: 8);
    var next_year = gc.nextYear();
    expect(next_year.year, 2024);
  });
  test('testing prevYear()', () {
    var gc = new GregorianCalender(year: 2023, month: 6, day: 8);
    var prev_year = gc.previousYear();
    expect(prev_year.year, 2022);
  });
}
