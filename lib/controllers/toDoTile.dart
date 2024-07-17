import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class toDoTile extends StatefulWidget {
  const toDoTile(
      {super.key,
      required this.taskName,
      required this.taskCompleted,
      required this.onChanged, 
      required this.deleteFunction});

  final String taskName;
  final bool taskCompleted;
  final Function(bool?)? onChanged;
  final Function(BuildContext)? deleteFunction;

  @override
  State<toDoTile> createState() => _toDoTileState();
}

class _toDoTileState extends State<toDoTile> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20, bottom: 0, right: 20, top: 20),
      child: Slidable(
        endActionPane: ActionPane(
          motion: StretchMotion(), 
          children: [
            SlidableAction(
              onPressed: widget.deleteFunction,
              icon: Icons.delete,
              borderRadius: BorderRadius.circular(12),
              backgroundColor: Colors.red,
            )
          ]
          ),
        child: Container(
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
                color: Colors.deepPurple,
                borderRadius: BorderRadius.circular(15)),
            child: Row(
              children: [
                Checkbox(value: widget.taskCompleted, onChanged: widget.onChanged),
                SizedBox(width: 10),
                Text(
                  widget.taskName,
                  style: TextStyle(
                    color: Colors.white,
                    decoration: widget.taskCompleted ? TextDecoration.lineThrough : TextDecoration.none,
                    decorationColor: Colors.black,
                    decorationThickness: 2
                  ),
                )
              ],
            )),
      ),
    );
  }
}
