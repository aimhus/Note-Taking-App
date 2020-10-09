import 'package:flutter/material.dart';
import 'package:notes_app/models/themes.dart';

class Loading extends StatefulWidget {
  @override
  _LoadingState createState() => _LoadingState();
}
int i = getTheme();
class _LoadingState extends State<Loading> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.cancel),
          onPressed: () {
            //int i = getTheme();
            Navigator.pushReplacementNamed(context, '/notesPage');
          },
          color: Colors.yellow,
        ),
      ),
    );
  }
}
