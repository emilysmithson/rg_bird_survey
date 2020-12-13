import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:rg_bird_survey/model/main_model.dart';
import 'package:rg_bird_survey/providers/birdboxes_provider.dart';
import 'package:rg_bird_survey/providers/birds_provider.dart';
import 'package:rg_bird_survey/providers/sightings_provider.dart';

// Define a custom Form widget.
class DataEntryForm extends StatefulWidget {
  final double _height;
  DataEntryForm(this._height);
  @override
  DataEntryFormState createState() {
    return DataEntryFormState();
  }
}

// Define a corresponding State class.
// This class holds data related to the form.
class DataEntryFormState extends State<DataEntryForm> {
  DateTime _dateTime = DateTime.now();
  int _birdbox = -1;
  bool _birdsighted = false;
  int _bird = -1;
  String _comment = '';

  TextEditingController _controller = TextEditingController();

  double _widgetHeight = 300;
  double _sizedBoxHeight;
  final _formKey = GlobalKey<FormState>();
  ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    _sizedBoxHeight = (widget._height - _widgetHeight - 120) / 2;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
        key: _formKey,
        child: ListView(controller: _scrollController, children: <Widget>[
          SizedBox(height: _sizedBoxHeight),
          _chooseBirdBoxNumber(),
          SizedBox(height: _sizedBoxHeight),
          _chooseDateTime(),
          SizedBox(height: _sizedBoxHeight),
          _birdSighted(),
          SizedBox(height: _sizedBoxHeight),
          _chooseBird(),
          SizedBox(height: _sizedBoxHeight),
          _commentFormField(),
          SizedBox(height: _sizedBoxHeight),
          _summaryAndSubmitField(),
          SizedBox(height: _sizedBoxHeight),
        ]));
  }

  _chooseBirdBoxNumber() {
    return Container(
        color: Colors.blue[50],
        height: _widgetHeight,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Text('Select the Bird Box number',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
              Expanded(
                child: GridView.builder(
                    itemCount: BirdBoxes.birdBoxesList.length,
                    gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                      childAspectRatio: 0.7,
                      maxCrossAxisExtent: 50,
                    ),
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        onTap: () {
                          setState(() {
                            _birdbox = index;
                          });
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            border: Border.all(
                              width: _birdbox == index ? 5.0 : 0.0,
                              color: Colors.blueAccent,
                            ),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(1.0),
                            child: Column(
                              children: [
                                Image.asset(BirdBoxes
                                    .birdBoxesList[index].boxType.icon),
                                Text((index + 1).toString())
                              ],
                            ),
                          ),
                        ),
                      );
                    }),
              ),
              _birdbox == -1
                  ? Container()
                  : Text(BirdBoxes.birdBoxesList[_birdbox].locationDescription),
              IconButton(
                icon: Icon(Icons.navigate_next,
                    color: _birdbox == -1 ? Colors.grey : Colors.black),
                onPressed: () {
                  if (_birdbox != -1) {
                    _scrollController.animateTo(_sizedBoxHeight + _widgetHeight,
                        curve: Curves.linear,
                        duration: Duration(milliseconds: 500));
                  }
                },
              )
            ],
          ),
        ));
  }

  _chooseDateTime() {
    return Container(
      height: _widgetHeight,
      color: Colors.blue[50],
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            IconButton(
              icon: Icon(Icons.navigate_before),
              onPressed: () {
                _scrollController.animateTo(0,
                    curve: Curves.linear,
                    duration: Duration(milliseconds: 500));
              },
            ),
            Text(
              'Time of observation',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
            ),
            Container(
              height: 100,
              child: CupertinoTheme(
                data: CupertinoThemeData(
                  textTheme: CupertinoTextThemeData(
                    dateTimePickerTextStyle: TextStyle(
                      fontSize: 18,
                    ),
                  ),
                ),
                child: CupertinoDatePicker(
                  mode: CupertinoDatePickerMode.dateAndTime,
                  minimumYear: 2020,
                  initialDateTime: _dateTime,
                  maximumDate: DateTime.now(),
                  onDateTimeChanged: (DateTime newDateTime) {
                    _dateTime = newDateTime;
                  },
                ),
              ),
            ),
            IconButton(
              icon: Icon(Icons.navigate_next),
              onPressed: () {
                _scrollController.animateTo(
                    2 * _sizedBoxHeight + 2 * _widgetHeight,
                    curve: Curves.linear,
                    duration: Duration(milliseconds: 500));
              },
            )
          ],
        ),
      ),
    );
  }

  _birdSighted() {
    return Container(
      height: _widgetHeight,
      color: Colors.blue[50],
      child: Center(
          child: Column(
        children: [
          IconButton(
            icon: Icon(Icons.navigate_before),
            onPressed: () {
              _scrollController.animateTo(_sizedBoxHeight + _widgetHeight,
                  curve: Curves.linear, duration: Duration(milliseconds: 500));
            },
          ),
          Text('Did you spot a bird at this bird box?'),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('No'),
              Switch(
                value: _birdsighted,
                onChanged: (value) {
                  setState(() {
                    _birdsighted = value;

                    if (!_birdsighted) {
                      _bird = null;
                    }
                  });
                },
                activeTrackColor: Colors.lightGreenAccent,
                activeColor: Colors.green,
              ),
              Text('Yes'),
            ],
          ),
          IconButton(
            icon: Icon(Icons.navigate_next),
            onPressed: () {
              _scrollController.animateTo(
                  _birdsighted
                      ? 3 * _sizedBoxHeight + 3 * _widgetHeight
                      : 4 * _sizedBoxHeight + 4 * _widgetHeight,
                  curve: Curves.linear,
                  duration: Duration(milliseconds: 500));
            },
          )
        ],
      )),
    );
  }

  _chooseBird() {
    return Container(
      color: Colors.blue[50],
      width: 200,
      height: _widgetHeight,
      child: Column(
        children: [
          IconButton(
            icon: Icon(Icons.navigate_before),
            onPressed: () {
              _scrollController.animateTo(
                  2 * _sizedBoxHeight + 2 * _widgetHeight,
                  curve: Curves.linear,
                  duration: Duration(milliseconds: 500));
            },
          ),
          Text('Please select the bird you saw'),
          Expanded(
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: Birds.birdsList.length,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    setState(() {
                      _bird = index;
                    });
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      border: Border.all(
                        width: _bird == index ? 5.0 : 0.0,
                        color: Colors.blueAccent,
                      ),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        color: Colors.white,
                        child: Column(
                          children: [
                            Birds.birdsList[index].image.length == 0
                                ? Container(
                                    height: 100,
                                    width: 100,
                                    child: Center(
                                        child: Text(
                                      '?',
                                      style: TextStyle(fontSize: 30),
                                    )))
                                : Container(
                                    height: 120,
                                    width: 120,
                                    child: Image.asset(
                                        Birds.birdsList[index].image[0],
                                        fit: BoxFit.fitHeight)),
                            Text(Birds.birdsList[index].name)
                          ],
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
          IconButton(
            icon: Icon(Icons.navigate_next,
                color: _bird == -1 ? Colors.grey : Colors.black),
            onPressed: () {
              if (_bird != -1) {
                _scrollController.animateTo(
                    4 * _sizedBoxHeight + 4 * _widgetHeight,
                    curve: Curves.linear,
                    duration: Duration(milliseconds: 500));
              }
            },
          )
        ],
      ),
    );
  }

  _commentFormField() {
    return Container(
      color: Colors.blue[50],
      height: _widgetHeight,
      child: Column(
        children: [
          IconButton(
            icon: Icon(Icons.navigate_before),
            onPressed: () {
              _scrollController.animateTo(
                  _birdsighted
                      ? 3 * _sizedBoxHeight + 3 * _widgetHeight
                      : 2 * _sizedBoxHeight + 2 * _widgetHeight,
                  curve: Curves.linear,
                  duration: Duration(milliseconds: 500));
            },
          ),
          Text('Comment (optional)'),
          TextFormField(
            controller: _controller,
            textCapitalization: TextCapitalization.sentences,
          ),
          IconButton(
            icon: Icon(Icons.navigate_next),
            onPressed: () {
              _scrollController.animateTo(
                  5 * _sizedBoxHeight + 5 * _widgetHeight,
                  curve: Curves.linear,
                  duration: Duration(milliseconds: 500));
            },
          )
        ],
      ),
    );
  }

  _summaryAndSubmitField() {
    _comment = _controller.text;
    return Container(
      color: Colors.blue[50],
      height: _widgetHeight,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView(
          children: [
            IconButton(
              icon: Icon(Icons.navigate_before),
              onPressed: () {
                _scrollController.animateTo(
                    4 * _sizedBoxHeight + 4 * _widgetHeight,
                    curve: Curves.linear,
                    duration: Duration(milliseconds: 500));
              },
            ),
            Text(
              'Summary',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            DataTable(
              columns: [
                DataColumn(label: Text('')),
                DataColumn(label: Text(''))
              ],
              headingRowHeight: 0,
              rows: [
                DataRow(
                  cells: [
                    DataCell(Text('Bird Box number: ')),
                    DataCell(Text(_birdbox.toString()))
                  ],
                ),
                DataRow(
                  cells: [
                    DataCell(Text('Date: ')),
                    DataCell(Text(_dateTime.day.toString() +
                        '/' +
                        _dateTime.month.toString() +
                        '/' +
                        _dateTime.year.toString())),
                  ],
                ),
                DataRow(
                  cells: [
                    DataCell(Text('Time: ')),
                    DataCell(Text(_dateTime.hour.toString() +
                        ':' +
                        _dateTime.minute.toString())),
                  ],
                ),
                DataRow(
                  cells: [
                    DataCell(Text('Bird: ')),
                    DataCell(Text(!_birdsighted
                        ? 'None'
                        : _bird == -1
                            ? ''
                            : Birds.birdsList[_bird].name)),
                  ],
                ),
                DataRow(
                  cells: [
                    DataCell(Text('Comment: ')),
                    DataCell(Text(_comment)),
                  ],
                ),
              ],
            ),
            ElevatedButton(
              onPressed: () {
                Provider.of<Sightings>(context, listen: false).enterSighting(Sighting(
                    Provider.of<Sightings>(context, listen: false).getSightingsLenghth(),
                    _dateTime,
                    _birdbox,
                    'not sure',
                    _birdsighted,
                    _comment,
                    bird: _birdsighted ? Birds.birdsList[_bird] : null));
              },
              child: Text('Submit'),
            ),
          ],
        ),
      ),
    );
  }
}
