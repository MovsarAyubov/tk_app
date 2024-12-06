class WorkerSaveModel {
  String name = "";
  String firstName = "";
  String patronomic = "";
  
  void firstLetterToUpperCase() {
    name = name[0].toUpperCase() + name.substring(1);
    firstName = firstName[0].toUpperCase() + firstName.substring(1);
    patronomic = patronomic[0].toUpperCase() + patronomic.substring(1);          
  }
}