import 'package:faker/faker.dart';

import '../models/tasks.dart';

final faker = Faker();

List<Task> obtenerData() {
  List<Task> tasks = [];
  for (var i = 0; i < 5; i++) {
    final task = Task(
        title: faker.lorem.sentence(),
        startTime: faker.date.time(),
        endTime: faker.date.time(),
        photo: faker.image.image());
    tasks.add(task);
  }
  return tasks;
}
// class TasksClass {
//   TasksClass() {
//     tasks = [];
//   }

//   late List<Task> tasks;
//   obtenerData() {
//     for (var i = 0; i < 5; i++) {
//       final task = Task(
//           title: faker.lorem.sentence(),
//           startTime: faker.date.time(),
//           endTime: faker.date.time(),
//           photo: faker.image.image());
//       tasks.add(task);
//     }
//   }
// }
