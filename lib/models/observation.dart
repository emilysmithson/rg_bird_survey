import 'package:hive/hive.dart';
import 'package:rg_bird_survey/models/user.dart';

import 'bird.dart';
part 'observation.g.dart'; // Name of the TypeAdapter that we will generate in the future

@HiveType(typeId: 1)
class Observation{
  @HiveField(0)
  int id;
  @HiveField(1)
  DateTime dateTime;
  @HiveField(2)
  int birdBox;
  @HiveField(3)
  Bird bird;
  @HiveField(4)
  String user;
  @HiveField(5)
  bool birdSighted;
  @HiveField(6)
  String comment;
  Observation(this.id, this.dateTime, this.birdBox,  this.user, this.birdSighted, this.comment, {this.bird});
}