import 'package:latlong/latlong.dart';
import 'package:rg_bird_survey/models/bird_box.dart';

import 'birdboxtype_provider.dart';

class BirdBoxes {
  static final BirdBox birdBox1 = BirdBox(
      1,
      LatLng(51.4751350, -2.6099130),
      BirdBoxTypes.seville,
      'This bird box is located in the woodland which runs parallel to Coldharbour Road. '
      'It is just to the left of the end of the path leading down from St Oswald\'s Road.');
  static final BirdBox birdBox2 = BirdBox(
      2,
      LatLng(51.4752550, -2.6096700),
      BirdBoxTypes.alicante,
      'This bird box is located in the woodland which runs parallel to Coldharbour Road. '
      'If you walk down the path from St Oswald\'s Road, it is just beyond the path to the left.');
  static final BirdBox birdBox3 = BirdBox(
      3,
      LatLng(51.4754010, -2.6095980),
      BirdBoxTypes.alicanteOpen,
      'If you walk down the path from St Oswald\'s Road, it is beyond the path to the left.');
  static final BirdBox birdBox4 = BirdBox(
      4,
      LatLng(51.4753810, -2.6095150),
      BirdBoxTypes.seville,
      'If you walk down the path from St Oswald\'s Road, it is beyond the path to the left.');
  static final BirdBox birdBox5 = BirdBox(
      5,
      LatLng(51.4755210, -2.6094810),
      BirdBoxTypes.seville,
      'If you walk down the path from St Oswald\'s Road, it is in the woodland on your left.');
  static final BirdBox birdBox6 = BirdBox(
      6,
      LatLng(51.4748, -2.609345),
      BirdBoxTypes.alicanteOpen,
      'On the front of two trees between St Oswald\'s Road near the memorial stone.');
  static final BirdBox birdBox7 = BirdBox(7, LatLng(51.4754220, -2.6090510),
      BirdBoxTypes.alicante, 'Located opposite number 6 Cossins Road.');
  static final BirdBox birdBox8 = BirdBox(8, LatLng(51.4752940, -2.6089000),
      BirdBoxTypes.seville, 'Located opposite number 8 Cossins Road.');
  static final BirdBox birdBox9 = BirdBox(
      9,
      LatLng(51.4749720, -2.6084250),
      BirdBoxTypes.alicante,
      'Located on the tree below the steps down from Cossins Road');
  static final BirdBox birdBox10 = BirdBox(
      10,
      LatLng(51.47177, -2.60810),
      BirdBoxTypes.alicanteOpen,
      'Located on the Veteran Ash Tree at the back of St Oswald\'s Road');
  static final BirdBox birdBox11 = BirdBox(
      11,
      LatLng(51.4742220, -2.6069800),
      BirdBoxTypes.alicante,
      'On the oak tree opposite the dell above the Veteran Ash Trees');
  static final BirdBox birdBox12 = BirdBox(
      12,
      LatLng(51.4745460, -2.6069240),
      BirdBoxTypes.alicanteOpen,
      'In the dell on a large tree near the Metford Road allotment fence where the fence turns away from the main path');
  static final BirdBox birdBox13 = BirdBox(
      13,
      LatLng(51.4745780, -2.6066050),
      BirdBoxTypes.seville,
      'In the dell on the beech tree by the Metford Road Allotment fence');
  static final BirdBox birdBox14 = BirdBox(14, LatLng(51.4743460, -2.6065850),
      BirdBoxTypes.seville, 'In the dell on the oak tree by the path');
  static final BirdBox birdBox15 = BirdBox(
      15,
      LatLng(51.4733320, -2.6067980),
      BirdBoxTypes.seville,
      'On the first tree to the righgt of the triangle of grass by the tennis court');
  static final BirdBox birdBox16 = BirdBox(
      16,
      LatLng(51.4734230, -2.6061690),
      BirdBoxTypes.seville,
      'On the Plane tree second closest to the playground by the bowling club fence.');

  static final List<BirdBox> birdBoxesList = [
    birdBox1,
    birdBox2,
    birdBox3,
    birdBox4,
    birdBox5,
    birdBox6,
    birdBox7,
    birdBox8,
    birdBox9,
    birdBox10,
    birdBox11,
    birdBox12,
    birdBox13,
    birdBox14,
    birdBox15,
    birdBox16,
  ];
}
