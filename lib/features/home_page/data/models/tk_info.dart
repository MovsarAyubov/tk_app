class TKInfo {
  final int cellId;
  final int rowId;
  final List<TypeOfWork> typesOfWork;



  TKInfo(this.cellId, this.rowId, this.typesOfWork);}

  class TypeOfWork {
    final int typeOfWorkId;
    final String nameOfWork;
    final String uim;
    final int priceOfWork;
    final String periodOfWork;

  TypeOfWork(this.typeOfWorkId, this.nameOfWork, this.uim, this.priceOfWork, this.periodOfWork);
  }