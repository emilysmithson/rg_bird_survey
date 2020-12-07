import 'package:latlong/latlong.dart';

class BoxType{
  String name;
  String description;
  String image;
  BoxType(this.name,  this.description, this.image);

}

class BirdBox{
  int id;
  LatLng location;
  BoxType boxType;
  BirdBox(this.id, this.location, this.boxType);
}

class Bird{
  String name;
  String description;
  List<String> image;
  Bird(this.name, this.description, this.image);
}

class User{
  String firstName;
  String surname;
  String nickname;
}

class Sighting{
  int id;
  DateTime dateTime;
  BirdBox birdBox;
  Bird bird;
  User user;
  Sighting(this.id, this.dateTime, this.birdBox, this.bird, this.user);
}