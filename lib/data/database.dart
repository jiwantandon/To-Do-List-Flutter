import 'package:hive/hive.dart';

class ToDoDataBase
{
    List toDoList = [];
    // Reference The Box
    final _myBox = Hive.box('mybox');
    // Run This Method The First Time The App is Opened
    void createInitialData()
    {
      toDoList = [
        ["Default Tasks", false],
        ["Swipe Left To Delete", false],
      ];     
    }
    //Load The Data from Database
    void loadData()
    {
        toDoList = _myBox.get("TODOLIST");
    }
    void updateDataBase()
    {
        _myBox.put("TODOLIST", toDoList);
    }
}