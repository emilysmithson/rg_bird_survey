import 'package:flutter/material.dart';
import 'package:rg_bird_survey/model/main_model.dart';
import 'package:rg_bird_survey/providers/birds_provider.dart';


class Sightings extends ChangeNotifier {
  var _sightings = [
    Sighting(0, DateTime(2020, 12, 07, 12, 34, 21, 32, ), 2,  'Emily', true, 'lovely', bird: Birds.nuthatch,),
    Sighting(0, DateTime(2020, 12, 07, 11, 34, 21, 32, ), 2, 'Neil', true, 'feeding young', bird: Birds.nuthatch,),
    Sighting(0, DateTime(2020, 12, 07, 14, 34, 21, 32, ), 2,  'Jess', true, 'not sure what I saw', bird: Birds.nuthatch,),
    Sighting(0, DateTime(2020, 12, 07, 16, 34, 21, 32, ), 2,  'John', false, ''),
    Sighting(0, DateTime(2020, 12, 07, 17, 34, 21, 32, ), 2, 'Julie', true, 'nice', bird: Birds.nuthatch,),
    Sighting(0, DateTime(2020, 12, 07, 10, 34, 21, 32, ), 2, 'Emily', true, 'exciting', bird: Birds.robin,),
    Sighting(0, DateTime(2020, 12, 07, 15, 34, 21, 32, ), 2,  'Emily', true, 'lovely', bird: Birds.nuthatch,),
    Sighting(0, DateTime(2020, 12, 07, 18, 34, 21, 32, ), 2,  'Emily', true, 'lovely', bird: Birds.nuthatch,),
    Sighting(0, DateTime(2020, 12, 07, 14, 34, 21, 32, ), 2,  'Emily', false, ''),
    Sighting(0, DateTime(2020, 12, 07, 13, 34, 21, 32, ), 2,  'Emily', true, 'lovely', bird: Birds.nuthatch,)
  ];
  List<Sighting> get getSighting {
    return _sightings;
  }

  void enterSighting(Sighting _sighting) {
    _sightings.addAll([_sighting]);
    notifyListeners();
  }
}




