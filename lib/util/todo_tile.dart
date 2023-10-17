import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

// ignore: must_be_immutable
class ToDoTile extends StatelessWidget 
{
  final String taskName;
  final bool taskCompleted;
  Function(bool?)? onChanged;
  Function(BuildContext)? deleteFunction;

  ToDoTile(
  {super.key, 
  required this.taskName, 
  required this.taskCompleted,
  required this.onChanged,
  required this.deleteFunction,
  });

  @override
  Widget build(BuildContext context) 
  {

    return Padding(
      padding: const EdgeInsets.only(left: 18.0, right: 18.0, top: 18.0),
      child: Slidable(
        endActionPane: ActionPane(
          motion: StretchMotion(),
          children: [
            SlidableAction(onPressed: deleteFunction,
            icon: Icons.delete,
            backgroundColor: Colors.red.shade300,
            borderRadius: BorderRadius.circular(18),
            )
          ],
        ),
      child: Container(
        padding: EdgeInsets.all(23),
        
        decoration: BoxDecoration(
        color: Color.fromARGB(255, 255, 255, 255),
        borderRadius: BorderRadius.circular(12),
        ),
        child: Row(
        children: 
        [
          //Checkbox
          Checkbox
          (
            value: taskCompleted, 
            onChanged: onChanged
          ),
          Text(
            taskName,
            style: TextStyle(
              decoration: taskCompleted? 
              TextDecoration.lineThrough 
              :  
              TextDecoration.none,),
            ),
        ],
        ),
   
    ),
    ),
    );
  }
}