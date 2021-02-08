import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:rg_bird_survey/providers/birds_provider.dart';
import 'package:rg_bird_survey/providers/observations_provider.dart';

import 'bird_box_information.dart';
class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  void didChangeDependencies() {
    var sightings =
        Provider.of<Observations>(context).observations;
    super.didChangeDependencies();
  }

  int birdBoxNumber = 0;

  final List<DataRow> _dataRows = [];
  bool _sortBirdBox = true;
  bool _sortDate = true;
  bool _sortUser = true;
  bool _sortBird = true;
  bool _sortAscending = true;
  int _sortColumnIndex = 1;
  @override
  Widget build(BuildContext context) {
    var sightings =
        Provider.of<Observations>(context).observations;

    return Stack(
      children: [
        Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            child: Opacity(
                opacity: 0.3,
                child: Image.asset(Birds.robin.image[0], fit: BoxFit.fill))),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: ListView(
            children: [
              Text(
                'Redland Green Bird Box Survey',
                style: TextStyle(fontSize: 24),
              ),
              SizedBox(height: 8),
              Text(
                  'In 2019 Redland Green Community Group installed 16 bird boxes on Redland Green. '
                  '\n\nThis app is designed to help monitor these boxes.'
                  '\n\nGrab a pair of binoculars and go observe one of the bird boxes.'
                  'Whether you see a lovely bird or not, log it on this app so that we can keep track.'
                  '\n\nClick on the + button below to log an entry.'),
              SizedBox(height: 8),
              SizedBox(height: 8),
              Text(
                'Latest Observations',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              Container(
                  height: MediaQuery.of(context).size.height * 0.7,
                  child: Card(
                    child: SingleChildScrollView(
                        child: DataTable(
                      sortAscending: _sortAscending,
                      sortColumnIndex: _sortColumnIndex,
                      columns: [
                        DataColumn(
                            label: Text('Box'),
                            numeric: true,
                            onSort: (columnIndex, ascending) {
                              setState(() {
                                if (columnIndex == _sortColumnIndex) {
                                  _sortAscending = _sortBirdBox = ascending;
                                } else {
                                  _sortColumnIndex = columnIndex;
                                  _sortAscending = _sortBirdBox;
                                }
                                sightings.sort((a, b) => a.birdBox.compareTo(b.birdBox));
                                if (!_sortAscending) {
                                  sightings
                                      .sort((a, b) => b.birdBox.compareTo(a.birdBox));
                                }
                              });
                            }),
                        DataColumn(
                            label: Text('Date'),
                            numeric: true,
                            onSort: (columnIndex, ascending) {
                              setState(() {
                                if (columnIndex == _sortColumnIndex) {
                                  _sortAscending = _sortDate = ascending;
                                } else {
                                  _sortColumnIndex = columnIndex;
                                  _sortAscending = _sortDate;
                                }
                                sightings.sort(
                                    (a, b) => a.dateTime.compareTo(b.dateTime));
                                if (!_sortAscending) {
                                  sightings.sort((a, b) =>
                                      b.dateTime.compareTo(a.dateTime));
                                }
                              });
                            }),
                        DataColumn(
                            label: Text('User'),
                            numeric: false,
                            onSort: (columnIndex, ascending) {
                              setState(() {
                                if (columnIndex == _sortColumnIndex) {
                                  _sortAscending = _sortUser = ascending;
                                } else {
                                  _sortColumnIndex = columnIndex;
                                  _sortAscending = _sortUser;
                                }
                                sightings
                                    .sort((a, b) => a.user.compareTo(b.user));
                                if (!_sortAscending) {
                                  sightings
                                      .sort((a, b) => b.user.compareTo(a.user));
                                }
                              });
                            }),
                        DataColumn(
                            label: Text('Bird'),
                            numeric: false,
                            onSort: (columnIndex, ascending) {
                              setState(() {
                                if (columnIndex == _sortColumnIndex) {
                                  _sortAscending = _sortBird = ascending;
                                } else {
                                  _sortColumnIndex = columnIndex;
                                  _sortAscending = _sortBird;
                                }
                                sightings.sort((a, b) => a.birdSighted
                                    ? a.bird.name.compareTo(
                                        b.birdSighted ? b.bird.name : '')
                                    : ''.compareTo(
                                        b.birdSighted ? b.bird.name : ''));

                                if (!_sortAscending) {
                                  sightings.sort((a, b) => b.birdSighted
                                      ? b.bird.name.compareTo(
                                          a.birdSighted ? a.bird.name : '')
                                      : ''.compareTo(
                                          a.birdSighted ? a.bird.name : ''));
                                }
                              });
                            }),
                      ],
                      rows: sightings
                          .map(
                            (sighting) => DataRow(
                                cells: [
                                  DataCell(
                                    Text((sighting.birdBox+1).toString()),
                                    onTap: () {
                                      Navigator.push(context, MaterialPageRoute(builder: (context) => BirdBoxInformation(sighting.birdBox)),);
                                    },
                                  ),
                                  DataCell(
                                    Text(sighting.dateTime.day.toString() +
                                        '/' +
                                        sighting.dateTime.month.toString() +
                                        '/20 ' +
                                        sighting.dateTime.hour.toString() +
                                        ':' +
                                        sighting.dateTime.minute.toString()), onTap: () {
                                    Navigator.push(context, MaterialPageRoute(builder: (context) => BirdBoxInformation(sighting.birdBox)),);
                                  },
                                  ),
                                  DataCell(Text(sighting.user), onTap: () {
                                    Navigator.push(context, MaterialPageRoute(builder: (context) => BirdBoxInformation(sighting.birdBox)),);
                                  },),
                                  DataCell(Text(sighting.birdSighted
                                      ? sighting.bird.name
                                      : ''),  onTap: () {
                                    Navigator.push(context, MaterialPageRoute(builder: (context) => BirdBoxInformation(sighting.birdBox)),);
                                  },)
                                ]),
                          )
                          .toList(),
                    )),
                  )),
            ],
          ),
        ),
      ],
    );
  }
}
