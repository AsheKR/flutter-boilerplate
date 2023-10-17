import 'package:jiffy/jiffy.dart';

extension DateTimeJiffy on DateTime {
  Jiffy get jiffy => Jiffy.parseFromDateTime(this);
}
