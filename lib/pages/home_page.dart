import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:to_do_list/data/database.dart';
import '../../util/todo_tile.dart';
import '../util/dialog_box.dart';

class HomePage extends StatefulWidget 
{
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> 
{
  //Reference The Hive Box
  final _myBox = Hive.box('mybox');

  ToDoDataBase db = ToDoDataBase();
  @override
  void initState() 
  //if this is the first time ever opening the application, then create default data
  {
    if(_myBox.get("TODOLIST") == null)
    {
        db.createInitialData();
    }
    else
    {
      //There already exists data
      db.loadData();
    }
    super.initState();
    
  }
  //Text Controller
  final _controller = TextEditingController();
  
  //CheckBox - Tapping
  void checkboxChanged(bool? value, int index)
  {
      setState(() {
        db.toDoList[index][1] = !db.toDoList[index][1];
      });
      db.updateDataBase();
  }
  //Save a new Task
  void saveNewTask()
  {
    setState(() {
      db.toDoList.add([_controller.text, false]);
      _controller.clear();
    });
    Navigator.of(context).pop();
    db.updateDataBase();
  }

  // Create a New Task
  void createNewTask()
  {
      showDialog
      (
        context: context, 
        builder: (context)
        {
              return DialogBox(
                controller: _controller,
                onSave: saveNewTask,
                onCancel: () => Navigator.of(context).pop(),
              );
        },
      );
  }
  // Delete Task
  void deleteTask(int index)
  {
     setState(() {
       db.toDoList.removeAt(index);
     });
     db.updateDataBase();
  }
  @override
  Widget build(BuildContext context) 
  {
    return Scaffold
    (
      backgroundColor: const Color.fromARGB(255, 209, 126, 224),
      appBar: AppBar
      (
        title: Text('TO DO LIST'),
        elevation: 0,
      ),
      floatingActionButton: FloatingActionButton( 
        onPressed: createNewTask,
        child: Icon(Icons.add),
        ),
      body: ListView.builder
      (
        itemCount: db.toDoList.length,
        itemBuilder: (context, index)
        {
            return ToDoTile(
              taskName: db.toDoList[index][0], 
              taskCompleted: db.toDoList[index][1], 
              onChanged: (value) => checkboxChanged(value, index),
              deleteFunction: (context) => deleteTask(index),
              );  
        },
      ),
      );
  }
}