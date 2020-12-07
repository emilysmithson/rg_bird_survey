import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rg_bird_survey/view/bird_box_list.dart';
import 'package:rg_bird_survey/view/home_page.dart';
import 'package:rg_bird_survey/view/map_page.dart';
import 'providers/sightings_provider.dart';
import 'view/birds_list.dart';

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

class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int _currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Redland Green Bird Survey'),
      ),
      body: _currentIndex == 0
          ? MyHomePage()
          : _currentIndex == 1
          ? MapPage()
          :_currentIndex == 2? BirdsList(): BirdBoxList(),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: _currentIndex,
        onTap: (index){
          setState(() {
            _currentIndex = index;
          });

        },
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.map), label: 'Map'),
          BottomNavigationBarItem(
              icon: Icon(Icons.nature), label: 'Birds'),
          BottomNavigationBarItem(
              icon: Icon(Icons.add_box_outlined), label: 'Boxes'),
        ],
      ),
    );
  }
}

