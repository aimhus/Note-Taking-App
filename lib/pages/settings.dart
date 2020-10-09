import 'package:flutter/material.dart';
import 'package:notes_app/models/themes.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Settings extends StatefulWidget {
  @override
  _SettingsState createState() => _SettingsState();
}

int chosenTheme = themeIndex;

class _SettingsState extends State<Settings> {
  @override

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Settings',
          textAlign: TextAlign.center,
          style: TextStyle(
            color: Color(themeList[themeIndex]['Title']),
            fontFamily: 'Alat',
            fontSize: 25,
          ),
        ),
        leading: new IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () {
              setState(() {
                Navigator.pop(context, chosenTheme);
              });
            },
          color: Color(themeList[themeIndex]['Icons']),
        ),
        centerTitle: true,
        backgroundColor: Color(themeList[themeIndex]['Background']),
        elevation: 0,
      ),
      body: Container(
        height: 1000,
        color: Color(themeList[themeIndex]['Background']),
        child: Card(
          color: Color(themeList[themeIndex]['BackgroundAccent']),
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: 15.0, horizontal: 20.0),
            child: ExpansionTile(
              title: Text(
                'Themes',
                style: TextStyle(
                  color: Color(themeList[themeIndex]['Icons']),
                  fontFamily: 'Alat',
                  fontSize: 20,
                ),
              ),
              children: [
                Container(
                  height: 100,
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: [
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            themeIndex = 0;
                            chosenTheme = themeIndex;
                            //Navigator.pop(context, 0);
                          });
                        },
                        child: CircleAvatar(
                          child: Image.asset('assets/lightPurpleTheme.png'),
                        ),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      CircleAvatar(
                        child: Image.asset('assets/darkBlueTheme.png'),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
        ),
    );
  }

  void savePreferences() async {
    final pref = await SharedPreferences.getInstance();
    final key = 'theme';
    pref.setInt(key, themeIndex);
  }

}
