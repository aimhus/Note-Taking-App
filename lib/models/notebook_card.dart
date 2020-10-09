import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'notebook.dart';
import 'package:notes_app/main.dart';

class NotebookCard extends StatelessWidget {

  final Notebook notebook;
  final int index;
  final int amount;

  NotebookCard({this.notebook, this.index, this.amount});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 250,
      width: 200,
      margin: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
      padding: EdgeInsets.fromLTRB(0, 0, 0, 25),
      decoration: BoxDecoration(
        //if index == _Homestate().
        color: const Color(0xffaa5495),
        borderRadius: BorderRadius.circular(20),
        boxShadow: [BoxShadow(
          color: Colors.grey[850],
          offset: Offset(0, 3),
          blurRadius: 7,
        )],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text(
                notebook.name, // Placeholder, change to variable
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 25,
                ),
              ),
              Text(
                notebook.date.toString(), // Placeholder, change to variable
                style: TextStyle(
                  color: Colors.grey[300],
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
