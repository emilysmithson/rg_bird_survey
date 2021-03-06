import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:rg_bird_survey/models/bird.dart';
import 'package:rg_bird_survey/providers/birdboxes_provider.dart';
import 'package:rg_bird_survey/providers/birds_provider.dart';

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
  int _birdBox = -1;
  bool _isBirdSighted;
  Bird _bird;
  String _comment = '';
  List<StepState> stepStateList = [
    StepState.indexed,
    StepState.indexed,
    StepState.indexed,
    StepState.indexed,
    StepState.indexed,
    StepState.indexed,
  ];

  final TextEditingController _controller = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    _controller.clear();
    _isBirdSighted = false;
    super.initState();
  }

  int _currentStep = 0;

  @override
  Widget build(BuildContext context) {
    print(_currentStep);
    return Scaffold(
      appBar: AppBar(
        title: Text('Enter An Observation'),
      ),
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Stepper(
              physics: ClampingScrollPhysics(),
              onStepTapped: (stepNumber) {
                setState(() {
                  // _currentStep = stepNumber;
                });
              },
              controlsBuilder: (BuildContext context,
                  {VoidCallback onStepContinue, VoidCallback onStepCancel}) {
                return Row(
                  children: <Widget>[
                    ContinueButton(),
                    BackButton(),
                  ],
                );
              },
              currentStep: _currentStep,
              onStepContinue: () {
                onStepContinue();
              },
              onStepCancel: () {},
              steps: <Step>[
                _chooseBirdBoxNumber(),
                _chooseDateTime(),
                _chooseBird(),
                _commentFormField(),
                _summaryAndSubmitField(),
              ]),
        ),
      ),
    );
  }

  void onStepContinue() {
    switch (_currentStep) {
      case 0:
        {
          setState(() {
            _currentStep = 1;
          });
        }
        break;
      case 1:
        {
          setState(() {
            _currentStep = 2;
            stepStateList[1] = StepState.complete;
          });
        }
        break;
      case 2:
        {
          setState(() {
            _currentStep = 3;
          });
        }
        break;
      case 3:
        {
          setState(() {
            _currentStep = 4;
            stepStateList[3] = StepState.complete;
          });
        }
        break;
      case 4:
        {}
        break;
    }
    setState(() {
      if (stepStateList[_currentStep] == StepState.complete) {
        _currentStep++;
      }
    });
  }

  Widget ContinueButton() {
    Widget _continueButton;
    switch (_currentStep) {
      case 0:
        {
          _continueButton = stepStateList[0] == StepState.complete
              ? Text('Next')
              : SizedBox(width: 20);
        }
        break;
      case 1:
        {
          _continueButton = Text('Next');
        }
        break;
      case 2:
        {
          _continueButton = stepStateList[2] == StepState.complete
              ? Text('Next')
              : SizedBox(width: 20);
        }
        break;
      case 3:
        {
          _continueButton = Text('Next');
        }
        break;
      case 4:
        {
          _continueButton = Text('Submit');
        }
        break;
    }

    return CupertinoButton(
        onPressed: () {
          onStepContinue();
        },
        child: _continueButton);
  }

  Widget BackButton() {
    Widget _backButton;
    if (_currentStep == 0) {
      _backButton = Container();
    } else {
      _backButton = Text('Back');
    }
    return CupertinoButton(
        child: _backButton,
        onPressed: () {
          setState(() {
            _currentStep--;
          });
        });
  }

  Step _chooseBirdBoxNumber() {
    return Step(
        state: stepStateList[0],
        isActive: true,
        title: Text('Select the Bird Box number',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Wrap(
              children: BirdBoxes.birdBoxesList.map((birdBox) {
                return GestureDetector(
                  onTap: () {
                    setState(() {
                      stepStateList[0] = StepState.complete;
                      _birdBox = birdBox.id;
                    });
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      height: 80,
                      width: 60,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(
                          Radius.circular(100),
                        ),
                        border: Border.all(
                          width: _birdBox == birdBox.id ? 5.0 : 0.0,
                          color: Colors.blueAccent,
                        ),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(1.0),
                        child: Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(2.0),
                              child: Image.asset(birdBox.boxType.icon),
                            ),
                            Text(birdBox.id.toString())
                          ],
                        ),
                      ),
                    ),
                  ),
                );
              }).toList(),
            ),
            Container(
                padding: const EdgeInsets.all(20),
                height: 120,
                child: Text(_birdBox == -1
                    ? ''
                    : BirdBoxes
                        .birdBoxesList[_birdBox - 1].locationDescription))
          ],
        ));
  }

  Step _chooseDateTime() {
    return Step(
      state: stepStateList[1],
      isActive: _currentStep >= 1,
      title: Text(
        'Time of observation',
        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
      ),
      content: Container(
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
    );
  }

  Step _chooseBird() {
    return Step(
        state: stepStateList[2],
        isActive: _currentStep >= 2,
        title: Text('Please select the bird you saw'),
        content: Wrap(
          children: Birds.birdsList.map((bird) {
            return GestureDetector(
              onTap: () {
                setState(() {
                  stepStateList[2] = StepState.complete;
                  _bird = bird;
                });
              },
              child: Container(
                width: 100,
                height: 140,
                decoration: BoxDecoration(
                  border: Border.all(
                    width: _bird == bird ? 5.0 : 0.0,
                    color: Colors.blueAccent,
                  ),
                ),
                child: Container(
                  padding: const EdgeInsets.all(8.0),
                  color: Colors.white,
                  child: Column(
                    children: [
                      ClipOval(
                        child: SizedBox(
                          height: 80,
                          child: bird.image.isEmpty
                              ? bird.name == 'none'
                                  ? Container(color: Colors.grey[200])
                                  : Container(
                                      color: Colors.grey[200],
                                      child: Center(
                                          child: Text(
                                        '?',
                                        style: TextStyle(fontSize: 30),
                                      )),
                                    )
                              : Image.asset(bird.image[0],
                                  fit: BoxFit.fitHeight),
                        ),
                      ),
                      Text(bird.name)
                    ],
                  ),
                ),
              ),
            );
          }).toList(),
        ));
  }

  Step _commentFormField() {
    return Step(
        state: stepStateList[3],
        isActive: _currentStep >= 3,
        title: Text('Comment (optional)'),
        content: TextFormField(
          controller: _controller,
          textCapitalization: TextCapitalization.sentences,
        ));
  }

  Step _summaryAndSubmitField() {
    return Step(
        state: stepStateList[4],
        isActive: _currentStep >= 4,
        title: Text(
          'Summary',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        content: DataTable(
          columns: [DataColumn(label: Text('')), DataColumn(label: Text(''))],
          headingRowHeight: 0,
          rows: [
            DataRow(
              cells: [
                DataCell(Text('Bird Box number: ')),
                DataCell(Text(_birdBox.toString()))
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
                DataCell(Text(!_isBirdSighted
                    ? 'None'
                    : _bird == -1
                        ? ''
                        : _bird.name)),
              ],
            ),
            DataRow(
              cells: [
                DataCell(Text('Comment: ')),
                DataCell(Text(_comment)),
              ],
            ),
          ],
        ));
  }
}
