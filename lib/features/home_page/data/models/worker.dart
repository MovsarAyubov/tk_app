class Worker {
  final String firstName;
  final String name;
  final String patronymic;

  Worker({required this.firstName, required this.name, required this.patronymic});

      factory Worker.fromJson(Map<String, dynamic> json) {
    return Worker(firstName: json['name'], name: json['firstName'], patronymic: json['patronomic']);
  }

}

