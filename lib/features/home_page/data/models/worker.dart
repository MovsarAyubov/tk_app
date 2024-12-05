class Worker {
  final String firstName;
  final String lastName;
  final String patronymic;

  Worker({required this.firstName, required this.lastName, required this.patronymic});

    static List<Worker> get getWorkers => [
    Worker(firstName: 'Иван', lastName: 'Иванов', patronymic: 'Иванович'),
    Worker(firstName: 'Петр', lastName: 'Петров', patronymic: 'Петрович'),
    Worker(firstName: 'Сидор', lastName: 'Сидоров', patronymic: 'Сидорович'),
    Worker(firstName: 'Михаил', lastName: 'Михайлов', patronymic: 'Михайлович'),
    Worker(firstName: 'Николай', lastName: 'Николаев', patronymic: 'Николаевич'),
    Worker(firstName: 'Дмитрий', lastName: 'Дмитриев', patronymic: 'Дмитриевич'),
    Worker(firstName: 'Борис', lastName: 'Андреев', patronymic: 'Андреевич'),
    Worker(firstName: 'Сергей', lastName: 'Сергеев', patronymic: 'Сергеевич'),
    Worker(firstName: 'Владимир', lastName: 'Владимиров', patronymic: 'Владимирович'),
    Worker(firstName: 'Григорий', lastName: 'Григорьев', patronymic: 'Григорьевич'),
    Worker(firstName: 'Борис', lastName: 'Борисов', patronymic: 'Борисович'),
    Worker(firstName: 'Константин', lastName: 'Константинов', patronymic: 'Константинович'),
    Worker(firstName: 'Василий', lastName: 'Васильев', patronymic: 'Васильевич'),
    Worker(firstName: 'Федор', lastName: 'Федоров', patronymic: 'Федорович'),
    Worker(firstName: 'Павел', lastName: 'Павлов', patronymic: 'Павлович'),
    Worker(firstName: 'Виктор', lastName: 'Викторов', patronymic: 'Викторович'),
    Worker(firstName: 'Леонид', lastName: 'Леонидов', patronymic: 'Леонидович'),
    Worker(firstName: 'Александр', lastName: 'Александров', patronymic: 'Александрович'),
  ];
}

