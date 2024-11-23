import 'package:flutter/material.dart';
import 'package:to_do/util/my_button.dart';

class DialogBox extends StatelessWidget {
  final controller;
  VoidCallback onSaved;
  VoidCallback onCancel;
  DialogBox({
    super.key,
    required this.controller,
    required this.onCancel,
    required this.onSaved,
  });
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.green[1],
      elevation: 8,
      content: SizedBox(
        height :150,
        width: 500,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: TextField(
                cursorColor: Colors.blueGrey,
                controller: controller,
                style: const TextStyle(color: Colors.white),
                decoration: InputDecoration(
                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(12),
                  borderSide: const BorderSide(color: Colors.white54)),
                  hintText: 'Enter a Task',
                  hintStyle: const TextStyle(color: Colors.white54),
                  focusColor: Colors.white,
                  focusedBorder: OutlineInputBorder(borderSide: const BorderSide(color: Colors.blueGrey),borderRadius: BorderRadius.circular(12))
                ),
              ),
            ),
            //Buttons
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                MyButton(text: 'Save', onPressed: onSaved),
                const SizedBox(width: 4),
                MyButton(text: 'Cancel', onPressed: onCancel),
              ],
            )
          ],
        ),
      ),
    );
  }
}
