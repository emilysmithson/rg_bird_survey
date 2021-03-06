import 'package:flutter/material.dart';

import 'package:rg_bird_survey/database/database_helper.dart';
import 'package:rg_bird_survey/models/observation.dart';

import '../database/database_helper.dart';

class Observations extends ChangeNotifier {
  List<Observation> _observations = [];

  Future<bool> fetchObservations() async {
    _observations.clear();
    var _hiveObservations = await DatabaseHelper.getObservations();
    for (var i = 0; i < _hiveObservations.length; i++) {
      _observations.add(_hiveObservations[i]);
    }
return true;
  }

  List<Observation> get observations {
    return _observations;
  }

  int get observationsLength {
    return _observations.length;
  }

  set enterObservation(Observation _sighting) {
    _observations.add(_sighting);
    DatabaseHelper.addObservation(_sighting);
    notifyListeners();
  }
}
