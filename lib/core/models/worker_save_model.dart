class WorkerSaveModel {
  String firstName = "";
  String lastName = "";
  String patronymic = "";
  
  void firstLetterToUpperCase() {
    firstName = firstName[0].toUpperCase() + firstName.substring(1);
    lastName = lastName[0].toUpperCase() + lastName.substring(1);
    patronymic = patronymic[0].toUpperCase() + patronymic.substring(1);          
  }
}