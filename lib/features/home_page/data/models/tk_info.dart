class TKInfo {
  final int cell;
  final int row;
  final List<TypeOfWork> typesOfWork;



  TKInfo(this.cell, this.row, this.typesOfWork);
  
  factory TKInfo.fromJson(Map<String, dynamic> json) {
    final values = json['typeOfWork'] as List<dynamic>;
    final List<TypeOfWork> typesOfWork = values.map((value) => TypeOfWork.fromJson(value)).toList();
    return TKInfo(json['cell'], json['row'], typesOfWork);
  }

  }

  class TypeOfWork {
    final int typeOfWorkId;
    final String nameOfWork;
    final String uom;
    final int priceOfWork;
    final String periodOfWork;

  TypeOfWork(this.typeOfWorkId, this.nameOfWork, this.uom, this.priceOfWork, this.periodOfWork);

    factory TypeOfWork.fromJson(Map<String, dynamic> json) {
      return TypeOfWork(json['typeOfWorkId'], json['nameOfWork'], json['uom'], json['priceOfWork'], json['periodOfWork']);
    }
  }