// ignore_for_file: public_member_api_docs, sort_constructors_first
class AdditionalParametrsModel {
  double totalWeight;
  double weightOfPallet;
  double weigthOfBox;
  double firstGradeWeight;
  double countBoxesFirstGrade;
  double secondGradeWeight;
  double countBoxesSecondGrade;
  double thirdGradeWeight;
  double countBoxesThirdGrade;
  int cell;
  AdditionalParametrsModel({
    this.totalWeight = 0,
    this.weightOfPallet = 0,
    this.weigthOfBox = 0.4,
    this.firstGradeWeight = 0,
    this.countBoxesFirstGrade = 0,
    this.secondGradeWeight = 0,
    this.countBoxesSecondGrade = 0,
    this.thirdGradeWeight = 0,
    this.countBoxesThirdGrade = 0,
    this.cell = 0,
  });

  double calculateTotalWeight() {
    return totalWeight = weightOfPallet + firstGradeWeight + secondGradeWeight + thirdGradeWeight;
  }
}
