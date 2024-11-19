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
              color: Colors.grey.shade200,
              borderRadius: BorderRadius.circular(12),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.shade700,
                  offset: const Offset(4,4),
                  blurRadius: 6,
                ),
                const BoxShadow(
                  color: Colors.white,
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
                  activeColor: Colors.black,
              ),
              Expanded(
                child: Text(
                     taskName,
                    softWrap: true,
                    style: TextStyle(color: Colors.black,
                        decoration: isChecked? TextDecoration.lineThrough : TextDecoration.none)
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
