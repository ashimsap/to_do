import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:to_do/data/database.dart';
import '../util/tasktile.dart';
import '../util/alert_dialog.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  final _myBox = Hive.box("myBox");
  ToDoDataBase db =ToDoDataBase();

  @override
  void initState() {
    if (_myBox.get("TODOLIST")==null){
      db.createInitialData();
    }
    else{
      db.loadData();
    }

    super.initState();
  }


  final _controller = TextEditingController();
//Checkbox function
  void checkBoxChanged(bool? value, int index){
    setState(() {
      db.toDoList[index][1]=!db.toDoList[index][1];
      db.updateDataBase();

    });
  }
  //Save button function
  void saveNewTask() {
    setState(() {
      db.toDoList.add([_controller.text, false]);
      _controller.clear();
    });
    Navigator.of(context).pop();
    db.updateDataBase();
  }
  //Cancel button function
  void cancelDialog(){
  setState(() {
    _controller.clear();
  });

  Navigator.of(context).pop();
  }
//Delete task function
  void removeTask(int index){
setState(() {
  db.toDoList.removeAt(index);
  db.updateDataBase();
});
  }

  //create task function
  void createNewTask(){
    showDialog(context: context, builder: (context){
      return DialogBox(
        controller: _controller,
        onCancel: cancelDialog,
        onSaved: saveNewTask,
      );
    }
    );
  }

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: Colors.grey.shade200,

      appBar: AppBar(
        foregroundColor: Colors.white,
        elevation: 0,
        backgroundColor: Colors.grey.shade800,
        centerTitle: true,
        title: const Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.list_alt),
            SizedBox(width: 16,),
            Text('T O  D O'),
          ],
        ),
      ),
      body: ListView.builder(
        itemCount: db.toDoList.length,
        itemBuilder: (context,index){
          return MyTile(
              taskName: db.toDoList[index][0],
              isChecked: db.toDoList[index][1],
              onChanged: (value) =>checkBoxChanged(value, index),
            deleteTask: (context)=> removeTask(index),
          );
        },
      ),

      floatingActionButton: GestureDetector(
        onTap: createNewTask,
        child: Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              color: Colors.grey.shade300,
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
            child: const Icon(Icons.add, size: 40,)
        ),
      ),
    );
  }
}
