


import 'package:rg_bird_survey/models/bird.dart';

class Birds {
  static final Bird robin = Bird('Robin', '', ['assets/images/birds/robin.jpg', 'assets/images/birds/robin2.jpg', 'assets/images/birds/robin3.jpg']);
  static final Bird greatTit = Bird('Great Tit', '', ['assets/images/birds/great_tit.jpg']);
  static final Bird blueTit = Bird('Blue Tit', '', ['assets/images/birds/blue_tit.jpeg']);
  static final Bird blackbird = Bird('Blackbird', '', ['assets/images/birds/blackbird.jpg']);
  static final Bird songThrush = Bird('Song Thrush', '', ['assets/images/birds/song_thrush.jpg']);
  static final Bird nuthatch = Bird('Nut Hatch', '', ['assets/images/birds/nut_hatch.jpg']);
  static final Bird wren = Bird('Wren', '', ['assets/images/birds/wren.jpg']);
  static final Bird unknown = Bird('Unknown', '', []);
  static final Bird other = Bird('Other', '', []);
  static final Bird unidentified = Bird('Unidentified', '', []);
  static final List<Bird> birdsList = [
    robin,
    greatTit,
    blueTit,
    blackbird,
    songThrush,
    nuthatch,
    wren,
    other,
    unidentified
  ];
}
