import 'package:flutter/material.dart';
import 'package:notes_app/models/notebook.dart';
import 'package:notes_app/models/notebook_card.dart';
import 'package:notes_app/pages/NotesPage.dart';
import 'package:notes_app/pages/settings.dart';
import 'package:notes_app/pages/edit_note.dart';
import 'package:notes_app/pages/loading.dart';

void main() {
  runApp(MaterialApp(
    //home: NotesPage(),
   // initialRoute: '/notesPage',
    routes: {
      '/' : (context) => Loading(),
      '/notesPage' : (context) => NotesPage(),
      '/settings' : (context) => Settings(),
      '/editNote' : (context) => EditNote(),
    },
  ));
}
