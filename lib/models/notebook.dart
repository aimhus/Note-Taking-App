import 'package:flutter/cupertino.dart';

import 'note.dart';

class Notebook {
  String name;
  DateTime date;
  int amount;

  Notebook({this.name, this.date, this.amount});

  List<Note> noteList = [
    /*
    Note(title: 'Buy Groceries', body: 'Milk, Eggs, Sugar, Flour', date: DateTime(2020, 8, 6)),
    Note(title: 'Finish Project', body: 'Talk to Mark about deadline', date: DateTime(2020, 8, 6)),
    Note(title: 'Story Idea', body: 'More backstory on Venli from SA', date: DateTime(2020, 8, 6)),
    Note(title: 'Tester Note', body: 'Your note here', date: DateTime(2020, 8, 6)),
    Note(title: 'Tester Note', body: 'Your note here', date: DateTime(2020, 8, 6)),
     */
  ];

  void addNote(String title, String body, DateTime date) {
    Note note = new Note(title: title, body: body, date: date);
    noteList.add(note);
  }

  void addNote1(Note note) {
    noteList.add(note);
  }

}