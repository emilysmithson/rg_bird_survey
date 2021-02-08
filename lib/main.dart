import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart';
import 'package:provider/provider.dart';
import 'package:rg_bird_survey/models/bird.dart';
import 'package:rg_bird_survey/models/user.dart';
import 'package:rg_bird_survey/providers/birds_provider.dart';

import 'package:rg_bird_survey/view/home_page.dart';
import 'package:rg_bird_survey/view/map_page.dart';
import 'providers/observations_provider.dart';
import 'view/birds_list.dart';
import 'view/data_entry_form.dart';
import 'package:firebase_core/firebase_core.dart';
import 'models/observation.dart';

Future<void> main() async {
  // We get the current app directory
  WidgetsFlutterBinding.ensureInitialized();
  final appDocDir = await getApplicationDocumentsDirectory();
  //
  // // We initialize Hive and we give him the current path
  Hive
    ..init(appDocDir.path)
    ..registerAdapter(ObservationAdapter())
    ..registerAdapter(BirdAdapter())
    ..registerAdapter(UserAdapter());
  var box = await Hive.openBox('observations');

  await box.clear();

  await box.put(
      '123',
      Observation(
        0,
        DateTime(
          2020,
          12,
          07,
          13,
          34,
          21,
          32,
        ),
        2,
        'Emily',
        true,
        'lovely',
        bird: Birds.nuthatch,
      ));

  Observation observation = box.get('123');

  print(observation.user);
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final Future<FirebaseApp> _fbApp = Firebase.initializeApp();

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider.value(
          value: Observations(),
        ),
      ],
      child: MaterialApp(
          title: 'Flutter Demo',
          theme: ThemeData(
            primarySwatch: Colors.blue,
            visualDensity: VisualDensity.adaptivePlatformDensity,
          ),
          home: FutureBuilder(
            future: _fbApp,
            builder: (future, snapshot) {
              if (snapshot.hasError) {
                print('You have an error. ${snapshot.error.toString()}');
                return Text('You have an error');
              } else if (snapshot.hasData) {
                return MainPage();
              } else {
                return CircularProgressIndicator();
              }
            },
          )
          // MainPage()
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
      floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) =>
                        DataEntryForm(MediaQuery.of(context).size.height)));
          },
          child: Icon(Icons.add)),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      appBar: AppBar(
        title: Text('Redland Green Bird Survey'),
      ),
      body: _currentIndex == 0
          ? MyHomePage()
          : _currentIndex == 1
              ? MapPage()
              : _currentIndex == 2
                  ? BirdsList()
                  : DataEntryForm(MediaQuery.of(context).size.height),
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
