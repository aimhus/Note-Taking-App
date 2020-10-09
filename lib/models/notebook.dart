import 'note.dart';

class Notebook {
  String name;
  DateTime date;
  int amount;

  Notebook({this.name, this.date, this.amount});

  List<Note> noteList = [
    Note(title: 'Tester Note', body: 'Your note here', date: DateTime(2020, 8, 6)),
    Note(title: 'Tester Note', body: 'Your note here', date: DateTime(2020, 8, 6)),
    Note(title: 'Tester Note', body: 'Your note here', date: DateTime(2020, 8, 6)),
    Note(title: 'Tester Note', body: 'Your note here', date: DateTime(2020, 8, 6)),
    Note(title: 'Tester Note', body: 'Your note here', date: DateTime(2020, 8, 6)),
  ];
}