import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:notes_app/models/notebook.dart';
import 'package:notes_app/models/note.dart';
import 'package:intl/intl.dart';
import 'package:notes_app/models/themes.dart';

class NotesPage extends StatefulWidget {
  @override
  _NotesPageState createState() => _NotesPageState();
}

int selectedNotebookIndex = 0;
int selectedNoteIndex = 0;
int notebookIndexCount = 0;
int c1 = 0;
int c2 = 0;
int c3 = 0;



class _NotesPageState extends State<NotesPage> {

  List<Notebook> notebookList = [
    Notebook(name: 'Notes', date: DateTime(2020, 10, 9), amount: 1),
    Notebook(name: 'Ideas', date: DateTime(2020, 10, 6), amount:  1),
    Notebook(name: 'Journal', date: DateTime(2020, 9, 16), amount: 1),
  ];


  void changeNPageTheme(int index) {
    setState(() {
      themeIndex = index;
    });
  }


  Widget settingsButton() {
    return IconButton(
      icon: Icon(Icons.settings),
      onPressed: () {
        _dataReturn(context);
      },
      iconSize: 28,
      color: Color(themeList[themeIndex]['Icons']),
    );
  }


  void _dataReturn(BuildContext context) async {
    final result = await Navigator.pushNamed(context, '/settings');
    setState(() {
      themeIndex = result;
    });
  }


