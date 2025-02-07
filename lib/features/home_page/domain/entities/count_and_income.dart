import 'package:decimal/decimal.dart';

class CountAndIncome {
  final Decimal count;
  final Decimal income;

  CountAndIncome(this.count, this.income);

  Decimal calculateIncome() {
    return (income / Decimal.parse("66.6")).toDecimal() * Decimal.parse("33.3");
  }

}