import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rg_bird_survey/providers/birdboxes_provider.dart';
import 'package:rg_bird_survey/providers/observations_provider.dart';

class BirdBoxInformation extends StatefulWidget {
  final int birdBoxNumber;
  BirdBoxInformation(this.birdBoxNumber);
  @override
  _BirdBoxInformationState createState() => _BirdBoxInformationState();
}

class _BirdBoxInformationState extends State<BirdBoxInformation> {
  final List<DataRow> _dataRows = [];
  int _birdBoxNumber;

  @override
  void didChangeDependencies() {
    _birdBoxNumber = widget.birdBoxNumber;
    var sightings = Provider.of<Observations>(context).observations;
    for (var i = 0; i < sightings.length; i++) {
      if (sightings[i].birdBox == _birdBoxNumber) {
        _dataRows.add(DataRow(cells: [
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
          DataCell(Text(sightings[i].comment)),
        ]));
      }
    }
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView(
          children: [
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Container(
                  width: 200,
                  height: 200,
                  child: Image.asset(
                      BirdBoxes.birdBoxesList[_birdBoxNumber].boxType.image,
                      fit: BoxFit.fitHeight)),
            ),
            Text(
              'Bird Box ' +
                  BirdBoxes.birdBoxesList[_birdBoxNumber].id.toString() +
                  ': ' +
                  BirdBoxes.birdBoxesList[_birdBoxNumber].boxType.name,
              style: TextStyle(fontSize: 24),
            ),
            SizedBox(height: 12),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Expanded(
                    child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      Text(BirdBoxes
                          .birdBoxesList[_birdBoxNumber].boxType.description),
                      SizedBox(height: 12),
                      Text(BirdBoxes
                          .birdBoxesList[_birdBoxNumber].locationDescription),
                    ],
                  ),
                )),
                Column(
                  children: [
                    IconButton(icon: Icon(Icons.map), onPressed: () {}),
                    Text('Show on map')
                  ],
                )
              ],
            ),
            SizedBox(height: 12),
            FloatingActionButton.extended(
                onPressed: () {}, label: Text('Add Observation')),
            SizedBox(height: 8),
            Text('Observations'),
            SizedBox(height: 8),
            Container(
                height: 300,
                child: Card(
                  color: Colors.green[100],
                  child: SingleChildScrollView(
                      child: DataTable(
                    columns: [
                      DataColumn(label: Text('Date')),
                      DataColumn(label: Text('User')),
                      DataColumn(label: Text('Bird')),
                      DataColumn(label: Text('Comment'))
                    ],
                    rows: _dataRows,
                  )),
                )),
          ],
        ),
      ),
    );
  }
}
