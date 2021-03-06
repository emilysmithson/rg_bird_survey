import 'package:hive/hive.dart';
import 'package:rg_bird_survey/models/observation.dart';
import 'package:rg_bird_survey/providers/birds_provider.dart';

class DatabaseHelper {
  static var box;

  static Future<bool> openBox() async {
    box = await Hive.openBox('observations');
    return true;
  }

  static void addObservation(Observation observation) async {
    await box.add();
  }

  static Future<List<dynamic>> getObservations() async {

print('getting observations');
print(box.length);
    List<Observation> _observations;
    for (int i = 0; i < box.length; i++) {
      print(i);
      print(box.get(i).user);
      _observations.add(box.get(i));
      print(_observations.length);
    }
    print(_observations.length);
    return _observations;
  }

  static void addDummyData() async {
    final _observations = [
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
        1,
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
        2,
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
         3,
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
        4,
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
       5,
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
        6,
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
        7,
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
          8,
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
        9,
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
    //  var box = await Hive.openBox('observations');
    await box.clear();
    for (int i = 0; i < _observations.length; i++) {
      await box.put(_observations[i].id, _observations[i]);
      //   await box.close();
    }
  }
}
