import 'package:flutter/material.dart';
import 'package:rg_bird_survey/models/observation.dart';
import 'package:rg_bird_survey/models/user.dart';

import 'package:rg_bird_survey/providers/birds_provider.dart';

class Observations extends ChangeNotifier {
  final List<Observation> _observations = [
    Observation(
      0,
      DateTime(
        2020,
        12,
        07,
        12,
        34,
        21,
        32,
      ),
      0,
'Emily',
      true,
      'lovely',
      bird: Birds.nuthatch,
    ),
    Observation(
      3,
      DateTime(
        2020,
        12,
        07,
        11,
        34,
        21,
        32,
      ),
      2,
      'Emily',
      true,
      'feeding young',
      bird: Birds.nuthatch,
    ),
    Observation(
      0,
      DateTime(
        2020,
        12,
        07,
        14,
        34,
        21,
        32,
      ),
      5,
      'Emily',
      true,
      'not sure what I saw',
      bird: Birds.nuthatch,
    ),
    Observation(
        5,
        DateTime(
          2020,
          12,
          07,
          16,
          34,
          21,
          32,
        ),
        2,
        'Emily',
        false,
        ''),
    Observation(
      2,
      DateTime(
        2020,
        12,
        07,
        17,
        34,
        21,
        32,
      ),
      7,
      'Emily',
      true,
      'nice',
      bird: Birds.nuthatch,
    ),
    Observation(
      0,
      DateTime(
        2020,
        12,
        07,
        10,
        34,
        21,
        32,
      ),
      0,
      'Emily',
      true,
      'exciting',
      bird: Birds.robin,
    ),
    Observation(
      1,
      DateTime(
        2020,
        12,
        07,
        15,
        34,
        21,
        32,
      ),
      2,
      'Emily',
      true,
      'lovely',
      bird: Birds.nuthatch,
    ),
    Observation(
      0,
      DateTime(
        2020,
        12,
        07,
        18,
        34,
        21,
        32,
      ),
      9,
      'Emily',
      true,
      'lovely',
      bird: Birds.nuthatch,
    ),
    Observation(
        0,
        DateTime(
          2020,
          12,
          07,
          14,
          34,
          21,
          32,
        ),
        2,
        'Emily',
        false,
        ''),
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
    )
  ];
  List<Observation> get observations {
    return _observations;
  }

  int get observationsLength {
    return _observations.length;
  }

  set  enterObservation(Observation _sighting) {
    _observations.addAll([_sighting]);
    notifyListeners();
  }
}
