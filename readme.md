# ecDart

Simple re-implementation of Ethiopian and Gregorian calendar in dart based on [Abushakir-dart](https://github.com/Nabute/Abushakir) package.

## Installation

1. Clonning the repo

   ```bash
    git clone https://github.com/Besufikad17/ecDart.git
   ```

2. Installing packages

   ```bash
    cd ecDart && pub get
   ```

3. Running tests
   ```bash
   dart test/etc_test.dart && dart test/gc_test.dart && dart test/util_test.dart
   ```

## Usage<br>

### Ethiopian Calendar<br>

- Ethiopian calendar can be implemented by creating `EthiopianCalendar` instance.

```dart
   import 'package:ecDart/calendar/EthiopianCalendar.dart';

   // creating instance with paramters
   var ec = new EthiopianCalendar(year: 2015, month: 1, day: 1);    
   print(ec.month_name);                                               //  "መስከረም"
   print(ec.isHoliday);                                                //  true
   print(ec.holiday_name);                                             //  "አዲስ አመት"

   // creating instance that contains the current date
   var now = new EthiopianCalendar.now();                             
   print(now.year);                                                    //  2015
   print(now.month_name);                                              //  "ሰኔ"
   print(now.day);                                                     //  3
   print(now.day_name);                                                // "ቅዳሜ"
```

- `EthiopianCalendar` instance contains method called `toGC()` which is used to convert a given Ethiopian date to Gregorian.

```dart
  import 'package:ecDart/calendar/EthiopianCalendar.dart';
  
  // creating instance that contains the current date
  var now = new EthiopianCalendar.now();         

  // converting the current date to gregorian                    
  var now_gc = now.toGC();                                          
  print(now_gc.year);                                                 //  2023
  print(now_gc.month_name);                                           //  "June"
  print(now_gc.day);                                                  //  10
  print(now_gc.day_name);                                             // "Saturday"
```
- `EthiopianCalendar` instance contains methods to get the next month, previous month, next year and previous year in the form of Ethiopian date.

```dart
   import 'package:ecDart/calendar/EthiopianCalendar.dart';

   // creating instance that contains the current date
   var now = new EthiopianCalendar.now();                             
   
   // creating the next Ethiopian month  
   var next_month = now.nextMonth();
   print(next_month.year);                                                    //  2015
   print(next_month.month_name);                                              //  "ኃምሌ"
   print(next_month.day);                                                     //  3

   // creating the previous Ethiopian year
   var previous_year = now.previousYear();
   print(previous_year.year);                                                    //  2014
   print(previous_year.month_name);                                              //  "ሰኔ"
   print(previous_year.day);                                                     //  3
```