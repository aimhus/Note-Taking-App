import 'package:shared_preferences/shared_preferences.dart';
import 'package:notes_app/pages/loading.dart';

getTheme() async {
  final pref = await SharedPreferences.getInstance();
  final key = 'theme';
  var index = pref.getInt(key) ?? 0;
  return index;
}

//Future<int> themeIndex = getTheme();
int themeIndex = 1;

// Themes can be a map <String: int>, so something like:

Map<String, int> lightPurpleTheme = {
  'NotebookSelected' : 0xffaa5495,
  'NotebookUnselected' : 0xffd4a9ca,
  'NoteSelected' : 0xfff299f0,
  'NoteUnselected' : 0xffffc9fd,
  'Background' : 0xffffffff,
  'BackgroundAccent' : 0xffe3e3e3,
  'Title' : 0xffeb02f7, // just a random purple colour
  'Icons' : 0xff494949,
};

Map<String, int> darkBlueTheme = {
  'NotebookSelected' : 0xff417bfb,
  'NotebookUnselected' : 0xffb0c9ff,
  'NoteSelected' : 0xff41c0fb,
  'NoteUnselected' : 0xff91dcff,
  'Background' : 0xff000000,
  'BackgroundAccent' : 0xff2b2b2b,
  'Title' : 0xff00bbff, // just a random purple colour
  'Icons' : 0xffffffff,
};

// Then a list of themes to change the index for:

List<Map> themeList = [
  lightPurpleTheme,
  darkBlueTheme,
];

/* In settings/themes, make it so that onTap of the choice
* changes themeIndex inside setState() */
