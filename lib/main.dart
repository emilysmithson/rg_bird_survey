import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:rg_bird_survey/view/home_page.dart';
import 'package:rg_bird_survey/view/map_page.dart';
import 'providers/sightings_provider.dart';
import 'view/birds_list.dart';
import 'view/data_entry_form.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider.value(
          value: Sightings(),
        ),
      ],
      child: MaterialApp(
          title: 'Flutter Demo',
          theme: ThemeData(
            primarySwatch: Colors.blue,
            visualDensity: VisualDensity.adaptivePlatformDensity,
          ),
          home: MainPage()
          //BirdsList()
          //MyHomePage(title: "AndroidVille Provider Pattern"),
          ),
    );
  }
}

// Widget _bottomAppBarItems(int number, IconData icon, String label) {
//   return Padding(
//     padding: const EdgeInsets.all(8.0),
//     child:
//         Column(mainAxisSize: MainAxisSize.min, children: [Icon(icon, color: Colors.white), Text(label, style: TextStyle(color: Colors.white),)]),
//   );
// }

class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int _currentIndex = 0;
  Widget _bottomAppBarItems(
    int index,
    IconData icon,
    String label,
  ) {
    Color color = _currentIndex == index ? Colors.black : Colors.white;
    return Expanded(
      child: SizedBox(
        height: 50,
        child: Material(
          type: MaterialType.transparency,
          child: InkWell(
            onTap: () {
              setState(() {
                _currentIndex = index;
              });
            },
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Icon(
                  icon,
                  color: color,
                ),
                Text(
                  label,
                  style: TextStyle(color: color),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        extendBody: true,
      floatingActionButton:
          FloatingActionButton(onPressed: () {}, child: Icon(Icons.add)),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      appBar: AppBar(
        title: Text('Redland Green Bird Survey'),
      ),
      body: _currentIndex == 0
          ? MyHomePage()
          : _currentIndex == 1
              ? MapPage()
              : _currentIndex == 2? BirdsList(): DataEntryForm(MediaQuery.of(context).size.height),
      bottomNavigationBar: BottomAppBar(
       shape: CircularNotchedRectangle(),
        color: Colors.lightBlueAccent,
        notchMargin: 4,
        clipBehavior: Clip.none,
        child: Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
          _bottomAppBarItems(0, Icons.home, 'Home'),
          _bottomAppBarItems(1, Icons.map, 'Map'),
          SizedBox(width: 40),
          _bottomAppBarItems(2, Icons.nature, 'Birds'),
          _bottomAppBarItems(3, Icons.add_box_outlined, 'My Data'),
        ]),
      ),
    );
  }
}
