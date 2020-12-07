import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rg_bird_survey/model/main_model.dart';
import 'package:rg_bird_survey/providers/birdboxes_provider.dart';
import 'package:rg_bird_survey/providers/sightings_provider.dart';
import '../providers/birds_provider.dart';

class BirdBoxInformation extends StatefulWidget {
  @override
  _BirdBoxInformationState createState() => _BirdBoxInformationState();
}

class _BirdBoxInformationState extends State<BirdBoxInformation> {
  int birdBoxNumber = 0;
  @override
  Widget build(BuildContext context) {
    List<Sighting> sightings = Provider.of<Sightings>(context).getSighting;
    List<DataRow> dataRows = List();
    for (int i = 0; i < sightings.length; i++) {
      dataRows.add(DataRow(cells: [
        DataCell(Text(
          sightings[i].dateTime.day.toString() +
              '/' +
              sightings[i].dateTime.month.toString() +
              '/20 ' + sightings[i].dateTime.hour.toString() +
          ':' +
          sightings[i].dateTime.minute.toString()),
        ),
        DataCell(Text(sightings[i].user)),
        DataCell(Text(sightings[i].birdSighted ? sightings[i].bird.name : '-')),
        DataCell(Text(sightings[i].comment)),
      ]));
    }

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Container(
                width: 200,
                height: 200,
                child: Image.asset(
                  BirdBoxes.birdBoxesList[birdBoxNumber].boxType.image,
                  fit: BoxFit.fill,
                )),
          ),
          Text(
            'Bird Box ' +
                BirdBoxes.birdBoxesList[birdBoxNumber].id.toString() +
                ': ' +
                BirdBoxes.birdBoxesList[birdBoxNumber].boxType.name,
            style: TextStyle(fontSize: 24),
          ),
          SizedBox(height: 8),
          Text(BirdBoxes.birdBoxesList[birdBoxNumber].boxType.description),
          SizedBox(height: 8),
          FloatingActionButton.extended(
              onPressed: () {}, label: Text('Add Observation')),
          SizedBox(height: 8),
          Text('Observations'),
          Expanded(
              child: SingleChildScrollView(child: DataTable(
            columns: [
              DataColumn(label: Text('Date')),
              DataColumn(label: Text('User')),
              DataColumn(label: Text('Bird')),
              DataColumn(label: Text('Comment'))
            ],rows: dataRows,
          ))),

        ],
      ),
    );
  }
}
