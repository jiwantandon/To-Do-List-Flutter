import 'package:flutter/material.dart';
import 'my_button.dart';

class DialogBox extends StatelessWidget 
{
  final controller;
  VoidCallback onSave;
  VoidCallback onCancel;
  DialogBox
  ({
    super.key, 
    required this.controller,
    required this.onSave,
    required this.onCancel,
    });
  @override
  Widget build(BuildContext context) 
  {
    return AlertDialog(
      backgroundColor: const Color.fromARGB(255, 217, 123, 233),
      content: Container(
        height: 120,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: 
        [
          // Get User Input
          TextField(
            controller: controller,
            decoration: InputDecoration(
            border: OutlineInputBorder(),
            hintText: " Add a New Task ",  
              ),
          ),

          //Buttons - Save + Cancel
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              // save button
             MyButton(text: "Save",  onPressed: onSave),
             const SizedBox(width: 7),
              // cancel button
              MyButton(text: "Cancel", onPressed: onCancel),
            ],
            ),
          
        ],
        ),
      ),
    );
  }
}