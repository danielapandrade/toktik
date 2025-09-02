import 'package:intl/intl.dart';

class HumanFormats {
  static String humanReadbleNumber(num numero) {
    final formatterNumber = NumberFormat.compactCurrency(
      decimalDigits: 0,
      symbol: '',
    ).format(numero).toString();
    return formatterNumber;
  }
}