  Widget buildNotebookCard(Notebook notebook, int index) {
      return GestureDetector(
        onTap: () {
          setState(() {
            selectedNotebookIndex = index;
            if(notebook.name == 'Notes') {
              //print("print");
              List a = [
                Note(title: "Buy Groceries", body: "Milk, Eggs, Sugar, Flour", date: DateTime(2020, 10, 9)),
                Note(title: 'Finish Project', body: 'Talk to Mark about deadline', date: DateTime(2020, 10, 8)),
                Note(title: 'Buy Monitor', body: '27" Dell and LG on sale', date: DateTime(2020, 9, 26)),
                Note(title: 'Buy Monitor', body: '27" Dell and LG on sale', date: DateTime(2020, 9, 21)),
                Note(title: 'Research algos for R3', body: 'Look into Djikstra\'s', date: DateTime(2020, 9, 21)),
              ];
              if(c1 == 0) {
                for (Note n in a) {
                  notebook.addNote1(n);
                }
                c1 = 1;
              }
            }
            else if(notebook.name == 'Ideas') {
              List a = [
                Note(title: 'New Features', body: 'Custom reminders and cloud saves', date: DateTime(2020, 10, 6)),
                Note(title: 'Story Idea', body: 'More backstory on Venli from SA', date: DateTime(2020, 10, 3)),
                Note(title: 'Website Updates', body: 'Host react apps on portfolio', date: DateTime(2020, 9, 28)),
              ];
              if(c2 == 0) {
                for (Note n in a) {
                  notebook.addNote1(n);
                }
                c2 = 1;
              }
            }
            else if(notebook.name == 'Journal') {
              List a = [
                Note(title: "Day 3", body: "Saw a funny bird... I think:", date: DateTime(2020, 9, 16)),
                Note(title: 'Day 2', body: 'Why am I keeping a journal?', date: DateTime(2020, 9, 15)),
                Note(title: 'Day 1', body: 'First Journal Entry', date: DateTime(2020, 9, 14)),
              ];
              if(c3 == 0) {
                for (Note n in a) {
                  notebook.addNote1(n);
                }
                c3 = 1;
              }
            }
          });
        },
        child: Container(
          height: 225,
          width: 200,
          margin: EdgeInsets.symmetric(horizontal: 7.5, vertical: 10),
          padding: EdgeInsets.fromLTRB(0, 0, 0, 25),
          decoration: BoxDecoration(
            color: index == selectedNotebookIndex
                ? Color(themeList[themeIndex]['NotebookSelected'])
                : Color(themeList[themeIndex]['NotebookUnselected']),
            // Might have to switch the above two, I switched em to make it work for now lol
            borderRadius: BorderRadius.circular(20),
            boxShadow: [BoxShadow(
              color: index == selectedNotebookIndex
                  ? Colors.grey[850]
                  : Colors.transparent,
              //These are also switched. Idk why but it's doing the opposite of what it should so I'm keeping it
              offset: Offset(0, 3),
              blurRadius: 7,
            )],
          ),
          child: Column(
            //crossAxisAlignment: CrossAxisAlignment.center,
            //mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Padding(
                padding: EdgeInsets.fromLTRB(0, 25, 0, 0),
              ),
              Text(
                notebook.name, // Placeholder, change to variable
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 40,
                  fontFamily: 'Alat',
                ),
              ),
              //SizedBox(height: 50,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Padding(
                    padding: EdgeInsets.fromLTRB(0, 0, 0, 30),
                  ),
                  Text(
                    notebook.noteList.length.toString(), // Placeholder, change to variable
                    style: TextStyle(
                        color: Colors.grey[300],
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Alat'
                    ),
                  ),
                  SizedBox(
                    height: 95,
                  ),
                  Text(
                    DateFormat('yMd').format(notebook.date).toString(), // Placeholder, change to variable
                    style: TextStyle(
                        color: Colors.grey[300],
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Alat'
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      );
  }



  Widget buildNoteCard(Note note, int index) {
    return GestureDetector(
      onTap: () {
        setState(() {
          selectedNoteIndex = index;
        });
      },
      child: Container(
        height: 100,
        width: 400,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30),
          color: index == selectedNoteIndex
              ? Color(themeList[themeIndex]['NoteSelected'])
              : Color(themeList[themeIndex]['NoteUnselected']),
          // Also was swapped. Idk what's going on
        ),
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.fromLTRB(10, 10, 10, 0),
            ),
            Align(
              alignment: Alignment.centerLeft,
              child: Container(
                padding: EdgeInsets.symmetric(vertical: 0, horizontal: 52),
                child: Text(
                  note.title,
                  style: TextStyle(
                    color: Colors.grey[900],
                    fontFamily: 'Alat',
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 15,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text(
                  note.body,
                  style: TextStyle(
                    color: Colors.grey[800],
                    fontFamily: 'Alat',
                    fontSize: 16,
                  ),
                ),
                Text(
                  DateFormat('yMd').format(note.date),
                  style: TextStyle(
                    color: Colors.grey[600],
                    fontFamily: 'Alat',
                    fontSize: 14,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Row(
            children: [
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(left: 32.0),
                  child: Text(
                    'Notepad',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Color(themeList[themeIndex]['Title']),
                      fontFamily: 'Alat',
                      fontSize: 25,
                    ),
                  ),
                ),
              ),
              settingsButton(),
              /*IconButton(
                icon: Icon(Icons.settings),
               //color: Color(themeList[themeIndex]['Icons']),
               iconSize: 28,
               onPressed: () {
                  Navigator.pushNamed(context, '/settings');
               },
               // icon: Icons.settings,

              ),*/
            ],
          ), // Text
          centerTitle: true,
          backgroundColor: Color(themeList[themeIndex]['Background']),
          elevation: 0,
        ),
        body: Container(
          color: Color(themeList[themeIndex]['Background']),
          child: Column(
            children: [
              Container(
                height: 260,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: notebookList.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: EdgeInsets.all(10),
                      child: buildNotebookCard(
                        notebookList[index],
                        index,
                      ),
                    );
                  },
                ),
              ),
              Divider(
                color: Color(themeList[themeIndex]['Title']),
                indent: 25,
                endIndent: 25,
              ),
              Container(
                height: 300,
                child: ListView.builder(
                  itemCount: notebookList[selectedNotebookIndex].noteList.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: EdgeInsets.all(10),
                      child: buildNoteCard(notebookList[selectedNotebookIndex].noteList[index], index),
                    );
                  },
                ),
              )
            ],
          ),
        )
    );
  }
}
