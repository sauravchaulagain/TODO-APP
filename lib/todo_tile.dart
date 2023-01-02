import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class ToDoTile extends StatelessWidget {
  final String taskName;
  final bool task;
  Function(bool?)? onchanged;
  Function(BuildContext)? deletefunction;

  ToDoTile({
    super.key,
    required this.taskName,
    required this.task,
    required this.onchanged,
    required this.deletefunction,
  });
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 30, right: 30, top: 20),
      child: Slidable(
        endActionPane: ActionPane(
          motion: StretchMotion(),
          children: [
            SlidableAction(
              onPressed: deletefunction,
              icon: Icons.delete,
              backgroundColor: Colors.red,
            ),
          ],
        ),
        child: Container(
          height: 160,
          width: double.infinity,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(18),
            //  border: Border.all(color: Colors.white),
            color: Color(
              0xFFddf0f7,
            ),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Transform.scale(
                scale: 1.5,
                child: Checkbox(
                  value: task,
                  onChanged: onchanged,
                ),
              ),
              Text(
                taskName,
                style: TextStyle(
                  decoration:
                      task ? TextDecoration.lineThrough : TextDecoration.none,
                  fontFamily: 'hello',
                  fontSize: 28,
                  fontWeight: FontWeight.w500,
                  color: Colors.black,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ColorList {
  static final List colorss = [
    0xFFddf0f7,
    0xFFddf0f7,
    0xFFe5fbd4,
    0xFFfff4e0,
    0xFFffe9f5
  ];
}
