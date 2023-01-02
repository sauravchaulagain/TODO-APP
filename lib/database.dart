import 'package:hive/hive.dart';

class ToDoDataBase {
  List todoList = [];
  final _myBox = Hive.box('mybox');
  void createInitialData() {
    todoList = [
      ['saurav', false],
      ['ram', true]
    ];
  }

  void loadData() {
    todoList = _myBox.get('TODOLIST');
  }

  void updateData() {
    _myBox.put('TODOLIST', todoList);
  }
}
