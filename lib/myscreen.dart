import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:todoapp/database.dart';
import 'package:todoapp/myalert.dart';
import 'package:todoapp/todo_tile.dart';

class MyScreen extends StatefulWidget {
  const MyScreen({Key? key}) : super(key: key);

  @override
  State<MyScreen> createState() => _MyScreenState();
}

class _MyScreenState extends State<MyScreen> {
  final _myBox = Hive.box('mybox');
  final Controller = TextEditingController();
  ToDoDataBase db = ToDoDataBase();
  @override
  void initState() {
    if (_myBox.get("TODOLIST") == null) {
      db.createInitialData();
    } else {
      db.loadData();
      db.updateData();
    }
    super.initState();
  }

  void checkboxvalue(bool? value, int index) {
    setState(() {
      db.todoList[index][1] = !db.todoList[index][1];
    });
    db.updateData();
  }

  void savenewtask() {
    setState(() {
      db.todoList.add([Controller.text, false]);
      Controller.clear();
    });
    Navigator.of(context).pop();
    db.updateData();
  }

  void createNewTask() {
    showDialog(
      context: context,
      builder: (context) => MyAlert(
        onsave: savenewtask,
        oncancel: () => Navigator.of(context).pop(),
        controller: Controller,
      ),
    );
    db.updateData();
  }

  void deleteTask(int index) {
    setState(() {
      db.todoList.removeAt(index);
      db.updateData();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF2c2b4b),
      appBar: AppBar(
        backgroundColor: Color(0xFF2c2b4c),
        elevation: 0,
        centerTitle: true,
        title: Text('TODO'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(18.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                height: 50,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(28),
                  color: Colors.white,
                ),
              ),
              Container(
                height: 679,
                width: double.infinity,
                child: ListView.builder(
                  itemCount: db.todoList.length,
                  itemBuilder: (context, index) => ToDoTile(
                    deletefunction: (context) => deleteTask(index),
                    taskName: db.todoList[index][0],
                    task: db.todoList[index][1],
                    onchanged: (value) => checkboxvalue(value, index),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: Align(
        alignment: Alignment.bottomCenter,
        child: Transform.scale(
          scale: 1.5,
          child: FloatingActionButton(
            onPressed: () {
              createNewTask();
            },
            child: Icon(Icons.add),
          ),
        ),
      ),
    );
  }
}
