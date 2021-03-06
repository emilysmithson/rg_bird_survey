import 'package:hive/hive.dart';

part 'bird.g.dart'; // Name of the TypeAdapter that we will generate in the future

@HiveType(typeId: 2)
class Bird {
  @HiveField(0)
  String name;
  @HiveField(1)
  String description;
  @HiveField(2)
  List<String> image;
  @HiveField(3)
  int birdNumber;
  Bird(this.name, this.description, this.image, this.birdNumber);
}
