import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class MyTile extends StatelessWidget {
  final bool isChecked;
  final String taskName;
  Function(bool?)? onChanged;
  Function(BuildContext)? deleteTask;

  MyTile({
  super.key,
  required this.isChecked,
    required this.taskName,
    required this.onChanged,
    required this.deleteTask,
  });

  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding: const EdgeInsets.fromLTRB(20.0,20,20,0),
      child: Slidable(
        endActionPane: ActionPane(
            motion: const StretchMotion(),
            children: [SlidableAction(
              onPressed: deleteTask,
              icon: Icons.delete,
              label: 'Delete Task',
              backgroundColor: Colors.red,
              borderRadius: BorderRadius.circular(12),
              autoClose: true,
              foregroundColor: Colors.white,
            ),
            ]
        ),
        child: Container(
          padding: const EdgeInsets.all(15),
          decoration: BoxDecoration(
              color: Colors.green[99],
              borderRadius: BorderRadius.circular(12),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.shade900,
                  offset: const Offset(4,4),
                  blurRadius: 6,
                ),
                BoxShadow(
                  color: Colors.green.shade50,
                  offset: Offset(-4,-4),
                  blurRadius: 6,
                ),
              ]
          ),
          child: Row(
            children: [
              Checkbox(
                  value: isChecked,
                  onChanged: onChanged,
                  checkColor: Colors.green,
                focusColor: Colors.white,
                hoverColor: Colors.white,
                activeColor: Colors.white,
              ),
              Expanded(
                child: Text(
                     taskName,
                    softWrap: true,
                    style: TextStyle(color: Colors.white,
                        fontSize: 16,
                        decoration: isChecked? TextDecoration.lineThrough : TextDecoration.none,
                        decorationColor: isChecked ? Colors.red : Colors.transparent,
                    decorationThickness: 3)
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}



