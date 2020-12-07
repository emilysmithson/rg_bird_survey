import 'package:flutter/material.dart';
import 'package:rg_bird_survey/model/main_model.dart';


class Sightings extends ChangeNotifier {
  var _sightings = [];
  List<Sighting> get getSighting {
    return _sightings;
  }
  void enterSighting(Sighting _sighting) {
    _sightings.addAll([_sighting]);
    notifyListeners();
  }
}




