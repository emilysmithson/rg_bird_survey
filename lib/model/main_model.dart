import 'package:latlong/latlong.dart';

class BoxType{
  String name;
  String description;
  String icon;
  String image;
  BoxType(this.name,  this.description, this.icon, this.image);

}

class BirdBox{
  int id;
  LatLng location;
  String locationDescription;
  BoxType boxType;
  BirdBox(this.id, this.location, this.boxType, this.locationDescription);
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
  int birdBox;
  Bird bird;
  String user;
  bool birdSighted;
  String comment;
  Sighting(this.id, this.dateTime, this.birdBox,  this.user, this.birdSighted, this.comment, {this.bird});
}