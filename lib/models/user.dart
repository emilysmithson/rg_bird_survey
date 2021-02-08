import 'package:hive/hive.dart';

part 'user.g.dart'; // Name of the TypeAdapter that we will generate in the future

@HiveType(typeId: 3)
class User{
  @HiveField(0)
  int id;
  @HiveField(1)
  String firstName;
  @HiveField(2)
  String surname;
  @HiveField(3)
  String nickname;
  User(this.id, this.firstName, this.surname, this.nickname);
}