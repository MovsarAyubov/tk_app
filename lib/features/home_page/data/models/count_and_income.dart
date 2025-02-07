import 'package:tk_app/features/home_page/domain/entities/count_and_income.dart';

class CountAndIncomeModel extends CountAndIncome {
  CountAndIncomeModel(super.count, super.income);

  factory CountAndIncomeModel.fromJson(Map<String, dynamic> json) {
    return CountAndIncomeModel(json["count"], json["income"]);
  }
}