import 'package:rg_bird_survey/models/bird.dart';

class Birds {
  static final Bird robin = Bird(
      'Robin',
      'The UK\'s favourite bird - with its bright red breast it is familiar throughout the year and especially at Christmas! Males and females look identical, and young birds have no red breast and are spotted with golden brown. Robins sing nearly all year round and despite their cute appearance, they are aggressively territorial and are quick to drive away intruders. They will sing at night next to street lights.',
      [
        'assets/images/birds/robin.jpg',
        'assets/images/birds/robin2.jpg',
        'assets/images/birds/robin3.jpg'
      ],
      0);
  static final Bird greatTit = Bird(
    'Great Tit',
    '',
    ['assets/images/birds/great_tit.jpg'],
    1,
  );
  static final Bird blueTit = Bird(
    'Blue Tit',
    '',
    ['assets/images/birds/blue_tit.jpeg'],
    2,
  );
  static final Bird blackbird = Bird(
    'Blackbird',
    '',
    ['assets/images/birds/blackbird.jpg'],
    3,
  );
  static final Bird songThrush = Bird(
    'Song Thrush',
    '',
    ['assets/images/birds/song_thrush.jpg'],
    4,
  );
  static final Bird nuthatch = Bird(
    'Nut Hatch',
    '',
    ['assets/images/birds/nut_hatch.jpg'],
    5,
  );
  static final Bird wren = Bird(
    'Wren',
    '',
    ['assets/images/birds/wren.jpg'],
    6,
  );
  static final Bird unknown = Bird(
    'Unknown',
    '',
    [],
    7,
  );
  static final Bird other = Bird(
    'Other',
    '',
    [],
    8,
  );
  static final Bird unidentified = Bird(
    'Unidentified',
    '',
    [],
    9,
  );
  static final Bird none = Bird(
    'none',
    '',
    [],
    10,
  );
  static final List<Bird> birdsList = [
    robin,
    greatTit,
    blueTit,
    blackbird,
    songThrush,
    nuthatch,
    wren,
    other,
    unidentified,
    none,
  ];
}
