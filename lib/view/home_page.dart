import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rg_bird_survey/model/main_model.dart';
import 'package:rg_bird_survey/providers/birds_provider.dart';
import 'package:rg_bird_survey/providers/sightings_provider.dart';

import 'bird_box_information.dart';

class MyHomePage extends StatefulWidget {



  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  void didChangeDependencies() {
    List<Sighting> sightings = Provider.of<Sightings>(context).getSighting;
    for (int i = 0; i < sightings.length; i++) {
      _dataRows.add(DataRow(
          onSelectChanged: (value) {
            Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) =>
                      BirdBoxInformation(sightings[i].birdBox)),
            );
          },
          cells: [
            DataCell(Text((sightings[i].birdBox + 1).toString())),
            DataCell(
              Text(sightings[i].dateTime.day.toString() +
                  '/' +
                  sightings[i].dateTime.month.toString() +
                  '/20 ' +
                  sightings[i].dateTime.hour.toString() +
                  ':' +
                  sightings[i].dateTime.minute.toString()),
            ),
            DataCell(Text(sightings[i].user)),
            DataCell(
                Text(sightings[i].birdSighted ? sightings[i].bird.name : '-')),
          ]));
    }
    super.didChangeDependencies();
  }
  int birdBoxNumber = 0;

  List<DataRow> _dataRows = List();

  @override
  Widget build(BuildContext context) {


    return Stack(
      children: [
        Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            child: Opacity(
                opacity: 0.3, child: Image.asset(Birds.robin.image[0], fit: BoxFit.fill))),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Text(
                "Redland Green Bird Box Survey",
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
              Expanded(
                  child: SingleChildScrollView(
                      child: DataTable(sortColumnIndex: 0,
                showCheckboxColumn: false,
                columns: [
                  DataColumn(label: Text('BirdBox')),
                  DataColumn(label: Text('Date')),
                  DataColumn(label: Text('User')),
                  DataColumn(label: Text('Bird')),
                  //  DataColumn(label: Text('Comment'))
                ],
                rows: _dataRows,
              ))),
            ],
          ),
        ),
      ],
    );
  }
}
